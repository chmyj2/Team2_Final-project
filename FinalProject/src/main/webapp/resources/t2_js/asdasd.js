/**
 * 
 */// execute D3
(function() {
	var myScript = document.createElement('script');
	myScript.src = 'https://lab.soov.io/lib/d3/d3-3.5.16.min.js';
	console.log("kusa client loaded");
	const CONTAINER_SELECTOR = '.place-review';

	// URL change detect
	let currentUrl = null;
	setInterval(function(){
		if(currentUrl != location.href && document.querySelector(CONTAINER_SELECTOR)){
			currentUrl = location.href;
			loadAI();
		}
	}, 500)

	document.head.appendChild(myScript);

	function loadAI() {
		let path = window.location.pathname.substr(1);
		
		if (path && (path === 'hospital' || path === 'pharmacy')) {
			let facilityType = window.location.pathname.substr(1);
			let urlObj = new URL(window.location.href);
			let facilityId = urlObj.searchParams.get("id");
			let test = urlObj.searchParams.get("test");
			if(test != "true")
				return;

			
			// TODO 이미지 경로 수정
			const TEMPLATE_URL = "/ai_review.html";
			appendAIContainer(TEMPLATE_URL, CONTAINER_SELECTOR)
				.then(function(response) {
					if(response) {
						getPositiveScore(facilityId, facilityType)
							.then(function(score) {
								if(!score.positive_score)
									throw Error('empty review');
								drawReviewAI(score.positive_score, score.negative_score);
							})
							.catch(function(error) {
								drawReviewAI(0, 0);
							})
					}
				})
				.catch(function(error){
					console.error(error.statusText);
				});
		}
	
	
		function appendAIContainer(url, selector) {
			return new Promise(function(resolve, reject) {
				var xhr = new XMLHttpRequest();
				xhr.open("GET", url);
				xhr.onload = function() {
					if(xhr.status >= 200 && xhr.status < 300) {
						let parser = new DOMParser();
						let doc = parser.parseFromString(xhr.responseText, "text/html");
						let node = doc.querySelector("body > section");
						if(node) {
							let reviewAiContainer = document.querySelector(selector);
							reviewAiContainer.prepend(node);
							resolve(true);
						}
					} else {
						reject({
							status: xhr.status,
							statusText: xhr.statusText
						});
					}
				}
				xhr.send();
			});
		}
	
	
		function getPositiveScore(facilityId, facilityType) {
			let url = "https://kusa.petraschu.com:51039/analyze?facility_id=" + facilityId + "&facility_type=" + facilityType;
			return new Promise(function(resolve, reject) {
				var xhr = new XMLHttpRequest();
				xhr.open("GET", url);
				xhr.onload = function() {
					if(xhr.status >= 200 && xhr.status < 300) {
						resolve(JSON.parse(xhr.response));
					} else {
						reject({
							status: xhr.status,
							statusText: xhr.statusText
						});
					}
				}
				xhr.send();
			});
		}
	
		function drawReviewAI(positiveScore, negativeScore) {
			const SOOV_CHART_POSITIVE_SELECTOR = '#soov_chart_positive';
			const SOOV_CHART_NEGATIVE_SELECTOR = '#soov_chart_negative';
			
			let review_count = 20;
			let count = document.querySelector('.review-total > .left > .text').textContent.match(/\d+/g)[0];
			if(count && parseInt(count) <20)
				review_count = parseInt(count);
				
			let reviewComment = '';
			if(positiveScore !== 0) {
				reviewComment = `
					<img src="/img/kusa/icons8-ai-64.png" alt="AI이미지" />
					<div style="display: block">
						총 <span>${count}</span>개의 후기 분석 결과,<br/>
						만족도가 <span>${getStatus(positiveScore)}</span> 병원입니다.
					</div>
				`;
			} else {
				reviewComment = `
					<img src="/img/kusa/icons8-ai-64.png" alt="AI이미지" />
					<div style="display: block">분석할 후기가 없습니다.</div>
				`;
			}
	
			const positive_dataset = [
				{ name: "main", percent: positiveScore, color: "#2aa9bc", text_color: "#fffce1"},
				{ name: "sub", percent: 1-positiveScore, color: "#e0e5e9", text_color: "#e0e5e9"}
			];
			const negative_dataset = [
				{ name: "main", percent: negativeScore, color: "#e47f85", text_color: "#fffce1"},
				{ name: "sub", percent: 1-negativeScore, color: "#e0e5e9", text_color: "#e0e5e9"}
			];
	
			drawChart(SOOV_CHART_POSITIVE_SELECTOR, positive_dataset);
			drawChart(SOOV_CHART_NEGATIVE_SELECTOR, negative_dataset);
			document.querySelector('#analyzed-review').innerHTML = reviewComment;
		}
	
		function drawChart(soovChartSelector, dataset) {
			let pie = d3.layout
				.pie()
				.value(function(d) {
					return d.percent;
				})
				.sort(null);
	
			let width = 350, height = 350;
			let outerRadius = 140;
			let innerRadius = 90;
	
			let arc = d3.svg.arc()
				.innerRadius(innerRadius)
				.outerRadius(outerRadius);
	
			let svg = d3.select(soovChartSelector)
				.append("svg")
				.attr({
					width: width,
					height: height,
					class: "shadow",
				})
				.append("g")
				.attr({
					transform: "translate(" + width / 2 + "," + height / 2 + ")",
				});
	
			let path = svg.selectAll("path")
				.data(pie(dataset))
				.enter()
				.append("path")
				.attr({
					d: arc,
					fill: function(d, i) {
						return d.data.color;
					},
				});
	
			let text = svg.selectAll("text")
				.data(pie(dataset).filter(function(d){return d.data.name === 'main'}))
				// .data(pie(dataset))
				.enter()
				.append("text")
				.transition()
				.duration(200)
				.attr("transform", function(d) {
					let c = arc.centroid(d);
					// return "translate(" + c[0] + "," + c[1] + ")";
					return "translate("+arc.centroid(d)+")";
				})
				// .attr("transform", "translate(115, 0)")
				.attr("dy", ".4em")
				.attr("text-anchor", "middle")
				.text(function(d) {
					let pct = d.data.percent * 100;
					return Math.floor(pct) + "%";
					// return d.data.percent+"%";
				})
				.style({
					fill: function(d, i) {
						return d.data.text_color;
					},
					'font-size:': '10px'
				});
		}
	
		function getStatus(score) {
			if(score >= 0.95) return '매우 높은';
			else if(score >= 0.9) return '높은';
			else if(score >= 0.8) return '보통 이상';
			else if(score >= 0.7) return '보통';
			else if(score > 0.6) return '낮은';
			else return '매우 낮은';
		}
	}
})();

