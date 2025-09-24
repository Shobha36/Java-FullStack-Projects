package com.mvc.sdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.sdb.entity.ProfileUrl;
import com.mvc.sdb.entity.Student;
import com.mvc.sdb.repository.ProfileRepository;
import com.mvc.sdb.repository.StudentRepository;

@Service
public class ProfileService {

	@Autowired
	private ProfileRepository profileRepository;

	@Autowired
	private StudentRepository studentRepository;

	public ModelAndView addProfile(int studentId, ProfileUrl profile) {
		Student student = studentRepository.findStudentById(studentId);
		student.getProfileUrls().add(profile);
		studentRepository.updateStudent(student);

		profile.setStudent(student);
		profileRepository.saveProfile(profile);

		List<ProfileUrl> profileUrls = student.getProfileUrls();

		return new ModelAndView("displayAllProfiles.jsp").addObject("ProfilesOfStudent", profileUrls)
				.addObject("studentId", studentId);
	}

	public ModelAndView findAllProfilesByStudentId(int studentId) {
		Student student = studentRepository.findStudentById(studentId);
		List<ProfileUrl> profiles = student.getProfileUrls();

		return new ModelAndView("displayAllProfiles.jsp").addObject("ProfilesOfStudent", profiles)
				.addObject("studentId", studentId);
	}

	public ProfileUrl getProfileById(int profileId) {
		return profileRepository.findById(profileId);

	}

	public void deleteProfile(int profileId) {
		profileRepository.deleteProfile(profileId);

	}

	public void updateProfile(ProfileUrl profile) {
	    ProfileUrl existingProfile = profileRepository.findById(profile.getProfileId());
	    if(existingProfile != null) {
	        existingProfile.setProfileName(profile.getProfileName());
	        existingProfile.setUrl(profile.getUrl());
	        profileRepository.updateProfile(existingProfile);
	    }
	}

}