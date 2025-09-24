package com.dcl.player.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dcl.player.dao.PlayerDao;
import com.dcl.player.model.Player;


@WebServlet("/update-player")
public class UpdatePlayerServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int playerId = Integer.parseInt(req.getParameter("playerId"));
		String title = req.getParameter("title");
		int age = Integer.parseInt(req.getParameter("age"));
		double sal = Double.parseDouble(req.getParameter("sal"));
		String team = req.getParameter("team");
		String nationality = req.getParameter("nationality");
		
		Player player = PlayerDao.findPlayerById(playerId);
		player.setAge(age);
		player.setTitle(title);
		player.setSal(sal);
		player.setTeam(team);
		player.setNationality(nationality);
		
		PlayerDao.updatePlayer(player);
		
		resp.sendRedirect("display-all-players");
	}
}
