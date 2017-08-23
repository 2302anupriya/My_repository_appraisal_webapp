package com.tricon.appraisal.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.tricon.appraisal.service.IAppraisalDetailService;
import com.tricon.appraisal.service.ICycleYearService;
import com.tricon.appraisal.service.ILoginService;
import com.tricon.appraisal.vo.Employee;

@Controller
@Validated
public class LoginController {
	private Logger logger = Logger.getLogger(LoginController.class);
	@Autowired
	ILoginService loginService;

	@Autowired
	ICycleYearService cycleService;

	@Autowired
	IAppraisalDetailService appraisalDetailService;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String showLoginPage() {
		return "login";
	}

	@RequestMapping(value = "/getCycleYearsForAssociate/{assocEmpId}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<String> getYearList(
			@PathVariable("assocEmpId") int empid)
			throws ClassNotFoundException, SQLException, IOException {
		List<String> yearList = cycleService.getCycleYears(empid);
	/*	List<String> yearList = new ArrayList<String>();
		System.out.println(yearList1);
		for (int i = 0; i <= yearList1.size() - 1; i++) {
			yearList.add(yearList1.get(i).substring(6));
		}*/
		return yearList;
	}
	

	@RequestMapping(value = "/loginController", method = RequestMethod.POST)
	public String handleLoginRequest(Model model, @RequestParam int uid,
			@RequestParam String pwd, HttpServletRequest request)
			throws IOException {
		logger.info("Returing dashboard page");
		try {
			if (loginService.doLogin(uid, pwd)) {
				if (appraisalDetailService.fetchAssociateDetailsByMgrId(uid) == null) {
					request.getSession().setAttribute("empid", uid);

					logger.info("Returing year list page from login controller");
					List<String> yearList = this.getYearList(uid);
					/*
					 * List<String> yearList1 = cycleService.getCycleYears(uid);
					 * List<String> yearList = new ArrayList<String>();
					 * System.out.println(yearList1); for (int i = 0; i <=
					 * yearList1.size() - 1; i++) {
					 * yearList.add(yearList1.get(i).substring(6)); }
					 * System.out.println(yearList);
					 */
					// request.getSession().setAttribute("yearList", yearList);
					// model = new ModelAndView("dashboard");
					model.addAttribute("yearsList", yearList);
					return "dashboard";
				} else {
					List<Integer> empList = appraisalDetailService
							.fetchAssociateDetailsByMgrId(uid);
					request.getSession().setAttribute("empid", uid);
					model.addAttribute("associateEmpList", empList);
					List<String> yearList = this.getYearList(uid);
					model.addAttribute("yearsList", yearList);
					return "dashboard";

				}
			}
		

				 else{
                     /*errorForLogin = "Your Username and Password is Incorrect";
                     request.getSession().setAttribute("errorForLogin", errorForLogin);
                     model.addAttribute("errorForLogin");*/
                     return "accessdenied";
               }
        } catch (ClassNotFoundException e) {
               e.printStackTrace();
        } catch (SQLException e) {
               e.printStackTrace();
        }
        return "login";
 }
}
