package com.oti.thirtyone.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDao {

	int selectCheckInToday(String empId);

	int insertCheckIn(String empId);

	int updateCheckOut(String empId);

}
