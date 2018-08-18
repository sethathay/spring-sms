package com.tax.springsms.models;

import javax.persistence.*;

@Entity
@Table(name="tbl_student_score")
public class StudentScore {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="attendance")
	private int attendance_score;
	
	@Column(name="finalexam")
	private int finalexam_piont;
	
	@ManyToOne
	@JoinColumn(name="student_course_id")
	private StudentCourse studentCourse;
	
	@ManyToOne
	@JoinColumn(name="exam_piont_id")
	private Exam exam;
	
	public StudentScore() {
		
	}
	
	public StudentScore(int attScore,int examPiont,StudentCourse stuCourse,Exam exam) {
		this.attendance_score=attScore;
		this.finalexam_piont=examPiont;
		this.studentCourse=stuCourse;
		this.exam=exam;
	}
	
	public void setId(Long id) {
		this.id=id;
	}
	public Long getId() {
		return this.id;
	}
	public void setAttendance_score(int attScore) {
		this.attendance_score=attScore;
	}
	public int getAttendance_score() {
		return this.attendance_score;
	}
	public void setFinalexam_piont(int finalExam) {
		this.finalexam_piont=finalExam;
	}
	public int getFinalexam_piont() {
		return this.finalexam_piont;
	}
	public void setStudentCourse(StudentCourse stuCourse) {
		this.studentCourse=stuCourse;
	}
	public StudentCourse getStudentCourse() {
		return this.studentCourse;
	}
	public void setExam(Exam exam) {
		this.exam=exam;
	}
	public Exam getExam() {
		return this.exam;
	}
	
}
