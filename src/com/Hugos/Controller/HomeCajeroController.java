
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
import javafx.stage.Stage;

public class HomeCajeroController implements Initializable {
        //-----------------CERRAR SESION---mostrar()---------------
    @FXML
    private void btnCerrarSecionAction(ActionEvent evento) throws IOException{
        ((Node)(evento.getSource())).getScene().getWindow().hide();
        Parent cerrarS =FXMLLoader.load(getClass().getResource("/com/Hugos/View/LoginBien.fxml"));
        Stage stage=new Stage();
        Scene scene=new Scene(cerrarS);
        stage.setScene(scene);
        stage.setTitle("Login");
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
        Parent menu=FXMLLoader.load(getClass().getResource("/com/Hugos/View/ORDEN_PARA_LLEVAR.fxml"));
            Stage stage=new Stage();
            Scene scene=new Scene(menu);
            stage.setScene(scene);
            stage.setTitle("¿Orden para llevar?");
            stage.show();
    }
    //-----------------REGISTRO LLEGADA------------------------
    @FXML
    private void btnRegistroAction(ActionEvent evento) throws IOException{
        Parent llegada=FXMLLoader.load(getClass().getResource("/com/Hugos/View/RegisroEntrada.fxml"));
        Stage stage =new Stage();
        Scene scene=new Scene(llegada);
        stage.setScene(scene);
        stage.setTitle("LLegada");
        stage.show();
        
    }
    //-----------------IMPRIMIR TICKET-----------------------
    @FXML
    private void btnImprimirticketAction(ActionEvent evento){
    
    }
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    
}
