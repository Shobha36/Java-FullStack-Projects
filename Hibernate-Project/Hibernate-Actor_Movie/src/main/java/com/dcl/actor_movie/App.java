package com.dcl.actor_movie;

import com.dcl.actor_movie.dao.ActorDao;
import com.dcl.actor_movie.dao.MovieDao;

public class App {
	public static void main(String[] args) {
		ActorDao dao = new ActorDao();
		//dao.addActor();
//		dao.findActorById();
//        dao.findActorByFirstName();
//		dao.findActorBylastName();
//		dao.findActorBetweenAge();
//		dao.findActorByIndustry();
//		dao.findActorByNationality();
//		dao.updateActorAgeById();
//		dao.updateActorNationalityByFirstName();
//		dao.updateActorSalaryByIndustry();
//		dao.delectActorById();
//		dao.updateActorsSalaryByMovieId();
//		dao.findActorsByMovieTitle();
		
        MovieDao dao1 =new MovieDao();
	//	dao1.addMovie();
		dao1.findMovieById();
	    dao1.findMovieByTitle();
	    dao1.findMoviesByDirector();
	    dao1.updateMovieLanguageByTitle();
	    dao1.deleteMovieById();
	    dao1.findMoviesByActorId();
	       
	}
}
