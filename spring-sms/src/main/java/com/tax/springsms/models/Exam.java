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
@Table(name="tbl_exam")
public class Exam {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="schedule_id")
	private CourseSubject schedule;
	
	@Column(name="exam_date")
	@Temporal(TemporalType.DATE)
	private Date examDate;
	
	@Column(name="duration")
	private int duration;
	
	@Column(name="attendance")
	private int attendance_piont;
	
	@Column(name="final_exam")
	private int finalexam_piont;
	
	public Exam() {
		
	}
	
	public Exam(CourseSubject schedule,Date exameDate,int druation,int att_piont,int fexam_piont) {
		
		this.schedule=schedule;
		this.examDate=examDate;
		this.duration=duration;
		this.attendance_piont=att_piont;
		this.finalexam_piont=fexam_piont;
		
	}
	
	public void setSchedule(CourseSubject schedule) {
		this.schedule=schedule;
	}
	
	public CourseSubject getSchedule() {
		return this.schedule;
	}
	
	public void setExamDate(Date examDate) {
		this.examDate=examDate;
	}
	
	public Date getExamDate() {
		return this.examDate;
	}
	
	public void setDuration(int duration) {
	this.duration=duration;
	}
	
	public int getDuration() {
		return this.duration;
	}
	
	public void setAttendance_piont(int att_piont) {
		this.attendance_piont=att_piont;
	}
	
	public int getAttendance_piont() {
		return this.attendance_piont;
	}
	
	public void setFinalexam_piont(int fexam_piont) {
		this.finalexam_piont=fexam_piont;
	}
	
	public int getFinalexam_piont() {
		return this.finalexam_piont;
	}

}
