package com.tricon.appraisal.serviceImpl;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.tricon.appraisal.dao.ILoginDao;
import com.tricon.appraisal.service.ILoginService;


@ComponentScan
@Service
public class LoginService implements ILoginService {

	@Autowired
	ILoginDao logindao;
	
	//@Override
	public boolean doLogin(int userId, String password) throws ClassNotFoundException, SQLException, IOException
	{
		return logindao.doLogin(userId, password);
	}

}
