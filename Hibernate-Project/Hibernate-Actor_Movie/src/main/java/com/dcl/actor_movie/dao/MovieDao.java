package com.dcl.actor_movie.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import com.dcl.actor_movie.entity.Actor;
import com.dcl.actor_movie.entity.Movie;

public class MovieDao {

	EntityManagerFactory emf=Persistence.createEntityManagerFactory("mysql-config");
	Scanner sc =new Scanner(System.in);
	
	public void addMovie()
	{
		Movie movie =new Movie();
		System.out.println("Enter movie Id: ");
		movie.setMovieId(sc.nextInt());
		System.out.println("Enter movie Director : ");
		movie.setDirector(sc.next());
		System.out.println("Enter movie Language : ");
		movie.setLanguage(sc.next());
		System.out.println("Enter movie title: ");
		movie.setTitle(sc.next());
		EntityManager em = emf.createEntityManager();
 		em.persist(movie);
 
 		List <Actor> actorsToBeMapped = new ArrayList<>();
 		Query query = em.createNativeQuery("Select * from Actor ",Actor.class);
 		List<Actor> actors =query.getResultList();
 		 if (actors.isEmpty()) 
	        {
	            System.out.println("No actors found in the database: " );
	        } 
		  
	        for( Actor actor:actors)
	        {
	        	System.out.println(actor);
	        }
	        System.out.println("Enter actors id seperated with commas that u want to select and map to movie: ");
	        String ids=sc.next();
	        String[] stringIds=ids.split(",");
	        for(String id:stringIds)
	        {
	        	int actorId=Integer.parseInt(id);
	        	Actor actor = em.find(Actor.class, actorId);
	        	actorsToBeMapped.add(actor);	
	        }
	      	EntityTransaction et = em.getTransaction();
	        et.begin();
	        movie.setActors(actorsToBeMapped);
	        em.persist(movie);
     	et.commit();
     	em.close();
	}
	
	public void findMovieById()
	{
		EntityManager em = emf.createEntityManager();
		System.out.println("Enter the Movie Id to find: ");
		Movie movie = em.find(Movie.class,sc.nextInt());
		if(movie!=null)
		{
			System.out.println(movie);
		}
		else
		{
			System.out.println("Movie not found");
		}
		em.close();
	}
	
	public void findMovieByTitle()
	{
		EntityManager em=emf.createEntityManager();
		Query query =em.createQuery(" From Movie m Where m.title=:title");
		System.out.println("Enter the Movie title  to fetch details : ");
		query.setParameter("title",sc.next());
		List<Movie>	movies =query.getResultList();
		if(movies.isEmpty())
		{
			System.out.println("Movie not found ");
		}
		else
		{
			for(Movie movie:movies)
			{
				System.out.println(movie);
			}
	}
		em.close();
	}
	public void  findMoviesByDirector() // CB
	{
		EntityManager em =emf.createEntityManager();
		CriteriaBuilder cb= em.getCriteriaBuilder();
		CriteriaQuery<Movie> cq = cb.createQuery(Movie.class);
		Root<Movie> root = cq.from(Movie.class);
		cq.select(root);
		System.out.println("Enter the Movie Director to fetch details:");
		Query query = em.createQuery(cq);
		List<Movie> movies = query.getResultList();
		for (Movie movie : movies) 
		{
			System.out.println(movie);
		}
		em.close();
	}
	public void updateMovieLanguageByTitle() //SQL
	{
		EntityManager em =emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		Query query = em.createNativeQuery("Update movie set language =:language where title = :title");
		System.out.println("Enter the Movie title :");
		query.setParameter("title", sc.next());
		System.out.println("Enter the Language you want to update");
		query.setParameter("language", sc.next());
		et.begin();
		int res = query.executeUpdate();
		System.out.println(res+"row updated.");
		et.commit();
		em.close();
	}
	public void findMoviesByActorId() //HQL
	{
		EntityManager em =emf.createEntityManager();
		System.out.println("Enter the Actor Id :");
		Actor actor = em.find(Actor.class, sc.nextInt());
		System.out.println(actor);
		
		List<Movie> movies = actor.getMovies();
		for (Movie movie : movies) 
		{
			System.out.println(movie);
		}
		em.close();
	}
	
	public void deleteMovieById() //CB
	{
		EntityManager em =emf.createEntityManager();
        CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaDelete<Movie> cd = cb.createCriteriaDelete(Movie.class);
		Root<Movie> root =  cd.from(Movie.class);
		System.out.println("Enter the Movie Id :");
		cd.where(cb.equal(root.get("movieId"), sc.nextInt()));
		
		EntityTransaction et = em.getTransaction();
		et.begin();
		Query query = em.createQuery(cd);
		int res = query.executeUpdate();
		System.out.println(res+" row deleted.");
		et.commit();
		em.close();
	}
	
	
}
