package com.tax.springsms.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tax.springsms.models.StudentCourse;

@Repository
public interface StudentCourseRepostitory extends CrudRepository<StudentCourse, Long>{
	
	List<StudentCourse> findByCourse_idGreaterThanEqual(long course_id);
	List<StudentCourse> findByCourse_id(long course_id);


}
