package com.tax.springsms.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.tax.springsms.models.StudentCourse;

@Repository
public interface StudentCourseRepostitory extends CrudRepository<StudentCourse, Long>{

}
