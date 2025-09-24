package com.dcl.player.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dcl.player.dao.PlayerDao;
import com.dcl.player.model.Player;

@WebServlet("/find-by-id")
public class FindPlayerByIdServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int playerId = Integer.parseInt(req.getParameter("playerId"));

		Player player = PlayerDao.findPlayerById(playerId);

		req.setAttribute("PlayerObject", player);
		req.getRequestDispatcher("updatePlayer.jsp").forward(req, resp);
	}
}
