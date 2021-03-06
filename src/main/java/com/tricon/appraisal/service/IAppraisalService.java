package com.tricon.appraisal.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import com.tricon.appraisal.vo.Appraisal;

public interface IAppraisalService {
	public void insertAppraisalCycleDetails(Appraisal app, String empName)
			throws SQLException, ClassNotFoundException, IOException,
			ParseException;

	public void insertAppraisalDetails(Appraisal app) throws SQLException,
			ClassNotFoundException, IOException, ParseException;

}
