package com.tricon.appraisal.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import com.tricon.appraisal.vo.Appraisal;
import com.tricon.appraisal.vo.Employee;
import com.tricon.appraisal.vo.Manager;

public interface IAppraisalDetailDao {

	public List<Appraisal> viewAppraisalDetails(String appraisalcycle, String cycleYear, int empid)
			throws SQLException, ClassNotFoundException, IOException;

	public Manager viewManagerDetails(String cycleYear, int empid, String appraisalcycle)
			throws SQLException, ClassNotFoundException, IOException;

	public Employee viewEmployeeDetails(String cycleYear, int empid)
			throws SQLException, ClassNotFoundException, IOException;

	public List<Integer> fetchAssociateDetailsByMgrId(int empid) throws SQLException,
			ClassNotFoundException, IOException;
	
	

	public List<Appraisal> viewPersonalAppraisalDetailsByEmpId(int empid) throws SQLException,
			ClassNotFoundException, IOException, ParseException;

}
