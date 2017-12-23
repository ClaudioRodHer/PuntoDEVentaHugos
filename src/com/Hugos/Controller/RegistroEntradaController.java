
package com.Hugos.Controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class RegistroEntradaController implements Initializable {
@FXML
private TextField txtNombre;

@FXML
private TextField txtApellido1;

@FXML
private void BtnAceptarAction(ActionEvent evento) throws IOException{
     ((Node)(evento.getSource())).getScene().getWindow().hide();
}
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    
}
