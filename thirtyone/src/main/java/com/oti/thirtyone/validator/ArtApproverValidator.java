package com.oti.thirtyone.validator;

import java.util.Date;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.oti.thirtyone.dto.AlternateApproverDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ArtApproverValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return AlternateApproverDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("실행");
		AlternateApproverDTO alt = (AlternateApproverDTO) target;

		String altAprEmp = alt.getAltAprEmp();
		if (altAprEmp == null || altAprEmp.trim().isEmpty()) {
			errors.rejectValue("altAprEmp", "errors.altAprEmp.required", "권한을 위임할 사원은 반드시 지정해야 합니다.");
		}
		
		Date altAprStartDate = alt.getAltAprStartDate();
		Date altAprEndDate = alt.getAltAprEndDate();
		Date nowDate = new Date();
		nowDate.setDate(nowDate.getDate()-1);
		if (altAprStartDate == null) {
			errors.rejectValue("altAprStartDate", "errors.altAprStartDate.required", "권한 위임 시작 일자는 반드시 포함되어야 합니다.");
		} else if (altAprEndDate == null) {
			errors.rejectValue("altAprEndDate", "errors.altAprEndDate.required", "권한 위임 종료 일자는 반드시 포함되어야 합니다.");
		} else if (altAprStartDate.getTime() > altAprEndDate.getTime()) {
			errors.rejectValue("altAprStartDate", "errors.altAprStartDate.wrong", "권한 위임 시작 일자는 종료 일자보다 늦을 수 없습니다.");
		} else if (nowDate.getTime() > altAprStartDate.getTime()) {
			errors.rejectValue("altAprStartDate", "errors.altAprStartDate.pastTime", "권한 위임 시작 일자는 과거일 수 없습니다.");
		}
	}
}
