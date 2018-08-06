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
@Table(name="tbl_student_course")
public class StudentCourse {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="course_id")
	private Course course;
	
	@ManyToOne
	@JoinColumn(name="student_id")
	private Student student;
	
	@Column(name="reg_date")
	@Temporal(TemporalType.DATE)
	private Date regDate;
	
	@Column(name="printed")
	private int isPrint=0;
	
	public StudentCourse() {
		
	}
	public StudentCourse(Course course,Student stu,Date regDate) {
		this.course=course;
		this.student=stu;
		this.regDate=regDate;
	}
	
	public long getID() {
		return id;
	}
	
	public void setID(long id) {
		this.id=id;
	}
	
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate=regDate;
	}
	
	public int getIsPrinted() {
		return isPrint;
	}
	
	public void setIsPrinted(int isPrint) {
		
		this.isPrint=isPrint;
	}
}
