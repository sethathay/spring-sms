package com.tax.springsms.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.models.Student;
import com.tax.springsms.models.StudentCourse;
import com.tax.springsms.repositories.StudentCourseRepostitory;

@Service
public class StudentCourseService {
	
	@Autowired
	private StudentCourseRepostitory stuCourseRepo;
	
	public void save(StudentCourse stuCourse) {
		stuCourseRepo.save(stuCourse);
	}
	
	public List<StudentCourse> findById(Long printed) {	
		
		List<StudentCourse> stuCus = new ArrayList<StudentCourse>();
				
			List<StudentCourse> tempT = (List<StudentCourse>) stuCourseRepo.findAll();
			//return tempT.isPresent() ? tempT.get(): null;
			for( StudentCourse temp:tempT) {
				
				if(temp.getIsPrinted()==0) {
					stuCus.add(temp);
					temp.setIsPrinted(1);
					stuCourseRepo.save(temp);
				}
				
			}
		
		return stuCus;
	}
	public List<StudentCourse> findStudentByCourse(long courseID){
		
		return stuCourseRepo.findByCourse_id(courseID);
		
	}

}
