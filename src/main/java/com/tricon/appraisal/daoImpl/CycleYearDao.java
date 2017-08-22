package com.tricon.appraisal.daoImpl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import com.tricon.appraisal.dao.ICycleYearDao;
import com.tricon.appraisal.db.ConnectionFactory;

@ComponentScan
@Repository
public class CycleYearDao implements ICycleYearDao {

	@Override
	public List<String> getCycleYears(int userId) throws SQLException,
			ClassNotFoundException, IOException {
		Connection connection = ConnectionFactory.getConnection();
		List<String> yearList = new ArrayList<String>();
		Statement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.createStatement();
			/*
			 * String query =
			 * "SELECT cycle_period_from, cycle_period_to FROM appraisal_cycle WHERE empid = '"
			 * + userId + "'";
			 */
			String query = "SELECT cycle_period_from, cycle_period_to FROM appraisal_cycle WHERE empid = '"
					+ userId + "' order by SUBSTRING(cycle_period_from, 7, 10)";
			rs = statement.executeQuery(query);
			while (rs.next()) {

				String year_from = rs.getString("cycle_period_from");
				String yearFrom = year_from.substring(6);
				String year_to = rs.getString("cycle_period_to");
				String yearTo = year_to.substring(6);
				String cycleYear = yearFrom.concat("-").concat(yearTo);
				System.out
						.println("to retrieve the range of years" + cycleYear);
				yearList.add(cycleYear);

			}
		} catch (SQLException e) {
			// logger error
			throw e;
		}
		return yearList;
	}
}
