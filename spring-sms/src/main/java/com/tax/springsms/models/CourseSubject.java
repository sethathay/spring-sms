package com.tax.springsms.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="tbl_course_subject")
public class CourseSubject {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="course_id")
	private Course course;
	
	@ManyToOne
	@JoinColumn(name="subject_id")
	private Subject subject;
	
	//additional field
	@OneToOne
	@JoinColumn(name="teacher_id")
	private Teacher teacher;
	
	@Column(name="dayofweek")
	private int dayOfWeek;
	
	@Column(name="studytime")
	private int studyTime;
	
	@Column(name="starttime")
	private String startTime;
	
	@Column(name="endtime")
	private String endTime;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "schedule")
	private List<TeacherAttendance> attendances = new ArrayList<TeacherAttendance>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "schedule")
	private List<StudentAttendance> studentAttendances = new ArrayList<StudentAttendance>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "schedule")
	private List<Exam> exam = new ArrayList<Exam>();
	
	public CourseSubject() {
		
	}

	public CourseSubject(Course course, Subject subject, Teacher teacher, int dayOfWeek, int studyTime,
			String startTime, String endTime, List<TeacherAttendance> attendances, List<StudentAttendance> stuAttendances,List<Exam> exam) {
		this.course = course;
		this.subject = subject;
		this.teacher = teacher;
		this.dayOfWeek = dayOfWeek;
		this.studyTime = studyTime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.attendances = attendances;
		this.studentAttendances=stuAttendances;
		this.exam=exam;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public int getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(int dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public int getStudyTime() {
		return studyTime;
	}

	public void setStudyTime(int studyTime) {
		this.studyTime = studyTime;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	
	public void setAttendances(List<TeacherAttendance> attendances) {
		this.attendances = attendances;
	}
	
	public List<TeacherAttendance> getAttendances(){
		return this.attendances;
	}
	
	public void setStuAttendance(List<StudentAttendance> stuAttendance) {
		this.studentAttendances=stuAttendance;
		
	}
	
	public List<StudentAttendance> getStuAttendance(){
		return this.studentAttendances;
	}
	public void setExam(List<Exam> exams) {
		this.exam=exams;
		
	}
	
	public List<Exam> getExam(){
		return this.exam;
	}

}
