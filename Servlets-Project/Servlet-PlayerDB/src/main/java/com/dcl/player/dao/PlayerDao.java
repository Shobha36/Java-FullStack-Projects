package com.dcl.player.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.dcl.player.model.Player;

public class PlayerDao {

	static EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql-config");

	public static void addPlayer(Player player) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(player);
		et.commit();
		em.close();

	}

	public static List<Player> findAllPlayers() {
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("From Player");
		List<Player> players = query.getResultList();
		em.close();
		return players;
	}

	public static Player findPlayerById(int playerId) {
		EntityManager em = emf.createEntityManager();
		Player player = em.find(Player.class, playerId);
		em.close();
		return player;
	}

	public static void updatePlayer(Player player) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.merge(player);
		et.commit();
		em.close();
		
	}

	public static void deletePlayerById(int playerId) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		Player player = em.find(Player.class, playerId);

		et.begin();
		em.remove(player);
		et.commit();
		em.close();
	
		
	}
}
