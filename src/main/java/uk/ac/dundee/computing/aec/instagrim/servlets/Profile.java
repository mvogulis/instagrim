/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.lib.Convertors;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.UserDetails;

/**
 *
 * @author Mantis
 */
@WebServlet(urlPatterns = {
    "/Profile",
    "/Profile/*"
}) 
public class Profile extends HttpServlet {

Cluster cluster;
    
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        
        HttpSession session = request.getSession();
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");

        String username = lg.getUsername();
        User user = new User();
        user.setCluster(cluster);
        user.updateUDetails(username, fName, lName);
        response.sendRedirect("/Instagrim/Profile/" + username);    
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String args[] = Convertors.SplitRequestPath(request);
       
       User user = new User();
       user.setCluster(cluster);
       UserDetails ud = new UserDetails();
       
       ud = user.getUserDetails(args[2]);
       
       request.setAttribute("details", ud);
       
       RequestDispatcher view = request.getRequestDispatcher("/profile.jsp");
       view.forward(request, response);
    }
    
    public void destroy()
    {
        cluster.close();
    }

}
