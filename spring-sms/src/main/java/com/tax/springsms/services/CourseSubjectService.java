package com.tax.springsms.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.models.Course;
import com.tax.springsms.models.CourseSubject;
import com.tax.springsms.models.StudentCourse;
import com.tax.springsms.repositories.CourseSubjectRepository;

@Service
public class CourseSubjectService {
	
	@Autowired
	private CourseSubjectRepository csRepo;
	
	public void save(CourseSubject cs) {
		csRepo.save(cs);
	}
	public CourseSubject findByScheduleID(long scheduleID) {
		Optional<CourseSubject> tempT = csRepo.findById(scheduleID);
		return tempT.isPresent() ? tempT.get(): null;
	}

}
