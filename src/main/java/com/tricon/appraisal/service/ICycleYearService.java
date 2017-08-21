package com.tricon.appraisal.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public interface ICycleYearService {
	
	public List<String> getCycleYears(int userId) throws ClassNotFoundException, SQLException, IOException;


}
