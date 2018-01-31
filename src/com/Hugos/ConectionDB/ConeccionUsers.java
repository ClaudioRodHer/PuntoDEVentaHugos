package com.Hugos.ConectionDB;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConeccionUsers {
//lopoikl
    Connection conect = null;

    public Connection conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/DBHugos", "root", "");

            // mostrar();
        } catch (SQLException ex) {
            System.out.println("Error en MySQL: " + ex.getMessage());
        } catch (ClassNotFoundException err) {
            err.printStackTrace();
        } catch (Exception err) {
            System.out.println("se ha encontrado un error inesperado que es " + err.getMessage());
        }
        return conect;
    }
    //hola soy madisson 
}
