<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/approval/approvalContainer.jsp"%>
<form action="#" method="post" enctype="multipart/form-data">
    <div class="d-flex align-items-top justify-content-between mb-4">
        <div class="d-flex align-items-top" style="width: 60%;">
        	<label for="documentForm" class="fw-bold mt-2" style="width: 25%;">결재 양식</label>
            <select class="form-select" id="documentForm" style="width: 75%; height: 37.78px">
                <option value="default" selected>결재 양식 선택</option>
                <option value="holidayDocument">근태 신청서(휴가)</option>
                <option value="businessTripDocument">출장 신청서</option>
                <option value="businessTripReport">출장 복명서</option>
                <option value="holidayWork">휴일근무 신청서</option>
                <option value="workOvertime">연장근무신청서</option>
           	</select>
        </div>
        <div class="d-flex flex-column align-items-top" id="draftDetailForm" style="width: 40%;">
        	<div class="d-flex align-items-center w-100 mb-3 hol-doc hidden">
				<label for="dateOfHoliday" class="fw-bold mb-2" style="width: 25%; margin-left: 20px">신청 기간</label>
				<div id="dateOfHoliday" class="d-flex align-items-center" style="width: 75%;">
					<input type="date" id="holidayStartDate" class="form-control p-2" style="height: 35px; font-size: 0.9rem;" placeholder="휴가 시작일" readonly >
					<span class="fw-bold mx-2">~</span>
					<input type="date" id="holidayEndDate" class="form-control p-2" style="height: 35px; font-size: 0.9rem;" placeholder="휴가 종료일" readonly >
				</div>
          	</div>
          	<div class="d-flex align-items-center w-100 mb-3 hol-doc hidden">
          		<label for="holidayType" class="fw-bold mb-2" style="width: 25%; margin-left: 20px">휴가 유형</label>
        		<select id="holidayType" class="form-select" style="width: 75%; font-size: 0.9rem">
        			<option value="familyEvent">경조사</option>
        			<option value="childbirth">출산</option>
        			<option value="sickLeave">병가</option>
        		</select>
        	</div>
        	<div class="d-flex align-items-center w-100 mb-3 biz-trip hidden">
          		<label for="dateOfBizTrip" class="fw-bold mb-2" style="width: 25%; margin-left: 20px">신청 기간</label>
        		<div id="dateOfBizTrip" class="d-flex align-items-center" style="width: 75%;">
					<input type="date" id="bizTripStartDate" class="form-control p-2" style="height: 35px; font-size: 0.9rem;" placeholder="출장 시작일" readonly >
					<span class="fw-bold mx-2">~</span>
					<input type="date" id="bizTripEndDate" class="form-control p-2" style="height: 35px; font-size: 0.9rem;" placeholder="출장 종료일" readonly >
				</div>
        	</div>
        	<div class="d-flex align-items-center w-100 mb-3 biz-trip hidden" >
          		<label for="dateOfBizTrip" class="fw-bold mb-2" style="width: 25%; margin-left: 20px">출장 목적</label>
        		<div id="dateOfBizTrip" class="d-flex align-items-center" style="width: 75%;">
					<textarea class="form-control" cols="2" placeholder="간략하게 목적만 작성하시오." style="font-size: 0.9rem;"></textarea>
				</div>
        	</div>
        	<div class="d-flex align-items-center w-100 mb-3 hol-work hidden" >
				<label for="datetimeOfholidayWork" class="fw-bold mb-2" style="width: 25%; margin-left: 20px">신청 기간</label>
				<div id="datetimeOfholidayWork" class="d-flex flex-column align-items-center" style="width: 75%;">
					<div class="d-flex align-items-center w-100">
						<span class="fw-bold w-25" style="font-size: 0.8rem;">근무 시작</span>
						<input type="text" id="holidayWorkStartDatetime" class="form-control p-2 w-75" style="height: 35px; font-size: 0.8rem;" placeholder="추가근무 시작" readonly >
					</div>
					<div class="d-flex align-items-center w-100">
						<span class="fw-bold w-25" style="font-size: 0.8rem;">근무 종료</span>					
						<input type="text" id="holidayWorkEndDatetime" class="form-control p-2 w-75" style="height: 35px; font-size: 0.8rem;" placeholder="추가근무 종료" readonly >
					</div>
				</div>
          	</div>
          	<div class="d-flex align-items-center w-100 mb-3 work-over hidden" >
				<label for="datetimeOfWorkOvertime" class="fw-bold mb-2" style="width: 25%; margin-left: 20px">신청 기간</label>
				<div id="datetimeOfWorkOvertime" class="d-flex flex-column align-items-center" style="width: 75%;">
					<div class="d-flex align-items-center w-100">
						<span class="fw-bold w-25" style="font-size: 0.8rem;">근무 시작</span>
						<input type="text" id="workOvertimeStartDatetime" class="form-control p-2 w-75" style="height: 35px; font-size: 0.8rem;" placeholder="추가근무 시작" readonly >
					</div>
					<div class="d-flex align-items-center w-100">
						<span class="fw-bold w-25" style="font-size: 0.8rem;">근무 종료</span>					
						<input type="text" id="workOvertimeEndDatetime" class="form-control p-2 w-75" style="height: 35px; font-size: 0.8rem;" placeholder="추가근무 종료" readonly >
					</div>
				</div>
          	</div>
        </div>
    </div>
    <div class="d-flex mb-4">
        <div class="d-flex align-items-center" style="width: 60%;">
            <label for="draftTitle" class="fw-bold mb-2" style="width: 30%; margin-right:2px;">제목</label>
            <input type="text" class="form-control" id="draftTitle" style="width: 90%;" />
        </div>
    </div>
    <div class="d-flex mb-4">
        <div style="width:15%;">
            <label for="draftReferrer" class="fw-bold mb-2 mt-2">참조자</label>
        </div>
        <div class="d-flex align-items-top" style="width: 85%;">
            <div class="me-3" style="width: 25%;">
                <select class="form-select" id="draftDepartmentSelect">
                    <option selected>부서 선택</option>
                    <option value="department-1">공공사업1Div</option>
                    <option value="department-2">공공사업2Div</option>
                    <option value="department-3">공공사업3Div</option>
                </select>
            </div>
            <div style="width: 30%;">
                <select class="form-select" id="draftReferrer" style="width: 98%;">
                    <option selected>참조자 선택</option>
                    <option value="referrer-1">정원석 사원</option>
                    <option value="referrer-2">서지혜 사원</option>
                    <option value="referrer-3">엄성현 사원</option>
                </select>
            </div>
            <div class="d-flex align-items-top justify-content-start" style="width: 50%;">
                <select multiple class="form-select ms-3" id="draftRefSelectBox" size="3" style="width: 35%">
                    <option value="selected-referrer-1">서지혜 사원</option>
                </select>
                <div class="d-flex ms-1" style="margin-top: 1px; flex-direction: column;">
                 <button type="button" class="btn btn-secondary btn-sm mb-1">추가</button>
                 <button type="button" class="btn btn-secondary btn-sm">삭제</button>
                </div>
            </div>
        </div>
    </div>
    <div class="d-flex mb-5" style="width: 100%;">
        <div class="d-flex align-items-center" style="width: 100%;">
            <label for="approvalLineSelect" class="fw-bold" style="width: 15%;">결재 라인</label>
            <select class="form-select" id="approvalLineSelect" style="width: 45%;">
                <option selected value="selected-apprval-1">기본 결재선</option>
                <option value="selected-apprval-2">기본 결재선2</option>
                <option value="selected-apprval-3">기본 결재선3</option>
            </select>
            <button type="button" class="btn btn-secondary" style="margin-left: 20px; height: 90%;" data-bs-toggle="modal" data-bs-target="#approvalLine">결재선 선택</button>
        </div>
    </div>
    <div class="d-flex align-items-center justify-content-center mb-4">
        <div class="custom-card text-end">
            <div class="name-text mt-1">정준하 <span class="role-text">과장</span></div>
            <div class="dept-text mt-2">공공사업1DIV</div>
        </div>
        <div class="mx-3">
            <img src="${pageContext.request.contextPath}/resources/image/approval-arrow.png" width="20px" />
        </div>
        <div class="custom-card text-end">
            <div class="name-text mt-1">박명수 <span class="role-text">차장</span></div>
            <div class="dept-text mt-2">공공사업1DIV</div>
        </div>
        <div class="mx-3">
            <img src="${pageContext.request.contextPath}/resources/image/approval-arrow.png" width="20px" />
        </div>
        <div class="custom-card text-end">
            <div class="name-text mt-1">유재석 <span class="role-text">부장</span></div>
            <div class="dept-text mt-2">공공사업1DIV</div>
        </div>
    </div>
    <div class="d-flex flex-column align-items-start" style="width: 100%;">
    	<div class="d-flex align-items-center me-3" style="width: 100%;">
         <label for="approvalAttachFile" class="fw-bold" style="width: 15%;">첨부 파일</label>
         <div class="d-flex align-items-center justify-content-start" style="width: 80%;">
          <span class="text-secondary attachFont">전동열차_지연증명서.pdf</span>
          <button type="button" class="btn p-0 ms-2" id="deleteAttacthFile"><img src="${pageContext.request.contextPath}/resources/image/close-icon.png" width="10px" /></button>
    	    </div>
    	</div>
        <div class="d-flex" style="width: 100%;">
            <div style="width: 15%; height: 100%">&nbsp;</div>
            <input type="file" id="approvalAttachFile" class="form-control" style="width: 50%" />
        </div>
    </div>
    
    <hr class="hr my-5" />

    <div>
		<div style="width: 90%; margin: 0 auto;">
		    <textarea id="draftDocument"></textarea>
		</div>
		</div>
</form>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
   flatpickr("#holidayStartDate", {
       dateFormat: "Y-m-d",
       allowInput: true,
       onChange: function(selectedDates, dateStr, instance) {
	        const startDate = selectedDates[0];
	        const endPicker = flatpickr("#holidayEndDate", {
	        	dateFormat: "Y-m-d",
	            allowInput: true,
	            minDate: startDate
	        });
	        endPicker.set('minDate', startDate);
      }
   });
   flatpickr("#holidayEndDate", {
       dateFormat: "Y-m-d",
       allowInput: true
   });
   flatpickr("#bizTripStartDate", {
       dateFormat: "Y-m-d",
       allowInput: true,
       onChange: function(selectedDates, dateStr, instance) {
	        const startDate = selectedDates[0];
	        const endPicker = flatpickr("#bizTripEndDate", {
	        	dateFormat: "Y-m-d",
	            allowInput: true,
	            minDate: startDate
	        });
	        endPicker.set('minDate', startDate);
       }
   	});
   flatpickr("#bizTripEndDate", {
       dateFormat: "Y-m-d",
       allowInput: true
   });
   flatpickr("#holidayWorkStartDatetime", {
	    enableTime: true,
	    dateFormat: "Y-m-d H:i:S",
	    time_24hr: true,
	    locale: {
	        firstDayOfWeek: 1 // 주의 첫 날 설정 (1 = 월요일)
	    },
	    allowInput: true,
	    onChange: function(selectedDates, dateStr, instance) {
	        const startDate = selectedDates[0];
	        const endPicker = flatpickr("#holidayWorkEndDatetime", {
	            enableTime: true,
	            dateFormat: "Y-m-d H:i:S",
	            time_24hr: true,
	            locale: {
	                firstDayOfWeek: 1
	            },
	            allowInput: true,
	            minDate: startDate
	        });
	        endPicker.set('minDate', startDate);
	    }
	});
   flatpickr("#holidayWorkEndDatetime", {
		enableTime: true,
	    dateFormat: "Y-m-d H:i:S",
	    time_24hr: true,
	    locale: {
	        firstDayOfWeek: 1
	    },
	    allowInput: true,
	    onChange: function(selectedDates, dateStr, instance) {
	    	console.log(selectedDates);
	    }
	});
   flatpickr("#workOvertimeStartDatetime", {
	    enableTime: true,
	    dateFormat: "Y-m-d H:i:S",
	    time_24hr: true,
	    locale: {
	        firstDayOfWeek: 1 // 주의 첫 날 설정 (1 = 월요일)
	    },
	    allowInput: true,
	    onChange: function(selectedDates, dateStr, instance) {
	        const startDate = selectedDates[0];
	        const endPicker = flatpickr("#workOvertimeEndDatetime", {
	            enableTime: true,
	            dateFormat: "Y-m-d H:i:S",
	            time_24hr: true,
	            locale: {
	                firstDayOfWeek: 1
	            },
	            allowInput: true,
	            minDate: startDate
	        });
	        endPicker.set('minDate', startDate);
	    }
	});
  flatpickr("#workOvertimeEndDatetime", {
		enableTime: true,
	    dateFormat: "Y-m-d H:i:S",
	    time_24hr: true,
	    locale: {
	        firstDayOfWeek: 1
	    },
	    allowInput: true,
	    onChange: function(selectedDates, dateStr, instance) {
	    	console.log(selectedDates);
	    }
	});
   
</script>

<%@ include file="/WEB-INF/views/approval/approvalLine.jsp" %>
<%@ include file="/WEB-INF/views/approval/approvalContainerFooter.jsp"%>