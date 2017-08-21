package com.tricon.appraisal.vo;

import java.io.Serializable; 
/*import org.apache.commons.lang.builder.ReflectionToStringBuilder; */
 


public class Appraisal implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String appraisalCycle;
	private int sno;
	private String designation;
	private String category;
	private String Objectives;
	private String Remark;
	private int weightage;
	private String trainingNeeds;
	private int achievementSelfAsses;
	private int mgrAsses;
	private String mgrComment;
	private int performRating;
	private int finalAsses;
	private String cycleProject;
	private String cyclePeriodFrom;
	private String cyclePeriodTo;
	private int mgrId;
	private int empId;
	private String cycleMonth;
	public String getAppraisalCycle() {
		return appraisalCycle;
	}
	public void setAppraisalCycle(String appraisalCycle) {
		this.appraisalCycle = appraisalCycle;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getObjectives() {
		return Objectives;
	}
	public void setObjectives(String objectives) {
		Objectives = objectives;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public int getWeightage() {
		return weightage;
	}
	public void setWeightage(int weightage) {
		this.weightage = weightage;
	}
	public String getTrainingNeeds() {
		return trainingNeeds;
	}
	public void setTrainingNeeds(String trainingNeeds) {
		this.trainingNeeds = trainingNeeds;
	}
	public int getAchievementSelfAsses() {
		return achievementSelfAsses;
	}
	public void setAchievementSelfAsses(int achievementSelfAsses) {
		this.achievementSelfAsses = achievementSelfAsses;
	}
	public int getMgrAsses() {
		return mgrAsses;
	}
	public void setMgrAsses(int mgrAsses) {
		this.mgrAsses = mgrAsses;
	}
	public String getMgrComment() {
		return mgrComment;
	}
	public void setMgrComment(String mgrComment) {
		this.mgrComment = mgrComment;
	}
	public int getPerformRating() {
		return performRating;
	}
	public void setPerformRating(int performRating) {
		this.performRating = performRating;
	}
	public int getFinalAsses() {
		return finalAsses;
	}
	public void setFinalAsses(int finalAsses) {
		this.finalAsses = finalAsses;
	}
	public String getCycleProject() {
		return cycleProject;
	}
	public void setCycleProject(String cycleProject) {
		this.cycleProject = cycleProject;
	}
	public String getCyclePeriodFrom() {
		return cyclePeriodFrom;
	}
	public void setCyclePeriodFrom(String cyclePeriodFrom) {
		this.cyclePeriodFrom = cyclePeriodFrom;
	}
	public String getCyclePeriodTo() {
		return cyclePeriodTo;
	}
	public void setCyclePeriodTo(String cyclePeriodTo) {
		this.cyclePeriodTo = cyclePeriodTo;
	}
	public int getMgrId() {
		return mgrId;
	}
	public void setMgrId(int mgrId) {
		this.mgrId = mgrId;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getCycleMonth() {
		return cycleMonth;
	}
	public void setCycleMonth(String cycleMonth) {
		this.cycleMonth = cycleMonth;
	}
	@Override
	public String toString() {
		return "Appraisal [appraisalCycle=" + appraisalCycle + ", sno=" + sno
				+ ", designation=" + designation + ", category=" + category
				+ ", Objectives=" + Objectives + ", Remark=" + Remark
				+ ", weightage=" + weightage + ", trainingNeeds="
				+ trainingNeeds + ", achievementSelfAsses="
				+ achievementSelfAsses + ", mgrAsses=" + mgrAsses
				+ ", mgrComment=" + mgrComment + ", performRating="
				+ performRating + ", finalAsses=" + finalAsses
				+ ", cycleProject=" + cycleProject + ", cyclePeriodFrom="
				+ cyclePeriodFrom + ", cyclePeriodTo=" + cyclePeriodTo
				+ ", mgrId=" + mgrId + ", empId=" + empId + ", cycleMonth="
				+ cycleMonth + "]";
	}



	
	
	
	}