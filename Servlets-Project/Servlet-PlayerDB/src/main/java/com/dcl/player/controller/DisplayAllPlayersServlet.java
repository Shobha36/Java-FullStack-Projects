package com.dcl.player.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dcl.player.dao.PlayerDao;
import com.dcl.player.model.Player;

@WebServlet("/display-all-players")
public class DisplayAllPlayersServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<Player> players = PlayerDao.findAllPlayers();

		req.setAttribute("PlayerList", players);
		RequestDispatcher rd = req.getRequestDispatcher("displayAllPlayers.jsp");
		rd.forward(req, resp);

	}
}
