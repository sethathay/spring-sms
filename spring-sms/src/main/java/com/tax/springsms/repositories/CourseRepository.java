package com.tax.springsms.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tax.springsms.models.Course;

@Repository
public interface CourseRepository extends CrudRepository<Course, Long>{
	
	//reference docs: https://docs.spring.io/spring-data/jpa/docs/1.5.1.RELEASE/reference/html/jpa.repositories.html#jpa.sample-app.finders.strategies
	List<Course> findByStatusGreaterThanEqual(int status);
	
}
