package com.tax.springsms.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tax.springsms.models.CourseSubject;
import com.tax.springsms.models.StudentCourse;

@Repository
public interface CourseSubjectRepository extends CrudRepository<CourseSubject, Long>{

}
