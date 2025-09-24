package com.dcl.actor_movie.entity;



import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Actor {

	@Id
	private int actorId;
	private String firstName;
	private String lastName;
	private int age;
	private int sal;
	private String industry;
	private String nationality;
	
	
	@ManyToMany(mappedBy = "actors")
	private List<Movie> movies;


	public int getActorId() {
		return actorId;
	}


	public void setActorId(int actorId) {
		this.actorId = actorId;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public int getSal() {
		return sal;
	}


	public void setSal(int sal) {
		this.sal = sal;
	}


	public String getIndustry() {
		return industry;
	}


	public void setIndustry(String industry) {
		this.industry = industry;
	}


	public String getNationality() {
		return nationality;
	}


	public void setNationality(String nationality) {
		this.nationality = nationality;
	}


	public List<Movie> getMovies() {
		return movies;
	}


	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}


	@Override
	public String toString() {
	    return "Actor [actorId=" + actorId + 
	           ", firstName=" + firstName + 
	           ", lastName=" + lastName + 
	           ", age=" + age + 
	           ", sal=" + sal + 
	           ", industry=" + industry + 
	           ", nationality=" + nationality + "]";
	}

	
	
	
}
