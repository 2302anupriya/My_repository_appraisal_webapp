package com.tricon.appraisal.daoImpl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;





/*import com.mysql.jdbc.ResultSet;*/
//import com.mysql.jdbc.Statement;
import com.tricon.appraisal.dao.IAppraisalDao;
import com.tricon.appraisal.db.ConnectionFactory;
import com.tricon.appraisal.vo.Appraisal;

@ComponentScan
@Repository
public class AppraisalDao implements IAppraisalDao {

	private Logger logger = Logger.getLogger(AppraisalDao.class);

	private static Date getCurrentDate() {

		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		System.out.println("current date is given by" + date);
		return date;
	}
	

	

	@Override
	public void insertAppraisalCycleDetails(Appraisal app, String empName) throws SQLException,
			ClassNotFoundException, IOException, ParseException {
		Connection connection = ConnectionFactory.getConnection();
		logger.info("inserting appraisal data into appraisal cycle table of the database");
		PreparedStatement ps = null;
		Statement statement = null;
		try {
			
			ps = connection
					.prepareStatement(
							"INSERT INTO Appraisal_Cycle(appraisal_cycle, cycle_period_from, cycle_period_to, cycle_project, mgr_id, created_on, updated_on, created_by, updated_by, empid, designation) VALUES (?,?,?,?,?,?,?,?,?,?,?)",
							Statement.RETURN_GENERATED_KEYS);

			ps.setString(1, app.getAppraisalCycle());
			//ps.setString(2, app.getCyclePeriodFrom());
			
			String cycle_Period_From = app.getCyclePeriodFrom();
			System.out.println(cycle_Period_From);
			String cycle_period_to  = app.getCyclePeriodTo();
			System.out.println(cycle_period_to);
			//set the cycle_period dates in dd-mm-yyyy format
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
					"yyyy-MM-dd");
			Date date_Cycle_Period_From = simpleDateFormat
					.parse(cycle_Period_From);
			Date date_Cycle_Period_To = simpleDateFormat
					.parse(cycle_period_to);
			String dateTargetPattern = "dd-MM-yyyy";
			simpleDateFormat.applyPattern(dateTargetPattern);
			String cyclePeriodFrom = simpleDateFormat
					.format(date_Cycle_Period_From);
			String cyclePeriodTo = simpleDateFormat
					.format(date_Cycle_Period_To);
			
			System.out.println("Hi.........."+cyclePeriodFrom);
			System.out.println("Hi.........."+cyclePeriodTo);
			

			
			ps.setString(2, cyclePeriodFrom);
			ps.setString(3, cyclePeriodTo);
			ps.setString(4, app.getCycleProject());
			ps.setInt(5, app.getMgrId());
			ps.setDate(6, (java.sql.Date) getCurrentDate());
			ps.setDate(7, (java.sql.Date) getCurrentDate());
			ps.setString(8, empName);
			ps.setString(9, empName);
			ps.setInt(10, app.getEmpId());
			ps.setString(11, app.getDesignation());
			ps.executeUpdate();

		} catch (SQLException e) {
			// logger error
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

	@Override
	public void insertAppraisalDetails(Appraisal app) throws SQLException,
			ClassNotFoundException, IOException, ParseException {
		Connection connection = ConnectionFactory.getConnection();
		logger.info("inserting appraisal data into database");
		PreparedStatement ps = null;
		Statement statement = null;
		ResultSet rs = null;
		int app_cycle_id = 0;
		
		
		//String sql = "select ac.id from appraisal_cycle ac where ac.cycle_period_from='"+app.getCyclePeriodFrom()+"' and empid=" + app.getEmpId()";

	
		//String sql = "select ac.id from appraisal_cycle ac where ac.empid = "+app.getEmpId();
		
		/*String sql = "select ac.id from appraisal_cycle ac where ac.cycle_period_from='"+app.getCyclePeriodFrom()+"' and empid=" + app.getEmpId()";
*/		
		String cycle_Period_From = app.getCyclePeriodFrom();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd");
		Date date_Cycle_Period_From = simpleDateFormat
				.parse(cycle_Period_From);
		String dateTargetPattern = "dd-MM-yyyy";
		simpleDateFormat.applyPattern(dateTargetPattern);
		String cyclePeriodFrom = simpleDateFormat
				.format(date_Cycle_Period_From);
		String appCycle = app.getAppraisalCycle();
		
		try {
			statement = connection.createStatement();
			
			String sql = "SELECT ac.id from appraisal_cycle ac where ac.cycle_period_from='"+cyclePeriodFrom+"' and ac.appraisal_cycle='"+appCycle+"' and empid=" + app.getEmpId(); 
			rs = statement.executeQuery(sql);
			while (rs.next()) {
			
		     app_cycle_id = (rs.getInt("id"));
		     
			}
			System.out.println("dhdsghdghjdfghjdfsghjdfsghj"+app_cycle_id);
			
			
			ps = connection
					.prepareStatement(
							"INSERT INTO Appraisal_Detail(appraisal_cycle_id, appraisal_cycle, sno, category, objectives, remark, weightage, training_needs, achievement_self_assesment, Mgr_assesment, mgr_comment, performance_rating, final_assesment) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)",
							Statement.RETURN_GENERATED_KEYS);

			ps.setInt(1,app_cycle_id);
			ps.setString(2, app.getAppraisalCycle());
			ps.setInt(3, app.getSno());
			ps.setString(4, app.getCategory());
			ps.setString(5, app.getObjectives());
			ps.setString(6, app.getRemark());
			ps.setInt(7, app.getWeightage());
			ps.setString(8, app.getTrainingNeeds());
			ps.setInt(9, app.getAchievementSelfAsses());
			ps.setInt(10, app.getMgrAsses());
			ps.setString(11, app.getMgrComment());
			ps.setInt(12, app.getPerformRating());
			ps.setInt(13, app.getFinalAsses());
			ps.executeUpdate();

		} catch (SQLException e) {
			// logger error
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

	/*
	 * public List<Appraisal> fetchEmployeeDetails(String appraisalCycle) throws
	 * SQLException, ClassNotFoundException, IOException { Appraisal app;
	 * ResultSet rs = null; List<Appraisal> appList = new
	 * ArrayList<Appraisal>(); Connection connection =
	 * ConnectionFactory.getConnection(); try { statement =
	 * connection.createStatement(); String query =
	 * "SELECT * FROM appraisal_detail WHERE appraisal_cycle = '"+
	 * appraisalCycle+"'"; rs = statement.executeQuery(query); while(rs.next())
	 * { app = new Appraisal();
	 * app.setAppraisalCycle(rs.getString("appraisal_cycle"));
	 * app.setSno(rs.getInt("sno")); app.setCategory(rs.getString("category"));
	 * app.setObjectives(rs.getString("objectives"));
	 * app.setRemark(rs.getString("remark"));
	 * app.setWeightage(rs.getInt("weightage"));
	 * app.setTrainingNeeds(rs.getString("training_needs"));
	 * app.setAchievementSelfAsses(rs.getInt("achievement_self_assesment"));
	 * app.setMgrAsses(rs.getInt("Mgr_assesment"));
	 * app.setMgrComment(rs.getString("mgr_comment"));
	 * app.setPerformRating(rs.getInt("performance_rating"));
	 * app.setFinalAsses(rs.getInt("final_assesment")); appList.add(app);
	 * 
	 * //System.out.println("Name="+rs.getString("name")+",country="+rs.getString
	 * ("country")+",password="+rs.getString("password")); }
	 * 
	 * 
	 * } catch (SQLException e) { //logger error throw e; } return appList; }
	 */

}