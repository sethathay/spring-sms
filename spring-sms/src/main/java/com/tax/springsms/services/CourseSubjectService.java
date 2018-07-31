package com.tax.springsms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.models.CourseSubject;
import com.tax.springsms.repositories.CourseSubjectRepository;

@Service
public class CourseSubjectService {
	
	@Autowired
	private CourseSubjectRepository csRepo;
	
	public void save(CourseSubject cs) {
		csRepo.save(cs);
	}

}
