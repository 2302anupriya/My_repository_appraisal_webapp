package com.tricon.appraisal.dao;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.context.annotation.ComponentScan;


@ComponentScan
public interface ILoginDao {

	public boolean doLogin(int userId, String password) throws SQLException,
			ClassNotFoundException, IOException;
}
