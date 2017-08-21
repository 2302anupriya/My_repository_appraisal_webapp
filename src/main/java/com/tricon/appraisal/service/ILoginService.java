package com.tricon.appraisal.service;

import java.io.IOException;
import java.sql.SQLException;

public interface ILoginService {
	public boolean doLogin(int userId, String password)
			throws ClassNotFoundException, SQLException, IOException;

}
