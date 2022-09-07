		
		$(function() {
			/*ready!*/
		});

		function selectACategory() {
			var categoryNum = document.getElementById('categoryNumSelect');
			var cv = categoryNum.options[categoryNum.selectedIndex].value;
			location.href="loadByCategory.go?categoryNum="+cv;
		};
		