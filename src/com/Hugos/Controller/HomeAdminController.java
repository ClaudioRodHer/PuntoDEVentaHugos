/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Hugos.Controller;

import com.Hugos.ConectionDB.ConeccionUsers;
import com.mysql.jdbc.Connection;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableView;

/**
 * FXML Controller class
 *
 * @author root
 */


public class HomeAdminController implements Initializable {
    ConeccionUsers cc = new ConeccionUsers();
    Connection cn = cc.conexion();
    @FXML
    TableView tblitems=new TableView();
    
            
    private void table(){
       tblitems.getColumns().addAll("SELECT * FROM empleados;");
    }
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        
    }    
    // lel prros
}
