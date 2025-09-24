package com.mvc.sdb.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.sdb.entity.Student;

@Repository
public class StudentRepository {

	@Autowired
	private EntityManagerFactory emf;

	public void saveStudent(Student student) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.persist(student);
		et.commit();
		em.close();
	}

	public List<Student> fetchStudent() {
		EntityManager em = emf.createEntityManager();
		   
        Query query = em.createQuery("Select s FROM Student s", Student.class);
        List<Student> students = query.getResultList();
        if(students.isEmpty())
        	return null;
       
        em.close();
        return students;
	}

	public Student findStudentById(int studentId) {
		EntityManager em = emf.createEntityManager();
		Student student = em.find(Student.class, studentId);
		em.close();
		return student;
	}

	public void updateStudent(Student student) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(student);
		et.commit();
		em.close();
	}

	public void deleteStudent(int studentId) {
	    EntityManager em = emf.createEntityManager();
	    EntityTransaction et = em.getTransaction();
	    et.begin();
	    Student student = em.find(Student.class, studentId);
	    if (student != null) {
	        em.remove(student);
	    }

	    et.commit();
	    em.close();
	}

	
}
