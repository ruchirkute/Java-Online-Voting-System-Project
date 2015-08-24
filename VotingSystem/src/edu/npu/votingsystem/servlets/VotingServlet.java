package edu.npu.votingsystem.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import edu.npu.votingsystem.database.VotingBin;
import edu.npu.votingsystem.domain.Vote;

/**
 * Servlet implementation class VotingServlet
 */
@WebServlet("/VotingServlet")
public class VotingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VotingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Vote vt = new Vote();
		VotingBin vb = new VotingBin();
		int count=0;
		vt.setUsername(request.getParameter("username"));
		vt.setVotes(request.getParameter("vote"));
		
		try {
			count = vb.voteCheck(vt);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(count>0) {
			String message = "Sorry! Your vote is already been registered!";
	        request.setAttribute("message", message);
	        RequestDispatcher rd = request.getRequestDispatcher("vote.jsp");
	        rd.forward(request,response);
		}
		else {
			try {
				vb.voteRegistration(vt);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String message = "Your vote has been registered. Thank you :)";
	        request.setAttribute("message", message);
	        RequestDispatcher rd = request.getRequestDispatcher("vote.jsp");
	        rd.forward(request,response);
		}
	}

}
