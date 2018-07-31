package com.tax.springsms.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tax.springsms.models.CourseSubject;

@Repository
public interface CourseSubjectRepository extends CrudRepository<CourseSubject, Long>{

}
