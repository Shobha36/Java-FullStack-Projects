package com.mvc.sdb.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.sdb.entity.ProfileUrl;
import com.mvc.sdb.entity.Student;

@Repository
public class ProfileRepository {

	@Autowired
	private EntityManagerFactory emf;

	public void saveProfile(ProfileUrl profile) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(profile);
		et.commit();
		em.close();
	}

	public List<ProfileUrl> findProfiles(int studentId) {
		EntityManager em = emf.createEntityManager();
		Student student = em.find(Student.class, studentId);

		List<ProfileUrl> profiles = student.getProfileUrls();
		student.setProfileUrls(profiles);
		return profiles;

	}

	// Find profile by ID
	public ProfileUrl findById(int profileId) {
		EntityManager em = emf.createEntityManager();
		ProfileUrl profile = em.find(ProfileUrl.class, profileId);
		em.close();
		return profile;
	}

	// Delete profile by ID
	public void deleteProfile(int profileId) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		ProfileUrl profile = em.find(ProfileUrl.class, profileId);
		if (profile != null) {
			em.remove(profile);
		}
		et.commit();
		em.close();
	}

	public void updateProfile(ProfileUrl existingProfile) {
		EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        et.begin();
        em.merge(existingProfile); // merge updates the entity
        et.commit();
        em.close();
		
	}


	
}
