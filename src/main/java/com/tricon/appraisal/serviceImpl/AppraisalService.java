package com.tricon.appraisal.serviceImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.tricon.appraisal.dao.IAppraisalDao;
import com.tricon.appraisal.service.IAppraisalService;
import com.tricon.appraisal.vo.Appraisal;

@ComponentScan
@Service
public class AppraisalService implements IAppraisalService {

	@Autowired()
	IAppraisalDao appDao;

	// @Override

	public void insertAppraisalCycleDetails(Appraisal app, String empName)
			throws SQLException, ClassNotFoundException, IOException,
			ParseException {

		appDao.insertAppraisalCycleDetails(app, empName);

	}

	public void insertAppraisalDetails(Appraisal app) throws SQLException,
			ClassNotFoundException, IOException, ParseException {

		appDao.insertAppraisalDetails(app);
	}

	/*
	 * public List<Appraisal> fetchEmployeeDetails(String appCycle) throws
	 * SQLException, ClassNotFoundException, IOException { return
	 * ad.fetchEmployeeDetails(appCycle); }
	 */

	/*
	 * public Appraisal fetchEmployeeDetails(Appraisal appType) { return
	 * ad.fetchEmployeeDetails(appType); }
	 */
}
