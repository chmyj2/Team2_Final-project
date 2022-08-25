function btnCorrection()  {
	
	const phNmbBtn = document.getElementById('reserve-phnBtn');
	
	
	if (phNmbBtn.value=="수정") {
		
		
		$(".span-text-input").attr("disabled", false);
		$(".span-text-input").css('background-color', 'white');
		$(".span-text-input").css('border', '2px solid black');
		phNmbBtn.src="resources/t2_img/premium-icon-checked-3502463.png";
		
		
		phNmbBtn.value = "확인"
		
	}else if (phNmbBtn.value=="확인") {
		
		let phNmb = $(".span-text-input").val();
		$(".span-text-input").attr("disabled", true);
		$(".span-text-input").css('background-color', '#f9f9f9');
		$(".span-text-input").css('border', 'none');
		
		phNmbBtn.src="resources/t2_img/free-icon-edit-8036025 (1).png"
		const innerphNmb = document.getElementById('reserve-memberphNmn');
		innerphNmb.value =phNmb;
		
		phNmbBtn.value = "수정"
	}
	
	
		
		
	}

function petNamebtnCorrection() {

const petNameBtn = document.getElementById('reserve-petNameBtn');


if (petNameBtn.value=="수정") {
	
	$(".span-text-petName-input").attr("disabled", false);
	$(".span-text-petName-input").css('background-color', 'white');
	$(".span-text-petName-input").css('border', '2px solid black');

	
	petNameBtn.src="resources/t2_img/premium-icon-checked-3502463.png";
	petNameBtn.value = "확인"
	
}else if (petNameBtn.value=="확인") {
	
	
	let petName = $(".span-text-petName-input").val();
	
	$(".span-text-petName-input").attr("disabled", true);
	$(".span-text-petName-input").css('background-color', '#f9f9f9');
	$(".span-text-petName-input").css('border', 'none');
	
	petNameBtn.src="resources/t2_img/free-icon-edit-8036025 (1).png"
	const innerpetName = document.getElementById('reserve-pet-name');
	innerpetName.value =petName;
	
	petNameBtn.value = "수정"
}

}


function petAgebtnCorrection() {
	
	const petAgeBtn = document.getElementById('reserve-petAgeBtn');


	if (petAgeBtn.value=="수정") {
		
		$(".span-text-petAge-input").attr("disabled", false);
		$(".span-text-petAge-input").css('background-color', 'white');
		$(".span-text-petAge-input").css('border', '2px solid black');

		
		petAgeBtn.src="resources/t2_img/premium-icon-checked-3502463.png";
		petAgeBtn.value = "확인"
		
	}else if (petAgeBtn.value=="확인") {
		
		
		let petAge = $(".span-text-petAge-input").val();
		
		$(".span-text-petAge-input").attr("disabled", true);
		$(".span-text-petAge-input").css('background-color', '#f9f9f9');
		$(".span-text-petAge-input").css('border', 'none');
		
		petAgeBtn.src="resources/t2_img/free-icon-edit-8036025 (1).png"
		const innerpetAge = document.getElementById('reserve-pet-birth');
		
		innerpetAge.value = petAge;
		
		petAgeBtn.value = "수정"
	}
	

}
function petTypebtnCorrection() {
	const petTypeBtn = document.getElementById('reserve-petTypeBtn');


	if (petTypeBtn.value=="수정") {
		
		$(".span-text-petType-input").attr("disabled", false);
		$(".span-text-petType-input").css('background-color', 'white');
		$(".span-text-petType-input").css('border', '2px solid black');

		
		petTypeBtn.src="resources/t2_img/premium-icon-checked-3502463.png";
		petTypeBtn.value = "확인"
		
	}else if (petTypeBtn.value=="확인") {
		
		
		let petType = $(".span-text-petType-input").val();
		
		$(".span-text-petType-input").attr("disabled", true);
		$(".span-text-petType-input").css('background-color', '#f9f9f9');
		$(".span-text-petType-input").css('border', 'none');
		
		petTypeBtn.src="resources/t2_img/free-icon-edit-8036025 (1).png"
		const innerpetType = document.getElementById('reserve-pet-type');
		innerpetType.value = petType;
		
		petTypeBtn.value = "수정"
	}

}
