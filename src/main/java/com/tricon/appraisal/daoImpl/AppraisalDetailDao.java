package com.tricon.appraisal.daoImpl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.tricon.appraisal.dao.IAppraisalDetailDao;
import com.tricon.appraisal.db.ConnectionFactory;
import com.tricon.appraisal.vo.Appraisal;
import com.tricon.appraisal.vo.Employee;
import com.tricon.appraisal.vo.Manager;

@ComponentScan
@Repository
public class AppraisalDetailDao implements IAppraisalDetailDao {
	private Logger logger = Logger.getLogger(AppraisalDetailDao.class);

	@Override
	public List<Appraisal> viewAppraisalDetails(String appraisalcycle,
			String cycleYear, int empid) throws SQLException,
			ClassNotFoundException, IOException {
		logger.info("fetching data for appraisal page");
		Appraisal app;
		ResultSet rs = null;
		Statement statement = null;
		List<Appraisal> appList = new ArrayList<Appraisal>();
		Connection connection = ConnectionFactory.getConnection();
		try {
			statement = connection.createStatement();
			String query = "(SELECT ad.appraisal_cycle, ac.empid, ac.cycle_period_from, ac.cycle_period_to, ac.designation, ac.cycle_project, ad.category, ad.remark, ad.objectives, ad.weightage, ad.training_needs, ad.achievement_self_assesment, ad.Mgr_assesment, ad.mgr_comment, ad.performance_rating, final_assesment, ac.mgr_id FROM appraisal_detail ad, appraisal_cycle ac"
					+ " WHERE ac.id=ad.appraisal_cycle_id and ac.empid = "
					+ empid
					+ " and SUBSTRING(ac.cycle_period_from,7,4)= '"
					+ cycleYear
					+ "' and ad.appraisal_cycle = '"
					+ appraisalcycle + "')";

			rs = statement.executeQuery(query);
			while (rs.next()) {
				app = new Appraisal();
				app.setAppraisalCycle(rs.getString("appraisal_cycle"));
				System.out.println(rs.getString("appraisal_cycle"));
				app.setCycleProject(rs.getString("cycle_project"));
				app.setCategory(rs.getString("category"));
				app.setObjectives(rs.getString("objectives"));
				app.setRemark(rs.getString("remark"));
				app.setWeightage(rs.getInt("weightage"));
				app.setTrainingNeeds(rs.getString("training_needs"));
				app.setAchievementSelfAsses(rs
						.getInt("achievement_self_assesment"));
				app.setMgrAsses(rs.getInt("Mgr_assesment"));
				app.setMgrComment(rs.getString("mgr_comment"));
				app.setPerformRating(rs.getInt("performance_rating"));
				app.setFinalAsses(rs.getInt("final_assesment"));

				app.setEmpId(rs.getInt("empid"));
				app.setDesignation(rs.getString("designation"));
				app.setCyclePeriodFrom(rs.getString("cycle_period_from"));
				app.setCyclePeriodTo(rs.getString("cycle_period_to"));
				/*
				 * String fromDate = rs.getString("cycle_period_from");
				 * DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				 * Date fromPeriod = (Date)formatter.parse(fromDate);
				 * app.setCyclePeriodFrom(fromPeriod);
				 * 
				 * String fromDate = rs.getString("cycle_period_to"); DateFormat
				 * formatter = new SimpleDateFormat("dd/MM/yyyy"); Date
				 * fromPeriod = (Date)formatter.parse(fromDate);
				 * app.setCyclePeriodFrom(fromPeriod);
				 */

				// app.setCyclePeriodTo(rs.getString("cycle_period_to"));
				// app.setCycleProject(rs.getString("cycle_project"));
				/* app.setMgrId(rs.getInt("mgr_id")); */

				/*
				 * if (rs.getString("appraisal_cycle").equalsIgnoreCase("H1"))
				 * 
				 * {
				 * 
				 * app.setDesignationH1(rs.getString("designation"));
				 * app.setCyclePeriodFromH1(rs.getString("cycle_period_from"));
				 * app.setCyclePeriodToH1(rs.getString("cycle_period_to"));
				 * app.setCycleProjectH1(rs.getString("cycle_project")); }
				 * 
				 * else {
				 * app.setCyclePeriodFromH2(rs.getString("cycle_period_from"));
				 * app.setCyclePeriodToH2(rs.getString("cycle_period_to"));
				 * app.setDesignationH2(rs.getString("designation"));
				 * app.setCycleProjectH2(rs.getString("cycle_project")); }
				 */
				appList.add(app);
				System.out.println("############" + appList);

			}

		} catch (SQLException e) {
			// logger error
			throw e;
		}
		return appList;
	}

	@Override
	public Manager viewManagerDetails(String cycleYear, int empid,
			String appraisalcycle) throws SQLException, ClassNotFoundException,
			IOException {
		Manager mgr = null;
		ResultSet rs = null;
		Statement statement = null;
		// List<Manager> mgrList = new ArrayList<Manager>();
		Connection connection = ConnectionFactory.getConnection();
		try {
			statement = connection.createStatement();

			/*
			 * String query =
			 * "SELECT empid,fname from employee where empid = (SELECT mgrid from employee where empid="
			 * + empid + ")";
			 */

			/*
			 * String query =
			 * "SELECT ac.appraisal_cycle, emp.fname,emp.empid from employee emp where emp.empid = (SELECT ac.mgr_id from appraisal_cycle ac where ac.empid = +empid and SUBSTRING(ac.cycle_period_from,7,4) = '"
			 * + cycleYear + "' and ac.appraisal_cycle='" + appraisalcycle +
			 * "')";
			 */
			String query = "SELECT empid,fname from employee where empid = (SELECT distinct(mgr_id) from appraisal_cycle where empid="
					+ empid + " and appraisal_cycle='" + appraisalcycle + "')";

			System.out.println("Inside view manager detail");
			/*
			 * String query =
			 * "(SELECT emp.empid, emp.fname, ac.appraisal_cycle from employee emp, appraisal_cycle ac where emp.empid = ac.empid and emp.empid =  (SELECT mgrid from employee where empid = "
			 * + empid+")";
			 */

			rs = statement.executeQuery(query);
			System.out.println(rs);
			while (rs.next()) {
				mgr = new Manager();

				/*
				 * if (rs.getString("appraisal_cycle").equalsIgnoreCase("H1"))
				 * 
				 * {
				 * 
				 * mgr.setMgrIdH1(rs.getInt("empid"));
				 * mgr.setMgrNameH1(rs.getString("fname")); } else {
				 * mgr.setMgrIdH2(rs.getInt("empid"));
				 * mgr.setMgrNameH2(rs.getString("fname")); // mgrList.add(mgr);
				 * System.out.println("inside view manager detail:" + mgr); }
				 */
				/*
				 * mgr.setMgrIdH1(rs.getInt("empid"));
				 * mgr.setMgrNameH1(rs.getString("fname"));
				 * mgr.setMgrIdH2(rs.getInt("empid"));
				 * mgr.setMgrNameH2(rs.getString("fname"));
				 */

				mgr.setMgrId(rs.getInt("empid"));
				mgr.setMgrName(rs.getString("fname"));

			}
		} catch (SQLException e) {
			// logger error
			throw e;
		}
		return mgr;
	}

	@Override
	public Employee viewEmployeeDetails(String cycleYear, int empid)
			throws SQLException, ClassNotFoundException, IOException {
		Employee emp = null;
		ResultSet rs = null;
		Statement statement = null;
		// List<Employee> empList = new ArrayList<Employee>();
		Connection connection = ConnectionFactory.getConnection();
		try {
			statement = connection.createStatement();
			String query = "SELECT * from employee where empid=" + empid;
			rs = statement.executeQuery(query);

			while (rs.next()) {
				emp = new Employee();
				emp.setEmpId(rs.getInt("empid"));
				emp.setEmpName(rs.getString("fname"));
				// empList.add(emp);

			}

		} catch (SQLException e) {
			// logger error
			throw e;
		}
		return emp;
	}

	@Override
	public List<Integer> fetchAssociateDetailsByMgrId(int empid)
			throws SQLException, ClassNotFoundException, IOException {
		ResultSet rs = null;
		Statement statement = null;
		List<Integer> empList = new ArrayList<Integer>();
		Employee emp = null;
		// List<Manager> mgrList = new ArrayList<Manager>();
		Connection connection = ConnectionFactory.getConnection();
		try {
			statement = connection.createStatement();
			String query = "SELECT empid from employee where mgrid =" + empid;
			rs = statement.executeQuery(query);
			while (rs.next()) {
				emp = new Employee();
				int emp_id = rs.getInt("empid");
				// emp.setEmpName(rs.getString("fname"));
				empList.add(emp_id);
				System.out.println("inside view associate detail:" + empList);
			}

		} catch (SQLException e) {
			// logger error
			throw e;
		}
		return empList;
	}

	// view the manager personal appraisal detail

	@Override
	public List<Appraisal> viewPersonalAppraisalDetailsByEmpId(int empid)
			throws SQLException, ClassNotFoundException, IOException,
			ParseException {
		Appraisal app = null;
		ResultSet rs = null;
		Statement statement = null;
		List<Appraisal> appList = new ArrayList<Appraisal>();
		Employee emp = null;
		// List<Manager> mgrList = new ArrayList<Manager>();
		Connection connection = ConnectionFactory.getConnection();
		try {
			System.out.println("inside the personal details in DAO layer");
			statement = connection.createStatement();
			String query = "select appraisal_cycle, cycle_period_from, cycle_period_to from appraisal_cycle where empid ="
					+ empid;
			rs = statement.executeQuery(query);
			while (rs.next()) {
				app = new Appraisal();
				/*				*/

				// to retrieve the cycle month
				String cycle_Period_From = rs.getString("cycle_period_from");
				String cycle_period_to = rs.getString("cycle_period_to");
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
						"dd-MM-yyyy");
				Date date_Cycle_Period_From = simpleDateFormat
						.parse(cycle_Period_From);
				Date date_Cycle_Period_To = simpleDateFormat
						.parse(cycle_period_to);
				String dateTargetPattern = "dd-MMM-yyyy";
				simpleDateFormat.applyPattern(dateTargetPattern);
				String cyclePeriodFrom = simpleDateFormat
						.format(date_Cycle_Period_From);
				String cyclePeriodTo = simpleDateFormat
						.format(date_Cycle_Period_To);
				/*
				 * cyclePeriodFrom.substring(3); cyclePeriodTo.substring(3);
				 */

				String cyclePeriodMonth = (cyclePeriodFrom.substring(3))
						.concat(" to ").concat(cyclePeriodTo.substring(3));
				System.out
						.println("Getting the Cycle Period Months : +++++++++++++++++ "
								+ cyclePeriodMonth);
				/* cyclePeriodList.add(cyclePeriod); */

				// retrieval of cycle_month ends here

				String cycle_Year = (rs.getString("cycle_period_from"))
						.substring(6);
				app.setAppraisalCycle(rs.getString("appraisal_cycle"));
				/* app.setCyclePeriodFrom(cycle_Year); */
				app.setCycleMonth(cyclePeriodMonth);
				appList.add(app);
				System.out.println("inside view Personal detail:" + appList);
			}

		} catch (SQLException e) {
			// logger error
			throw e;
		}
		return appList;
	}

}
