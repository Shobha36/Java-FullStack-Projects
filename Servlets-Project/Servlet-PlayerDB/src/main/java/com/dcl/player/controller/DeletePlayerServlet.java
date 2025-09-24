package com.dcl.player.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dcl.player.dao.PlayerDao;

@WebServlet("/delete-by-id")
public class DeletePlayerServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int playerId = Integer.parseInt(req.getParameter("playerId"));
		
		PlayerDao.deletePlayerById(playerId);
		
		resp.sendRedirect("display-all-players");
		
	}
	
	
}
