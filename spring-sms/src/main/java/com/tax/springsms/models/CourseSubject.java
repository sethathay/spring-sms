package com.tax.springsms.models;

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
	@Column(name="teacher_id")
	private int teacherId;

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

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	
	

}
