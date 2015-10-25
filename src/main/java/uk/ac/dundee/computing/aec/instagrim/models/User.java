/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.UDTValue;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.Set;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.*;

/**
 *
 * @author Administrator
 */
public class User {
    Cluster cluster;
    public User(){
        
    }
    
    public boolean RegisterUser(String username, String Password){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("insert into userprofiles (login,password) Values(?,?)");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username,EncodedPassword));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }
    
    public boolean IsValidUser(String username, String Password){        
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return false;
        } else {
            for (Row row : rs) {
               
                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0)
                    return true;
            }
        }
   
    
    return false;  
    }
       public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

    public UserDetails getUserDetails(String username)
    {
        // 1 Create session connection to db
        // 2 Create prepared statement - Query to the db
        // 3 Create result set
        // 4 Create Bound statement
        // 5 Bind any free variables in the bound statement
        // 6 Execute the query and return result to the result set
        // 7 Check if there are results
        // 8 If there are loop through and get data from the result set and put into the store (if needed)
        // 9 return store
        Session session = cluster.connect("instagrim");
       
        PreparedStatement ps = session.prepare("select * from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement bs = new BoundStatement(ps);
        rs = session.execute(bs.bind(username));
        UserDetails userDetails = new UserDetails();
        if (rs.isExhausted())
        {
            System.out.println("User not found - " + rs.isExhausted());
            return null;
        }
        else
        {
            for (Row row : rs)
            {
                String login = row.getString("login");
                String firstname = row.getString("first_name");
                String lastname = row.getString("last_name");
               
                userDetails.setUser(login);
                userDetails.setFirstName(firstname);
                userDetails.setLastName(lastname);
                //userDetails.setEmail(emails);
            }
        }   
        return userDetails;
    } 
    
    
    public void updateUDetails(String user, String fName, String lName)
    {
        Session session = cluster.connect("instagrim");
        
        PreparedStatement ps = session.prepare("Update userprofiles set first_name = ?, last_name = ? where login =?");
        
        BoundStatement bs = new BoundStatement(ps);
        
        session.execute(bs.bind(fName,lName,user));
    }
}
