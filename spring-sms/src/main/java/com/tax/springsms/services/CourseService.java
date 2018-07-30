package com.tax.springsms.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.models.Course;
import com.tax.springsms.repositories.CourseRepository;

@Service
public class CourseService {

	@Autowired
	private CourseRepository courseRepo;
	
	public Collection<Course> findAll(){
		List<Course> courses = new ArrayList<Course>();
		for(Course c: courseRepo.findAll()) {
			courses.add(c);
		}
		return courses;
	}
	
	//Optional for Java 8
	public Course findById(long id) {
		Optional<Course> tempT = courseRepo.findById(id);
		return tempT.isPresent() ? tempT.get(): null;
	}
	
	public void save(Course c) {
		courseRepo.save(c);
	}

}
