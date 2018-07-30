package com.tax.springsms.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name="tbl_subject")
public class Subject {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="abbr")
	private String abbr;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String description;
		
	@Column(name="active")
	private boolean active;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name="tbl_teacher_subject", 
	joinColumns = @JoinColumn(name="subject_id", referencedColumnName="id"), 
	inverseJoinColumns = @JoinColumn(name="teacher_id", referencedColumnName="id"))
	//Using for infinite recursion reference between two entities
	//@JsonManagedReference
	
	@JsonIgnoreProperties("subjects")
	
	private List<Teacher> teachers = new ArrayList<Teacher>();
	
	@OneToMany(mappedBy = "subject")
	private List<CourseSubject> courseSubjects = new ArrayList<CourseSubject>();
	
	public Subject() {
		this.active = true;
	}

	public Subject(String abbr, String name, String description, boolean active) {
		this.abbr = abbr;
		this.name = name;
		this.description = description;
		this.active = active;
	}
	
	public Subject(String abbr, String name, String description, boolean active, List<Teacher> teachers) {
		this.abbr = abbr;
		this.name = name;
		this.description = description;
		this.active = active;
		this.teachers = teachers;
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

	public String getAbbr() {
		return abbr;
	}

	public void setAbbr(String abbr) {
		this.abbr = abbr;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}
	
	public List<Teacher> getTeachers(){
		return this.teachers;
	}
	
	public void setCourseSubjects(List<CourseSubject> courseSubjects) {
		this.courseSubjects = courseSubjects;
	}
	
	public List<CourseSubject> getCourseSubjects(){
		return this.courseSubjects;
	}
	
	
}
