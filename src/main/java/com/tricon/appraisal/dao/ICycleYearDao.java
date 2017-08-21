package com.tricon.appraisal.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public interface ICycleYearDao {
	
	
	public List<String> getCycleYears(int userId) throws SQLException, ClassNotFoundException, IOException;
}

