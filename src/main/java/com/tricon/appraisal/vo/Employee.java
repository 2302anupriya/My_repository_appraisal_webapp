package com.tricon.appraisal.vo;

import java.io.Serializable;
import java.util.Date;

public class Employee implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String empName;
	private int empId;
	private String empDesignationH1;
	private String empDesignationH2;
	private String empProjectH1;
	private String empProjectH2;
	private Date empFromGoalSettingPeriodH1;
	private Date empToGoalSettingPeriodH2;
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpDesignationH1() {
		return empDesignationH1;
	}
	public void setEmpDesignationH1(String empDesignationH1) {
		this.empDesignationH1 = empDesignationH1;
	}
	public String getEmpDesignationH2() {
		return empDesignationH2;
	}
	public void setEmpDesignationH2(String empDesignationH2) {
		this.empDesignationH2 = empDesignationH2;
	}
	public String getEmpProjectH1() {
		return empProjectH1;
	}
	public void setEmpProjectH1(String empProjectH1) {
		this.empProjectH1 = empProjectH1;
	}
	public String getEmpProjectH2() {
		return empProjectH2;
	}
	public void setEmpProjectH2(String empProjectH2) {
		this.empProjectH2 = empProjectH2;
	}
	public Date getEmpFromGoalSettingPeriodH1() {
		return empFromGoalSettingPeriodH1;
	}
	public void setEmpFromGoalSettingPeriodH1(Date empFromGoalSettingPeriodH1) {
		this.empFromGoalSettingPeriodH1 = empFromGoalSettingPeriodH1;
	}
	public Date getEmpToGoalSettingPeriodH2() {
		return empToGoalSettingPeriodH2;
	}
	public void setEmpToGoalSettingPeriodH2(Date empToGoalSettingPeriodH2) {
		this.empToGoalSettingPeriodH2 = empToGoalSettingPeriodH2;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Employee [empName=" + empName + ", empId=" + empId
				+ ", empDesignationH1=" + empDesignationH1
				+ ", empDesignationH2=" + empDesignationH2 + ", empProjectH1="
				+ empProjectH1 + ", empProjectH2=" + empProjectH2
				+ ", empFromGoalSettingPeriodH1=" + empFromGoalSettingPeriodH1
				+ ", empToGoalSettingPeriodH2=" + empToGoalSettingPeriodH2
				+ "]";
	}
	
	
	
}

