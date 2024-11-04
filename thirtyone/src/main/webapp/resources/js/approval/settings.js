flatpickr("#proxyStartDate", {
	dateFormat: "Y-m-d",
	allowInput: true,
	conjunction: " ~ "
});

flatpickr("#proxyEndDate", {
	dateFormat: "Y-m-d",
	allowInput: true
});

$('#approvalLineSettingSaveBtn').on('click', function(){
	const aplForm = [];
	$('.approval-line-item').each(function(){
		const element = {};
		element.aprLineName = $(approvalLineSettingNameForm).val();
		element.approverDeptId = $(this).attr('data-deptId');
		element.aprLineApprover = $(this).attr('data-empid');
		element.aprLineSeq = $(this).attr('data-seq');
		
		element.empName = $(this).find('.apl-emp-name').text();
		element.position = $(this).find('.apl-emp-position').text();
		
		element.handler = 'save';
		
		aplForm.push(element);
	});
	console.log(aplForm);
	
	$.ajax({
		url: "../emp/setApprovalLine",
		method: "post",
		contentType: "application/json",
		data: JSON.stringify(aplForm),
		success: function(data){
			if(data.errors) {
				console.log('유효성 검증 실패, 에러 출력');
				const errorMessage = $('#approvalLineFormValidation');
				
				if(data.duplication) {
					errorMessage.text(data.duplication);
				} else if(data.seqError) {
					errorMessage.text(data.seqError);
				} else {
					console.log('데이터가 전송되지 않음. 서버에서 확인 요망');
				}
				
			}
			if(data.status == 'ok') {
				console.log('데이터 삽입 성공');
				$.ajax({
					url: "getApprovalLineList?pageNo=1",
					method: "get",
					success: function(data) {
						$('#settingApprovalLineList').html(data);
					},
					error: function (xhr, status, error) {
			            console.log('Error: ' + error);
			        }
				});
			}
		},
		error: function (xhr, status, error) {
            console.log('Error: ' + error);
        },
	});
});

$('#approvalLineSettingUpdateBtn').on('click', function(){
	const aplForm = [];
	$('.approval-line-item').each(function(){
		const element = {};
		element.aprLineName = $(approvalLineSettingNameForm).val();
		element.approverDeptId = $(this).attr('data-deptId');
		element.aprLineApprover = $(this).attr('data-empid');
		element.aprLineSeq = $(this).attr('data-seq');
		element.aprLineIndex = $(this).attr('data-index');
		
		element.empName = $(this).find('.apl-emp-name').text();
		element.position = $(this).find('.apl-emp-position').text();
		
		element.handler = 'update';
		
		aplForm.push(element);
	});
	console.log(aplForm);
	
	$.ajax({
		url: "../emp/setApprovalLine",
		method: "post",
		contentType: "application/json",
		data: JSON.stringify(aplForm),
		success: function(data){
			if(data.errors) {
				console.log('유효성 검증 실패, 에러 출력');
				const errorMessage = $('#approvalLineFormValidation');
				
				if(data.duplication) {
					errorMessage.text(data.duplication);
				} else if(data.seqError) {
					errorMessage.text(data.seqError);
				} else {
					console.log('데이터가 전송되지 않음. 서버에서 확인 요망');
				}
				
			}
			if(data.status == 'ok') {
				console.log('데이터 삽입 성공');
				$.ajax({
					url: "getApprovalLineList?pageNo=1",
					method: "get",
					success: function(data) {
						$('#settingApprovalLineList').html(data);
					},
					error: function (xhr, status, error) {
			            console.log('Error: ' + error);
			        }
				});
			}
		},
		error: function (xhr, status, error) {
            console.log('Error: ' + error);
        },
	});
});

$('#settingApprovalLineList').on('click', '.callApprovalLine', function(e) {
	e.stopPropagation();
	const aprLineName = $(this).closest('tr.aprLineIndex').find('span').text();
	const aprLineIndex = $(this).closest('tr.aprLineIndex').attr('data-aprLineIndex');
	console.log(aprLineName);
	console.log(aprLineIndex);
	
	$.ajax({
		url: '../emp/getEmpApprovalLine',
		method: 'get',
		data: {aprLineName, aprLineIndex},
		success: function(data) {
			$('#approvalLineBox').empty();
			$('#approvalLineSettingNameForm').val(data.list[0].aprLineName);
			for(let item of data.list) {
				const aprLineData = `
					<div class="approval-line-item" data-deptId="${item.approverDeptId}" data-empid="${item.aprLineApprover}" data-seq="${item.aprLineSeq}" data-index="${aprLineIndex}" style="width: 85%">
			            <div>
			                <i class="fas fa-user pe-2"></i> <b class="apl-emp-name">${item.empName}</b> <b class="apl-emp-position">${item.position}</b>
			            </div>
			            <div>
			                <button class="btn btn-sm btn-outline-secondary line-handler-btn btn-line-up" ><i class="fas fa-arrow-up"></i></button>
			                <button class="btn btn-sm btn-outline-secondary line-handler-btn btn-line-down" ><i class="fas fa-arrow-down"></i></button>
			                <button class="btn btn-sm btn-outline-danger line-handler-btn btn-line-remove" ><i class="fas fa-times"></i></button>
			            </div>
					</div>`;
					$('#approvalLineBox').append(aprLineData);
			}
			
		},
		error: function (xhr, status, error) {
            console.log('Error: ' + error);
        },
	});
});

$('#approvalLineClearBtn').on('click', function(){
	$('#approvalLineBox').empty();
});

$('#approvalSettingsContainer').on('click', '.removeApprovalLine', function(e){
	e.stopPropagation();
	
	if($(this).closest('tr.aprLineIndex').length > 0) {
		aprLineIndex = $(this).closest('tr.aprLineIndex').attr('data-aprLineIndex');
	} else {
		aprLineIndex = $(this).closest('#aplFormContainer').find('.approval-line-item').attr('data-index');
	}
	
	$.ajax({
		url: '../emp/deleteEmpApl',
		method: 'post',
		data: {aprLineIndex},
		success: function(data) {
			if(data.status == 'ok') {
				$.ajax({
					url: "getApprovalLineList?pageNo=1",
					method: "get",
					success: function(data) {
						$('#settingApprovalLineList').html(data);
						$('#approvalLineBox').empty();
					},
					error: function (xhr, status, error) {
			            console.log('Error: ' + error);
			        }
				});
			}
		},
		error: function (xhr, status, error) {
            console.log('Error: ' + error);
        },
	});
});

$('#settingApprovalLineList').on('click', '#approvalLineSearch', function(e){
	e.stopPropagation();
	
	const keyword = $('#approvalLineSearch').prev().val();
	const pageNo = 1;
	$.ajax({
		url: "searchApprovalLine",
		method: "get",
		data: {keyword, pageNo},
		success: function(data) {
			const table = $('table.table-font-sm');
			const tbody = table.find('tbody');
			tbody.empty();
			
			for(let dto of data.resultList) {
				const context = `
					<tr class="align-middle text-center aprLineIndex" data-aprLineIndex="${dto.aprLineIndex}">
			            <th scope="row">
			                <span class="text-custom-grey">${dto.aprLineName}</span>
			            </th>
			            <td>
			            	<div class="d-flex align-items-center justify-content-center">
				                 <button type="button" class="btn btn-dark btn-sm btn-custom-grey me-1 callApprovalLine">조회</button>
				                 <button type="button" class="btn btn-secondary btn-sm btn-custom-lightgrey removeApprovalLine">삭제</button>
			            	</div>
			            </td>
		        	</tr>
				`;
				tbody.append(context);
			}
			
			const pager = JSON.parse(data.pager);
			console.log(pager);
			const pagination = $('ul.pagination');
			pagination.empty();
			
			let listContext = `
				<li class="page-item ${pager.groupNo > 1 ? '' : 'disabled'}">
		    		<a id="pageGroupBtn-${pager.startPageNo-1}" class="pagination-size page-link text-dark page-border-none group-move" href="#" tabindex="-1" aria-disabled="true"><i class="fa-solid fa-chevron-left page-font-size-sm"></i></a>
		      	</li>`;
			for(let i=pager.startPageNo; i<=pager.endPageNo; i++) {
				listContext += `<li class="page-item ${pager.pageNo == i ? 'disabled' : ''}"><a class="pagination-size page-link text-dark page-border-none page-font-size-sm page-move" href="#">${i}</a></li>`;
			}
		    listContext += `
		    	<li class="page-item ${pager.groupNo >= pager.totalGroupNo ? 'disabled' : ''}">
		        	<a id="pageGroupBtn-${pager.endPageNo+1}" class="pagination-size page-link text-dark page-border-none group-move" href="#"><i class="fa-solid fa-chevron-right page-font-size-sm"></i></a>
		      	</li>`;
		    pagination.append(listContext);
		},
		error: function (xhr, status, error) {
            console.log('Error: ' + error);
        }
	});
});

$('#settingApprovalLineList').on('click', '.page-move', function(e){
	e.stopPropagation();
	e.preventDefault();
	
	const pageNo = $(this).text();
	$.ajax({
		url: 'getApprovalLineListJson',
		method: 'get',
		data: {pageNo},
		success: function(data){
			const table = $('table.table-font-sm');
			const tbody = table.find('tbody');
			tbody.empty();
			
			for(let dto of data.resultList) {
				const context = `
					<tr class="align-middle text-center aprLineIndex" data-aprLineIndex="${dto.aprLineIndex}">
			            <th scope="row">
			                <span class="text-custom-grey">${dto.aprLineName}</span>
			            </th>
			            <td>
			            	<div class="d-flex align-items-center justify-content-center">
				                 <button type="button" class="btn btn-dark btn-sm btn-custom-grey me-1 callApprovalLine">조회</button>
				                 <button type="button" class="btn btn-secondary btn-sm btn-custom-lightgrey removeApprovalLine">삭제</button>
			            	</div>
			            </td>
		        	</tr>
				`;
				tbody.append(context);
			}
			
			const pager = JSON.parse(data.pager);
			console.log(pager);
			const pagination = $('ul.pagination');
			pagination.empty();
			
			let listContext = `
				<li class="page-item ${pager.groupNo > 1 ? '' : 'disabled'}">
		    		<a id="pageGroupBtn-${pager.startPageNo-1}" class="pagination-size page-link text-dark page-border-none group-move" href="#" tabindex="-1" aria-disabled="true"><i class="fa-solid fa-chevron-left page-font-size-sm"></i></a>
		      	</li>`;
			for(let i=pager.startPageNo; i<=pager.endPageNo; i++) {
				listContext += `<li class="page-item ${pager.pageNo == i ? 'disabled' : ''}"><a class="pagination-size page-link text-dark page-border-none page-font-size-sm page-move" href="#">${i}</a></li>`;
			}
		    listContext += `
		    	<li class="page-item ${pager.groupNo >= pager.totalGroupNo ? 'disabled' : ''}">
		        	<a id="pageGroupBtn-${pager.endPageNo+1}" class="pagination-size page-link text-dark page-border-none group-move" href="#"><i class="fa-solid fa-chevron-right page-font-size-sm"></i></a>
		      	</li>`;
		    pagination.append(listContext);
		},
		error: function (xhr, status, error) {
            console.log('Error: ' + error);
        }
	});
});