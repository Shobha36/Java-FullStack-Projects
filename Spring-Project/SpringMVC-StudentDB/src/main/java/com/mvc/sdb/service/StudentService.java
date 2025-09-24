package com.mvc.sdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.sdb.entity.Student;
import com.mvc.sdb.repository.StudentRepository;

@Service
public class StudentService {
	
	@Autowired
	private StudentRepository studentRepository;

	public ModelAndView addStudent(Student student) {
		//Resolving the Request
		studentRepository.saveStudent(student);
		
		//Generating Response
		ModelAndView mav= new ModelAndView();
		mav.setViewName("index.jsp");
		return mav;
	}

	public ModelAndView fetchStudents() {
		List<Student> students = studentRepository.fetchStudent();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("displayAllStudents.jsp");
		mav.addObject("StudentObjects", students);
		
		return mav;
	}
	public ModelAndView findStudentById(int studentId) {
		Student student = studentRepository.findStudentById(studentId);
		return new ModelAndView("updateStudent.jsp").addObject("key1", student);
	}
	
	public ModelAndView updateStudent(Student student){
		studentRepository.updateStudent(student);
		List<Student> students = studentRepository.fetchStudent();
		return new ModelAndView("displayAllStudents.jsp").addObject("StudentObjects", students);
	}
	public ModelAndView deleteStudent(int studentId) {
	    studentRepository.deleteStudent(studentId);
	    return new ModelAndView("redirect:/find-all");
	}


	
}
