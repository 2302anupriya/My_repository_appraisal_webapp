package com.tricon.appraisal.daoImpl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/*import java.util.ArrayList;
 import java.util.List;*/

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;

import com.tricon.appraisal.dao.ILoginDao;
import com.tricon.appraisal.db.ConnectionFactory;

@ComponentScan
@Repository
public class LoginDao implements ILoginDao {

	@Override
	public boolean doLogin(int userId, String password) throws SQLException,
			ClassNotFoundException, IOException {
		Connection connection = ConnectionFactory.getConnection();

		Statement statement = null;
		ResultSet rs = null;

		try {
			statement = connection.createStatement();
			String query = "SELECT empid, password FROM USER_CREDENTIAL WHERE empid = '"
					+ userId + "' and password = '" + password + "'";
			rs = statement.executeQuery(query);
			while (rs.next()) {
				int uid = rs.getInt("empid");
				String pwd = rs.getString("password");
				if (uid == userId && password.equals(pwd)) {
					return true;
				}

				// System.out.println("Name="+rs.getString("name")+",country="+rs.getString("country")+",password="+rs.getString("password"));
			}
		} catch (SQLException e) {
			// logger error
			throw e;
		}
		return false;
	}
}
