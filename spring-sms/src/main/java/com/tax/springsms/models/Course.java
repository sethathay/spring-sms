package com.tax.springsms.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="tbl_course")
public class Course {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;	
	
	@Column(name="name")
	private String name;
	
	@Column(name="duration")
	private int duration;
	
	@Column(name="start_date")
	private Date startDate;
	
	@Column(name="end_date")
	private Date endDate;
	
	@Column(name="status")
	private int status;
	
	@Column(name="active")
	private boolean active;
	
	@OneToMany(mappedBy = "course")
	private List<CourseSubject> courseSubjects = new ArrayList<CourseSubject>();
	
	public Course() {
		this.active = true;
	}

	public Course(String name, int duration, Date startDate, Date endDate, int status, boolean active) {
		this.name = name;
		this.duration = duration;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.active = active;
	}

	public Course(String name, int duration, Date startDate, Date endDate, int status, boolean active, List<CourseSubject> courseSubjects) {
		this.name = name;
		this.duration = duration;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.active = active;
		this.courseSubjects = courseSubjects;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
	public void setCourseSubjects(List<CourseSubject> courseSubjects) {
		this.courseSubjects = courseSubjects;
	}
	
	public List<CourseSubject> getCourseSubjects(){
		return this.courseSubjects;
	}

}