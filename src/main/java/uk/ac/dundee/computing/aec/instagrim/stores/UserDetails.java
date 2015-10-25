/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.stores;

import com.datastax.driver.core.Cluster;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import java.util.Map;
import java.util.Set;
/**
 *
 * @author Mantis
 */
public class UserDetails {
    private String userName;
    private String fName;
    private String lName;
    private Set<String> emails;
    
    Cluster cluster;
    
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    
    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }
    
    public UserDetails() {} //constructor
    
    public void setUser(String userName)
    {
        this.userName = userName;
    }
    
    public String getUser()
    {
        return userName;
    }
    
    public void setFirstName(String fName)
    {
        this.fName = fName;
    }
    
    public String getFirstName()
    {
        return fName;
    }
    
    public void setLastName(String lName)
    {
        this.lName = lName;
    }
    
    public String getLastName()
    {
        return lName;
    }
    
    /*public void setEmail(HashSet emails)
    {
        this.emails = emails;
    }
    
    public Set<String> getEmails()
    {
        return emails;
    }*/
    
    
}
