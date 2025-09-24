package com.dcl.player.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dcl.player.dao.PlayerDao;
import com.dcl.player.model.Player;

@WebServlet("/add-player")
public class AddPlayerServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title =req.getParameter("title");
		int age =Integer.parseInt(req.getParameter("age"));
		double sal=Double.parseDouble(req.getParameter("sal"));
		String team =req.getParameter("team");
		String nationality =req.getParameter("nationality");
		
		Player player =new Player();
		player.setTitle(title);
		player.setAge(age);
		player.setSal(sal);
		player.setTeam(team);
		player.setNationality(nationality);
		
		PlayerDao.addPlayer(player);
		
		resp.sendRedirect("index.jsp");
	}
}
