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
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javax.swing.JOptionPane;

public class LoginController implements Initializable {
    //variables del textfield y del passwordfiel
    @FXML
    private TextField txtUsuario;
    @FXML
    private PasswordField passUsuario;
    //----------------------BOTON ACEPTAR--------------------------------------//
    //el btnAceptarAcion es el nombre que se le dio al boton enn scenebuilder en code-->On Action:btnAceptarAcion
    //ahi es donde se hara la accion del boton para poder hacer el evento del boton
    @FXML
    private void btnAceptarAction(ActionEvent evento) throws IOException{
        if(txtUsuario.getText().equals("Hugo") && passUsuario.getText().equals("1234")){
            ((Node)(evento.getSource())).getScene().getWindow().hide();//esta linea oculta la ventana anterior
            //apartir de aqui se hace el llamado a la interfaz del menu
           Parent menu=FXMLLoader.load(getClass().getResource("/com/Hugos/View/HomeCajero.fxml"));
            Stage stage=new Stage();
            Scene scene=new Scene(menu);
            stage.setScene(scene);
            stage.setTitle("Registro de llegada");
            stage.show();
        }else{
        JOptionPane.showMessageDialog(null,"Usuario Incorrecto");
        txtUsuario.setText("");
        passUsuario.setText("");
        }
    }
    //-----------BOTON DE CANCELAR--------------------------------//
    @FXML
    private void BtnCancelarAction(ActionEvent evento){
        JOptionPane.showMessageDialog(null, "Hasta la proxima");
        System.exit(0);
    }
    //-----------BOTON DE REGISTRO DE LA ENTRADA DE LOS EMPLEADOS---------------//
    @FXML
    private void BtnRegistroEntradaAction(ActionEvent evento) throws IOException{
           // ((Node)(evento.getSource())).getScene().getWindow().hide();//esta linea oculta la ventana anterior
            //apartir de aqui se hace el llamado a la interfaz del menu
            Parent RegEntrada=FXMLLoader.load(getClass().getResource("/com/Hugos/View/RegistroEntrada.fxml"));
            Stage stage=new Stage();
            Scene scene=new Scene(RegEntrada);
            stage.setScene(scene);
            stage.setTitle("Registro de llegada");
            stage.show();
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

}
