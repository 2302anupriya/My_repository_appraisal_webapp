package com.tricon.appraisal.serviceImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.tricon.appraisal.dao.ICycleYearDao;
import com.tricon.appraisal.service.ICycleYearService;


@ComponentScan
@Service
public class CycleYearService implements ICycleYearService {
	
	@Autowired
	ICycleYearDao cycledao;
	
	//@Override
	public List<String> getCycleYears(int userId) throws ClassNotFoundException, SQLException, IOException
	{
		return cycledao.getCycleYears(userId);
	}


}
