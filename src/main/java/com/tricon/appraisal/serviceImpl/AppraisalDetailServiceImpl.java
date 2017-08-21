package com.tricon.appraisal.serviceImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.tricon.appraisal.dao.IAppraisalDetailDao;
import com.tricon.appraisal.service.IAppraisalDetailService;
import com.tricon.appraisal.vo.Appraisal;
import com.tricon.appraisal.vo.Employee;
import com.tricon.appraisal.vo.Manager;

@ComponentScan
@Service
public class AppraisalDetailServiceImpl implements IAppraisalDetailService {
	
	@Autowired
	IAppraisalDetailDao ado;

	
	//@Override
	public List<Appraisal> viewAppraisalDetails(String appraisalcycle, String year,  int empid) throws SQLException, ClassNotFoundException, IOException
	{
		return ado.viewAppraisalDetails(appraisalcycle,year,empid);
	}

	//@Override
	public Manager viewManagerDetails(String year,  int empid, String appraisalcycle) throws SQLException, ClassNotFoundException, IOException
	{
		return ado.viewManagerDetails(year,empid,appraisalcycle);
	}
	//@Override
	public Employee viewEmployeeDetails(String year,  int empid) throws SQLException, ClassNotFoundException, IOException
	{
		return ado.viewEmployeeDetails(year,empid);
	}
	
	public List<Integer> fetchAssociateDetailsByMgrId(int empid) throws SQLException, ClassNotFoundException, IOException
	{
		return ado.fetchAssociateDetailsByMgrId(empid);
	}
	
	
	public List<Appraisal> viewPersonalAppraisalDetailsByEmpId(int empid) throws SQLException, ClassNotFoundException, IOException, ParseException
	{
		return ado.viewPersonalAppraisalDetailsByEmpId(empid);
	}


}
