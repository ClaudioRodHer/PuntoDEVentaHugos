/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Hugos.Controller;

import java.net.URL;
import java.util.ResourceBundle;
//import javafx.event.ActionEvent;
//import javafx.fxml.FXML;
import javafx.fxml.Initializable;
//import javafx.scene.control.ComboBox;

/**
 * FXML Controller class
 *
 * @author NACHO
 */
public class ORDEN_PARA_LLEVARController implements Initializable {

    @FXML
    private ComboBox cmbSeleccionR;
    @FXML
    
    
    private void btnSiAction(ActionEventent evento ){
        cmbSeleccionR.disableProperty();
    }
   
    @Override
   
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    
}
