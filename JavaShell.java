import java.sql.*;
import java.util.Properties;
import java.util.*;
import java.io.*;  // Reading user input.
import org.grammaticalframework.pgf.*;

public class JavaShell
{

    public static final String [] QUERIES =  {"what is the score of Hoa", 
                                              "show the scores of all members",
                                                "how many members have a score under 10",
                                                "show the first cities of all members",
                                                "show everything about all members",
                                                "which members have the highest age",
                                                "which members have the lowest score",
                                                "how many members have a score at least 9",
                                                "who lives the first city in Prague"};  
    
    public static void main(String[] args) throws Exception {
        Class.forName("org.postgresql.Driver"); 

        String url = "jdbc:postgresql:lct_members"; 

        Properties props = new Properties();
        props.setProperty("user","ud2017") ;        
        props.setProperty("password","") ;          
	    
        Connection conn = DriverManager.getConnection(url, props);

        Console console = System.console();
	    
        System.out.println("Welcome!");

	    PGF pgf = PGF.readPGF("Members.pgf") ;

	    Concr sql = pgf.getLanguages().get("MembersSQL");
        Map<String, Concr> langs = pgf.getLanguages();
	    String lang = args[0] ;
	    Concr from = pgf.getLanguages().get("Members" + lang) ;    
            
        /*some test strings*/
        for(String s : QUERIES)
           try{
               System.out.println("\n\nquery: " + s);
               makeQuery(conn, translateQuery(pgf, from, sql, s));
           }catch(Exception e) {e.printStackTrace();}
            
        while(true) {
            try{
                String query = console.readLine("? > ") ;
                makeQuery(conn, translateQuery(pgf,from,sql,query)) ;
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    static void makeQuery(Connection conn, String query) throws SQLException {
	    Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query) ;

	    int last =  rs.getMetaData().getColumnCount() ;
        while (rs.next()) {
	        for (int i = 1 ; i <= last-1 ; i++)
		        System.out.print(rs.getString(i) + " ") ;
	        System.out.println(rs.getString(last)) ;
        }
	
        rs.close();
        st.close();
    }

    static String translateQuery(PGF pgf, Concr from, Concr to, String input) throws ParseError{
	    String output = "parse error" ;
        //System.out.println(pgf.getStartCat());
	    for (ExprProb ep : from.parse(pgf.getStartCat(),input)){
	        Expr tree = ep.getExpr() ;
            System.out.println("abstract: " + tree);
	        output = to.linearize(tree) ;
	    }
	
	    output = cleanSQL(output) ;
	    System.out.println("translatedSQL: " + output) ;
	    return output ;
    }

    static String cleanSQL(String input)
    {
	return input ;
    }
}
