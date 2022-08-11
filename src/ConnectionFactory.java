
import com.sun.jdi.connect.spi.Connection;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Nathan
 */
public class ConnectionFactory{
    
    public static String caminho = "localhost";
    public static String porta = "3306";
    public static String nome = "copycountbase";
    public static String user = "root";
    public static String senha = "";
    
    public static String URL ="jdbc:mysql://"+caminho+":"+porta+"/"+nome+"?useTimezone=true&serverTimezone=GMT";
    
    public static ConnectionFactory getConnection(){
        ConnectionFactory connectionFactory = null;
        if(connectionFactory == null){
            connectionFactory = new ConnectionFactory();
            return connectionFactory;
        }else{
            return null;
        }
    }
    
    public java.sql.Connection Conn(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, user, senha);
        }catch(Exception ex){
            System.out.println("Falha ao ligar ao banco de dados"); //transformar messagebox
        }
        return null;
        
    }
    
}
