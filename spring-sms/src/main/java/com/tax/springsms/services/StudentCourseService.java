package com.tax.springsms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.models.CourseSubject;
import com.tax.springsms.models.StudentCourse;
import com.tax.springsms.repositories.CourseSubjectRepository;
import com.tax.springsms.repositories.StudentCourseRepostitory;

@Service
public class StudentCourseService {
	
	@Autowired
	private StudentCourseRepostitory stuCourseRepo;
	
	public void save(StudentCourse stuCourse) {
		stuCourseRepo.save(stuCourse);
	}


}
