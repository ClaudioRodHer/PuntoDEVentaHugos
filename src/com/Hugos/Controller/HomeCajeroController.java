
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
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javax.swing.JOptionPane;

public class HomeCajeroController implements Initializable {
    
    
    
     
    //sjfsof
    //-----------------CERRAR SESION---mostrar()---------------
    @FXML
    private void btnCerrarSecionAction(ActionEvent evento) throws IOException{
        ((Node)(evento.getSource())).getScene().getWindow().hide();
        Parent cerrarS =FXMLLoader.load(getClass().getResource("/com/Hugos/View/LoginBien.fxml"));
        Stage stage=new Stage();
        Scene scene=new Scene(cerrarS);
        stage.setScene(scene);
        stage.setTitle("Login");
        stage.getIcons().add(new Image("/com/Hugos/Resources/hugo.png"));
        stage.show();
        //soy nacho :V 
    }
    //-------------------QUITAR PRODUCTO--------------------
    @FXML
    private void btnQuitarProductoAction(ActionEvent evento){
    
    }
    //-------------------ACEPTAR ORDEN-------------------------
    @FXML
    private void btnAceptarOrdenAction(ActionEvent evento) throws IOException{
        Parent AceptarOrden = FXMLLoader.load(getClass().getResource("/com/Hugos/View/ORDENPARALLEVAR.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(AceptarOrden);
        stage.setScene(scene);
        stage.setTitle("Orden para llevar");
        stage.getIcons().add(new Image("/com/Hugos/Resources/hugo.png"));
        stage.show();
    }
    //-----------------REGISTRO ENTRADA------------------------
    @FXML
    private void btnRegistroAction(ActionEvent evento) throws IOException{
     Parent RegEntrada = FXMLLoader.load(getClass().getResource("/com/Hugos/View/RegistroEntrada.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(RegEntrada);
        stage.setScene(scene);
        stage.setTitle("Registro de llegada");
        stage.getIcons().add(new Image("/com/Hugos/Resources/hugo.png"));
        stage.show();
        
    }
    //-----------------IMPRIMIR TICKET-----------------------
    @FXML
    private void btnImprimirticketAction(ActionEvent evento) throws IOException{
       
    
    }
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        
       // initComponents();
        //Dimension d=Toolkit.getDefaultToolkit().getScreenSize();
       // this.setSize((int) d.getWidth() , (int) d.getHeight());
    }    
    
}
