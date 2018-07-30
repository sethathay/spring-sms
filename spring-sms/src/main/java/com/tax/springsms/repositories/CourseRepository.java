package com.tax.springsms.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tax.springsms.models.Course;

@Repository
public interface CourseRepository extends CrudRepository<Course, Long>{
	
}
