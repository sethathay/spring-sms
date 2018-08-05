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
@Table(name="tbl_teacher_att")
public class TeacherAttendance {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="schedule_id")
	private CourseSubject schedule;
	
	@Column(name="schedule_date")
	@Temporal(TemporalType.DATE)
	private Date scheduleDate;
	
	@Column(name="absent")
	private int absent;
	
	@Column(name="remark")
	private String remark;
	
	public TeacherAttendance() {
		
	}

	public TeacherAttendance(CourseSubject schedule, Date scheduleDate, int absent, String remark) {
		this.schedule = schedule;
		this.scheduleDate = scheduleDate;
		this.absent = absent;
		this.remark = remark;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public CourseSubject getSchedule() {
		return schedule;
	}

	public void setSchedule(CourseSubject schedule) {
		this.schedule = schedule;
	}

	public Date getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public int getAbsent() {
		return absent;
	}

	public void setAbsent(int absent) {
		this.absent = absent;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
