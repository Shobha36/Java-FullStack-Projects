package com.dcl.actor_movie.dao;

import java.util.List;
import java.util.Scanner;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;

import com.dcl.actor_movie.entity.Actor;
import com.dcl.actor_movie.entity.Movie;

public class ActorDao {

	static Scanner sc = new Scanner(System.in);

	static EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql-config");

	public void addActor() {
		Actor actor = new Actor();

		EntityManager em = emf.createEntityManager();
		System.out.println("Enter Actor id: ");
		actor.setActorId(sc.nextInt());
		System.out.println("Enter Actor First Name: ");
		actor.setFirstName(sc.next());
		System.out.println("Enter Actor Last Name: ");
		actor.setLastName(sc.next());
		System.out.println("Enter Actor age: ");
		actor.setAge(sc.nextInt());
		System.out.println("Enter Actor Industry: ");
		actor.setIndustry(sc.next());
		System.out.println("Enter Actor Nationality: ");
		actor.setNationality(sc.next());
		System.out.println("Enter Actor Salary: ");
		actor.setSal(sc.nextInt());
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(actor);
		et.commit();
		em.close();

	}

	public void findActorById() {
		EntityManager em = emf.createEntityManager();
		System.out.println("Enter Actor Id to find: ");
		Actor actor = em.find(Actor.class, sc.nextInt());
		if (actor != null)
			System.out.println(actor);
		else
			System.out.println("Actor not found");

	}

	public void findActorByFirstName() {
		EntityManager em = emf.createEntityManager();
		System.out.println("Enter Actor firstName to find: ");
		Query query = em.createQuery("SELECT a FROM  Actor a WHERE a.firstName=:fname");
		query.setParameter("fname", sc.next());
		List<Actor> actors = query.getResultList();
		if (actors.isEmpty())
			System.out.println("No Actors Found");
		else {
			for (Actor actor : actors) {
				System.out.println(actor);
			}
		}
	}

	public void findActorBylastName() {
		EntityManager em = emf.createEntityManager();
		System.out.println("Enter Actor LastName to find: ");
		Query query = em.createNativeQuery("SELECT * from Actor where lastName=:lname", Actor.class);
		query.setParameter("lname", sc.next());
		List<Actor> actors = query.getResultList();
		if (actors.isEmpty())
			System.out.println("Actor Not found");
		else {
			for (Actor actor : actors) {
				System.out.println(actor);
			}
		}
	}

	public void findActorBetweenAge() {

		EntityManager em = emf.createEntityManager();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Actor> cq = cb.createQuery(Actor.class);
		Root<Actor> root = cq.from(Actor.class);
		cq.select(root);
		System.out.println("Enter the starting Age and ending Age:  ");
		cq.where(cb.between(root.get("age"), sc.nextInt(), sc.nextInt()));
		Query query = em.createQuery(cq);
		List<Actor> actors = query.getResultList();
		if (actors.isEmpty()) {
			System.out.println("No actors found ");
		}
		for (Actor actor : actors) {
			System.out.println(actor);
		}

//		EntityManager em=emf.createEntityManager();
//		System.out.println("Enter starting age: ");
//		System.out.println("Enter ending age: ");
//		Query query =em.createNativeQuery("Select * from Actor where age between  :sage and :lage",Actor.class);
//		query.setParameter("sage",sc.nextInt() );
//		query.setParameter("lage",sc.nextInt());
//		List<Actor> actors =query.getResultList();
//		if(actors.isEmpty())
//			System.out.println("Actor Not found");
//		else
//		{
//			for(Actor actor:actors)
//			{
//				System.out.println(actor);
//			}
	}

	public void findActorByIndustry() {

		EntityManager em = emf.createEntityManager();
		System.out.println("Enter Actors industry to fetch: ");
		Query query = em.createQuery("SELECT a FROM Actor a WHERE a.industry=:industry");
		query.setParameter("industry", sc.next());
		List<Actor> actors = query.getResultList();
		if (actors.isEmpty()) {
			System.out.println("No actors found ");
		}
		for (Actor actor : actors) {
			System.out.println(actor);
		}
	}

	public void findActorByNationality() {

		EntityManager em = emf.createEntityManager();
		System.out.println("Enter Actors nationality to fetch: ");
		Query query = em.createNativeQuery("SELECT * FROM Actor  WHERE nationality=:nationality", Actor.class);
		query.setParameter("nationality", sc.next());
		List<Actor> actors = query.getResultList();
		if (actors.isEmpty()) {
			System.out.println("No actors found ");
		}
		for (Actor actor : actors) {
			System.out.println(actor);
		}
	}

	public void updateActorAgeById() {

		EntityManager em = emf.createEntityManager();
		System.out.println("Enter Actor's Id: ");
		Actor actor = em.find(Actor.class, sc.nextInt());
		if (actor != null) {
			EntityTransaction et = em.getTransaction();
			et.begin();
			System.out.println("Enter Actor Age to update: ");
			actor.setAge(sc.nextInt());
			em.merge(actor);
			et.commit();
		} else
			System.out.println("Actor not found");
		em.close();
	}

	public void updateActorNationalityByFirstName() {

		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaUpdate<Actor> cu = cb.createCriteriaUpdate(Actor.class);
		Root<Actor> root = cu.from(Actor.class);

		System.out.println("enter the nationality to update : ");
		cu.set(root.get("nationality"), sc.next());

		System.out.println("Enter Actors firstname whoes nation needs to Update: ");
		cu.where(cb.equal(root.get("firstName"), sc.next()));

		Query query = em.createQuery(cu);
		int res = query.executeUpdate();
		System.out.println(res + "row updated ");
		et.commit();
		em.close();
	}

	public void updateActorSalaryByIndustry() {

		EntityManager em = emf.createEntityManager();
		System.out.println("Enter Actor's Industry to find: ");
		Query query = em.createQuery("SELECT a FROM Actor a WHERE a.industry=:industry");
		query.setParameter("industry", sc.next());
		List<Actor> actors = query.getResultList();
		if (actors.isEmpty()) {
			System.out.println("no actors found");
		}
		EntityTransaction et = em.getTransaction();
		for (Actor actor : actors) {
			et.begin();
			int currentSal = actor.getSal();
			System.out.println("Enter the salary you want to update :");
			int newSal = sc.nextInt();
			actor.setSal(currentSal + newSal);
			em.merge(actor);
			System.out.println(actor);
			et.commit();
			System.out.println("Salaries update successfully");

		}
		em.close();

	}
	public void findActorsByMovieTitle() 
    {
		EntityManager em = emf.createEntityManager();
		Query query = em.createNativeQuery("select * from Movie where title =:title",Movie.class);
		System.out.println("Enter the Movie title:");
		query.setParameter("title", sc.next());
		List<Movie> movies = query.getResultList();
		for (Movie movie : movies) {
			List<Actor> actors =  movie.getActors();
			System.out.println("Actors of the movie - "+movie.getTitle()+": ");
			for (Actor actor : actors)
			{
				System.out.println(actor);
			}
		}
    }
	 public void updateActorsSalaryByMovieId() 
     {
 		EntityManager em = emf.createEntityManager();
 		EntityTransaction et = em.getTransaction();
 		System.out.println("Enter the movie Id:");
 		Movie movie = em.find(Movie.class, sc.nextInt());
 		List<Actor> actors =  movie.getActors();
		for (Actor actor : actors) {
			System.out.println(actor);
		}
		System.out.println();
		for (Actor actor : actors) 
		{
			System.out.println(actor);
			System.out.println("Enter the salary you want to update:");
			int newSalary = sc.nextInt();
			actor.setSal(newSalary);
			System.out.println("actor with id: "+actor.getActorId() +"'s salary updated.");
		}
		
		et.begin();
		et.commit();
		em.close();
     }

	public void delectActorById() {
		EntityManager em = emf.createEntityManager();
		System.out.println("Enter the Actors Id to delete: ");
		Actor actor = em.find(Actor.class, sc.nextInt());
		if (actor != null) {
			EntityTransaction et = em.getTransaction();
			et.begin();
			em.remove(actor);
			et.commit();
			System.out.println("Actor deleted");

		} else
			System.out.println("Actor not found");
		em.close();

	}
	

	
}
