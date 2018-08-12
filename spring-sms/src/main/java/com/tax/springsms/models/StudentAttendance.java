package com.tax.springsms.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="tbl_student_att")
public class StudentAttendance {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="schedule_id")
	private CourseSubject schedule;
	
	@ManyToOne
	@JoinColumn(name="reg_id")
	private StudentCourse studentCourses;
	
	@Column(name="schedule_date")
	@Temporal(TemporalType.DATE)
	private Date scheduleDate;
	
	@Column(name="absent")
	private int absent;
	
	@Column(name="remark")
	private String remark;
	
	public StudentAttendance() {
		
	}
	
	public StudentAttendance(CourseSubject schedule,StudentCourse stuCourse,Date schDate,int absent,String remark) {
		
		this.schedule=schedule;
		this.studentCourses=stuCourse;
		this.scheduleDate=schDate;
		this.absent=absent;
		this.remark=remark;
		
	}
	
	public void setSchedule(CourseSubject schedule) {
		this.schedule=schedule;
	}
	
	public CourseSubject getSchedule() {
		return this.schedule;
	}
	
	public void setStudentCourses(StudentCourse stuCourse) {
		this.studentCourses=stuCourse;
	}
	
	public StudentCourse getStudentCourses() {
		return this.studentCourses;
	}
	
	public void setScheduleDate(Date schDate) {
	this.scheduleDate=schDate;
	}
	
	public Date getScheduleDate() {
		return this.scheduleDate;
	}
	
	public void setAbsent(int absent) {
		this.absent=absent;
	}
	
	public int getAbsent() {
		return this.absent;
	}
	
	public void setRemark(String remark) {
		this.remark=remark;
	}
	
	public String getRemark() {
		return this.remark;
	}
}
