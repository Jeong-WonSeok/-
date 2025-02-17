
document.addEventListener('click', () => {
	if(event.target.matches('#btnZipcode')){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            console.log(data);
	            let fullAddr = '';
	            let extraAddr = '';
	
	            if (data.userSelectedType === 'R') {
	                fullAddr = data.roadAddress;
	            } else {
	                fullAddr = data.jibunAddress;
	            }
	
	            if (data.userSelectedType = 'R') {
	                if (data.bname !== '') {
	                    extraAddr += data.bname;
	                }
	                if (data.buildingName !== '') {
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
	            }
	
	            document.formInfo.empPostal.value = data.zonecode;
	            document.formInfo.empAddress.value = fullAddr;
	            
	        }
	    }).open();
	}
});
