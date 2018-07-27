package com.tax.springsms.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tax.springsms.models.Student;

@Repository
public interface StudentRepository extends CrudRepository<Student, Long> {
	
}
