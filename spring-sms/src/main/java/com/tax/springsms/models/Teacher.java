package com.tax.springsms.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="tbl_teacher")
public class Teacher {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="gender")
	private boolean gender;
	
	@Column(name="dob")
	@Temporal(TemporalType.DATE)
	private Date dob;
	
	@Column(name="pob")
	private String pob;
	
	@Column(name="address")
	private String address;
	
	@Column(name="fstatus")
	private boolean fstatus;
	
	@Column(name="caddress")
	private String caddress;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="email")
	private String email;
	
	@Column(name="active")
	private boolean active;
	
	@ManyToMany(mappedBy = "teachers")
	//Using for infinite recursion reference between two entities
	//@JsonBackReference
	
	@JsonIgnoreProperties("teachers")
	private List<Subject> subjects = new ArrayList<Subject>();
	
	public Teacher() {
		this.active = true;
	}

	public Teacher(String name, boolean gender, Date dob, String pob, String address, boolean fstatus, String caddress,
			String phone, String email, boolean active) {
		this.name = name;
		this.gender = gender;
		this.dob = dob;
		this.pob = pob;
		this.address = address;
		this.fstatus = fstatus;
		this.caddress = caddress;
		this.phone = phone;
		this.email = email;
		this.active = active;
	}
	
	public Teacher(String name, boolean gender, Date dob, String pob, String address, boolean fstatus, String caddress,
			String phone, String email, boolean active, List<Subject> subjects) {
		this.name = name;
		this.gender = gender;
		this.dob = dob;
		this.pob = pob;
		this.address = address;
		this.fstatus = fstatus;
		this.caddress = caddress;
		this.phone = phone;
		this.email = email;
		this.active = active;
		this.subjects = subjects;
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

	public boolean getGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getPob() {
		return pob;
	}

	public void setPob(String pob) {
		this.pob = pob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean getFstatus() {
		return fstatus;
	}

	public void setFstatus(boolean fstatus) {
		this.fstatus = fstatus;
	}

	public String getCaddress() {
		return caddress;
	}

	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
	public void setSubjects(List<Subject> subjects) {
		this.subjects = subjects;
	}
	
	public List<Subject> getSubjects(){
		return this.subjects;
	}
}