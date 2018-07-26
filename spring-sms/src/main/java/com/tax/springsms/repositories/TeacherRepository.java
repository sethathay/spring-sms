package com.tax.springsms.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tax.springsms.models.Teacher;

@Repository
public interface TeacherRepository extends CrudRepository<Teacher, Long> {
	
}
