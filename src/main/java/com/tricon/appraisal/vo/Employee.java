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
	private String empDesignation;

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

	public String getEmpDesignation() {
		return empDesignation;
	}

	public void setEmpDesignation(String empDesignation) {
		this.empDesignation = empDesignation;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Employee [empName=" + empName + ", empId=" + empId
				+ ", empDesignation=" + empDesignation + "]";
	}

}
