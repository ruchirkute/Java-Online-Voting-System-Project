package edu.npu.votingsystem.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.npu.votingsystem.database.VotingBin;
import edu.npu.votingsystem.domain.Vote;

/**
 * Servlet implementation class JasonServlet
 */
@WebServlet("/JasonServlet")
public class JasonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	public void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		try {
			VotingBin vb = new VotingBin();
			List<Vote> list = null;
			try {
				list = vb.getVote();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			int size = list.size(), count = 1;
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			String js, jsl = "";
			js = "{";
			js += "\"Votes\": [";

			for (Vote v : list) {
				jsl += "{";
				jsl += "\"Id\": \"" + v.getId() + "\",";
				jsl += "\"Username\": \"" + v.getUsername() + "\",";
				jsl += "\"Vote\": \"" + v.getVotes() + "\"";
				jsl += "}";
				if (count != size) {
					jsl += ",";
				}
				count++;
			}

			js = js + jsl + "]";
			js += "}";
			out.print(js);
			RequestDispatcher dispatch = getServletContext()
					.getRequestDispatcher("/jason-data.jsp");
			request.setAttribute("jsondata", js);
			dispatch.forward(request, response);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

}
