package com.tricon.appraisal.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import com.tricon.appraisal.vo.Appraisal;
import com.tricon.appraisal.vo.Employee;
import com.tricon.appraisal.vo.Manager;

public interface IAppraisalDetailService {

	public List<Appraisal> viewAppraisalDetails(String appraisalcycle, String year, int empid)
			throws SQLException, ClassNotFoundException, IOException;

	public Manager viewManagerDetails(String year, int empid, String appraisalcycle)
			throws SQLException, ClassNotFoundException, IOException;

	public Employee viewEmployeeDetails(String year, int empid)
			throws SQLException, ClassNotFoundException, IOException;

	public List<Integer> fetchAssociateDetailsByMgrId(int empid)
			throws SQLException, ClassNotFoundException, IOException;
	
	public List<Appraisal> viewPersonalAppraisalDetailsByEmpId(int empid)
			throws SQLException, ClassNotFoundException, IOException, ParseException;
	
	

}
