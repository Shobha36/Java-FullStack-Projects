package com.mvc.sdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.sdb.entity.Student;
import com.mvc.sdb.service.StudentService;

@Controller
public class StudentController {
	//this class will only have the url patterns
	//payload/body - it carries data which we are collected from the user.
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/add-student" , method = RequestMethod.POST)
	public ModelAndView createStudent(Student student) {
		return studentService.addStudent(student);		
	}
	
	@RequestMapping(value = "/find-all",method = RequestMethod.GET)
	public ModelAndView fetchStudents() {
		return studentService.fetchStudents();
	}
	
	@RequestMapping(value = "/find-by-id", method = RequestMethod.GET)
	public ModelAndView findStudents(@RequestParam("studentId") int studentId) {
	    return studentService.findStudentById(studentId);
	}
	
	
	@RequestMapping(value = "/update-student")
	public ModelAndView updateStudent(Student student){
		return studentService.updateStudent(student);
	}
	
	@RequestMapping(value = "/student/delete-by-id", method = RequestMethod.GET)
	public ModelAndView deleteStudent(int studentId){
		return studentService.deleteStudent(studentId);
	}

}	
