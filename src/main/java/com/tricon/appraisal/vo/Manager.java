package com.tricon.appraisal.vo;

import java.io.Serializable;

public class Manager implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*private String mgrNameH1;
	private String mgrNameH2;
	private int mgrIdH1;
	private int mgrIdH2;*/
	
	private String mgrName;
	private int mgrId;
	public String getMgrName() {
		return mgrName;
	}
	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}
	public int getMgrId() {
		return mgrId;
	}
	public void setMgrId(int mgrId) {
		this.mgrId = mgrId;
	}
	@Override
	public String toString() {
		return "Manager [mgrName=" + mgrName + ", mgrId=" + mgrId + "]";
	}


	

}
