package com.tricon.appraisal.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tricon.appraisal.service.IAppraisalDetailService;
import com.tricon.appraisal.service.IAppraisalService;
import com.tricon.appraisal.vo.Appraisal;
import com.tricon.appraisal.vo.Employee;
import com.tricon.appraisal.vo.Manager;

@Controller
@Validated
public class AppraisalDetailController {

	private Logger logger = Logger.getLogger(AppraisalDetailController.class);

	@Autowired
	IAppraisalDetailService appraisalDetailService;

	@Autowired
	IAppraisalService appraisalService;

	/*
	 * private Map<ArrayList,ArrayList> getAppraisalList(String cycleYear, int
	 * empid) throws ClassNotFoundException, SQLException, IOException {
	 * List<Appraisal> appraisalList =
	 * appraisalDetailService.viewAppraisalDetails(cycleYear,empid); Manager
	 * manager = appraisalDetailService.viewManagerDetails(yearvalue,empid);
	 * Employee employee =
	 * appraisalDetailService.viewEmployeeDetails(yearvalue,empid);
	 * Map<ArrayList, ArrayList> map = new HashMap<ArrayList, ArrayList>();
	 * map.put(appraisalList, appraisalList);
	 * 
	 * 
	 * return appraisalList; }
	 */
	private String getYearFromValue(String yearRangeValue) {
		String yearFrom = yearRangeValue.substring(0, 4);
		return yearFrom;
	}

	// below method is to view the appraisal details

	@RequestMapping(value = "/appraisalDetailController", method = RequestMethod.POST, params = "viewAppraisal")
	public String handleViewEmployeeRequest(Model model,
			@RequestParam("cycleyear") String yearvalue,
			@RequestParam("appraisalCycle") String appraisalcycle,
			HttpServletRequest request, HttpSession session) throws IOException {
		logger.info("Returing appraisal detail page");
		int empid = (Integer) request.getSession().getAttribute("empid");

		try {
			String yearFromValue = getYearFromValue(yearvalue);
			List<Appraisal> appraisalList = appraisalDetailService
					.viewAppraisalDetails(appraisalcycle, yearFromValue, empid);
			Manager manager = appraisalDetailService.viewManagerDetails(
					yearFromValue, empid, appraisalcycle);
			Employee employee = appraisalDetailService.viewEmployeeDetails(
					yearFromValue, empid, appraisalcycle);
			System.out.println("apppraisallist:" + appraisalList);

			model.addAttribute("appList", appraisalList);
			session.setAttribute("appList", appraisalList);
			model.addAttribute("emp", employee);
			model.addAttribute("mgr", manager);
			model.addAttribute("appCycle", appraisalcycle);
			System.out.println(manager);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "viewAppraisalDetail";

	}

	/*
	 * //below method is to view the associate details
	 * 
	 * @RequestMapping(value = "/AppraisalDetailController", method =
	 * RequestMethod.POST, params = "viewAssAppraisal") public String
	 * handleViewAssociateRequest(Model model, HttpServletRequest request,
	 * HttpSession session) throws IOException {
	 * logger.info("Returing associate Ids detail"); //
	 * AppraisalDetailServiceImpl ads = new AppraisalDetailServiceImpl(); // int
	 * empid = (Integer) request.getSession().getAttribute("empid"); try {
	 * String yearFromValue=getYearFromValue(yearvalue); List<Appraisal>
	 * appraisalList = appraisalDetailService
	 * .viewAppraisalDetails(appraisalcycle, yearFromValue, associateId);
	 * Manager manager = appraisalDetailService.viewManagerDetails(
	 * yearFromValue, associateId, appraisalcycle); Employee employee =
	 * appraisalDetailService.viewEmployeeDetails( yearFromValue, associateId);
	 * // model.addAttribute("appList",appraisalList);
	 * session.setAttribute("appList", appraisalList); model.addAttribute("emp",
	 * employee); model.addAttribute("mgr", manager);
	 * model.addAttribute("appCycle", appraisalcycle); } catch (Exception e) {
	 * e.printStackTrace(); } return "viewAssociateDetails";
	 * 
	 * }
	 */

	// below method is to view the associate appraisal details
	@RequestMapping(value = "/appraisalDetailController", method = RequestMethod.POST, params = "viewAssAppraisal")
	public String handleViewAssociateRequest(Model model,
			@RequestParam("cycleyear") String yearvalue,
			@RequestParam("associateId") int associateId,
			@RequestParam("appraisalCycle") String appraisalcycle,
			HttpServletRequest request, HttpSession session) throws IOException {
		logger.info("Returing associate Ids detail");
		// AppraisalDetailServiceImpl ads = new AppraisalDetailServiceImpl();
		// int empid = (Integer) request.getSession().getAttribute("empid");
		try {
			String yearFromValue = getYearFromValue(yearvalue);
			List<Appraisal> appraisalList = appraisalDetailService
					.viewAppraisalDetails(appraisalcycle, yearFromValue,
							associateId);
			Manager manager = appraisalDetailService.viewManagerDetails(
					yearFromValue, associateId, appraisalcycle);
			Employee employee = appraisalDetailService.viewEmployeeDetails(
					yearFromValue, associateId, appraisalcycle);
			model.addAttribute("appList", appraisalList);
			session.setAttribute("appList", appraisalList);
			model.addAttribute("emp", employee);
			model.addAttribute("mgr", manager);
			model.addAttribute("appCycle", appraisalcycle);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "associateAppraisalDetail";

	}

	// method to view the dashboard for personal appraisal of a manager
	@RequestMapping(value = "/appraisalDetailController", method = RequestMethod.POST, params = "viewPersonalAppraisal")
	public String handleViewPersonalRequest(Model model,
			HttpServletRequest request, HttpSession session) throws IOException {
		logger.info("Returing personal appraisal detail page");
		int empid = (Integer) request.getSession().getAttribute("empid");
		try {
			/*
			 * String yearFromValue=getYearFromValue(yearvalue); List<Appraisal>
			 * appraisalList = appraisalDetailService
			 * .viewAppraisalDetails(appraisalcycle, yearFromValue,
			 * associateId); Manager manager =
			 * appraisalDetailService.viewManagerDetails( yearFromValue,
			 * associateId, appraisalcycle); Employee employee =
			 * appraisalDetailService.viewEmployeeDetails( yearFromValue,
			 * associateId); // model.addAttribute("appList",appraisalList);
			 * session.setAttribute("appList", appraisalList);
			 * model.addAttribute("emp", employee); model.addAttribute("mgr",
			 * manager);
			 */
			List<Appraisal> appraisalList = appraisalDetailService
					.viewPersonalAppraisalDetailsByEmpId(empid);
			// session.setAttribute("appList", appraisalList);
			model.addAttribute("appList", appraisalList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "managerDashboard";

	}

	// method to view personal appraisal detail of a manager
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String handleViewSpecificRequest(Model model,
			@RequestParam("cycleyear") String yearvalue,
			@RequestParam("appraisalCycle") String appraisalcycle,
			HttpServletRequest request, HttpSession session) throws IOException {
		logger.info("Returing viewSpecificAppraisal appraisal detail page");
		System.out.println("value of app cycle is" + appraisalcycle);
		System.out.println("value of year cycle is" + yearvalue);
		int empid = (Integer) request.getSession().getAttribute("empid");
		try {
			String yearFromValue = getYearFromValue(yearvalue);
			List<Appraisal> appraisalList = appraisalDetailService
					.viewAppraisalDetails(appraisalcycle, yearFromValue, empid);
			Manager manager = appraisalDetailService.viewManagerDetails(
					yearFromValue, empid, appraisalcycle);
			Employee employee = appraisalDetailService.viewEmployeeDetails(
					yearFromValue, empid, appraisalcycle);
			System.out.println("apppraisallist:" + appraisalList);

			// model.addAttribute("appList",appraisalList);
			session.setAttribute("appList", appraisalList);
			model.addAttribute("emp", employee);
			model.addAttribute("mgr", manager);
			model.addAttribute("appCycle", appraisalcycle);
			System.out.println(manager);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "viewAppraisalDetail";

	}

	// below method is to add the appraisal detail for current year
	@RequestMapping(value = "/appraisalDetailController", method = RequestMethod.POST, params = "addAppraisal")
	public String handleAddRequest(Model model,
			@RequestParam("cycleyear") String yearvalue,
			@RequestParam("appraisalCycle") String appraisalcycle,
			HttpServletRequest request, HttpSession session) throws IOException {

		try {
			logger.info("displaying page for appraisal detail insertion");
			int empid = (Integer) request.getSession().getAttribute("empid");
			String yearFromValue = getYearFromValue(yearvalue);
			/*
			 * List<Appraisal> appraisalList = appraisalDetailService
			 * .viewAppraisalDetails(yearvalue, empid);
			 * System.out.println("for aadding the appraisal"+appraisalList);
			 */
			Manager manager = appraisalDetailService.viewManagerDetails(
					yearFromValue, empid, appraisalcycle);
			Employee employee = appraisalDetailService.viewEmployeeDetails(
					yearFromValue, empid, appraisalcycle);

			System.out.println("bjdsvbjsvdsvjv" + employee);
			/*
			 * session.setAttribute("employee", employee);
			 * session.setAttribute("manager", manager);
			 */
			/* session.setAttribute("appList", appraisalList); */
			/* model.addAttribute("appList", appraisalList); */
			model.addAttribute("emp", employee);
			model.addAttribute("mgr", manager);
			model.addAttribute("appCycle", appraisalcycle);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "insertIndex";

	}
	
	@RequestMapping(value = "/logout")
	public String handleLogoutRequest(HttpServletRequest request,
			HttpSession session) throws IOException{
		request.getSession().invalidate();
		return "login";
	}

	
	// below method is to submit the details into DB after adding the details
	@RequestMapping(value = "/appraisalDetailController", method = RequestMethod.POST, params = "submitAppraisal")
	public String handleSubmitRequest(
			@ModelAttribute("appraisal") Appraisal appraisal,
			@ModelAttribute("employee") Employee employee, Model model,
			HttpSession session) throws IOException {

		logger.info("handling the submit request");
		/*
		 * @RequestParam("appraisalcycle") String appraisalcycle,
		 * 
		 * @RequestParam("sno") String sno,
		 * 
		 * @RequestParam("category") String category,
		 * 
		 * @RequestParam("objectives") String objective,
		 * 
		 * @RequestParam("remark") String remark,
		 * 
		 * @RequestParam("weightage") String weightage,
		 * 
		 * @RequestParam("trainingNeeds") String training,
		 * 
		 * @RequestParam("achievement") String achievement,
		 * 
		 * @RequestParam("mgrasses") String mgrasses,
		 * 
		 * @RequestParam("mgrcomment") String mgrcomment,
		 * 
		 * @RequestParam("performancerating") String performancerating,
		 * 
		 * @RequestParam("finalasses") String finalasses, HttpServletRequest
		 * request,
		 */
		try {

			/*
			 * Employee employee=(Employee) session.getAttribute("employee");
			 * Manager manager=(Manager) session.getAttribute("manager");
			 */

			/*
			 * appraisalService.insertAppraisalDetails(appraisal,employee.getEmpId
			 * (),manager.getMgrId());
			 */
			// appraisalService.insertAppraisalDetails(appraisal,employee);

			appraisalService.insertAppraisalCycleDetails(appraisal,
					employee.getEmpName());
			appraisalService.insertAppraisalDetails(appraisal);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "successInsert";
	}

}
