package com.Hugos.Controller;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.net.URL;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javax.swing.JOptionPane;

public class LoginController implements Initializable {
    //variables del textfield y del passwordfiel
    @FXML
    private TextField txtUsuario;
    @FXML
    private PasswordField passUsuario;

    //----------------------BOTON ACEPTAR--------------------------------------//
    //el btnAceptarAction es el nombre que se le dio al boton enn scenebuilder en code-->On Action:btnAceptarAcion
    //ahi es donde se hara la accion del boton para poder hacer el evento del boton
    @FXML
    private void btnAceptarAction(ActionEvent evento) throws IOException{
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/HugosDB", "root", "");
            Statement admin = (Statement) con.createStatement();
           admin.executeQuery("SELECT nombre FROM empleado WHERE Puesto='Administrador';");
           Statement cajero = (Statement) con.createStatement();
           cajero.executeQuery("SELECT nombre,Contrasena FROM empleado WHERE Puesto='Cajero';");
           Statement Cu=(Statement) con.createStatement();
           
           // mostrar();
            if(txtUsuario.equals(cajero) && passUsuario.equals(cajero)){
            ((Node)(evento.getSource())).getScene().getWindow().hide();//esta linea oculta la ventana anterior
            //apartir de aqui se hace el llamado a la interfaz del menu
           Parent menu=FXMLLoader.load(getClass().getResource("/com/Hugos/View/HomeCajero.fxml"));
            Stage stage=new Stage();
            Scene scene=new Scene(menu);
            stage.setScene(scene);
            stage.setTitle("Menu");
            stage.getIcons().add(new Image("/com/Hugos/Resources/hugo.png"));
            stage.show();
            }else if(txtUsuario.equals(admin) && passUsuario.getText().equals("1234")){
            Parent adm=FXMLLoader.load(getClass().getResource("/com/Hugos/View/HomeAdmin.fxml"));
            Stage stage=new Stage();
            Scene scene=new Scene(adm);
            stage.setScene(scene);
            stage.setTitle("Administrador");
            stage.getIcons().add(new Image("/com/Hugos/Resources/hugo.png"));
            stage.show();
        }else{
        JOptionPane.showMessageDialog(null,"Usuario Incorrecto");
        txtUsuario.setText("");
        passUsuario.setText("");
        }

        } catch (SQLException ex) {
            System.out.println("Error en MySQL: " + ex.getMessage());
        } catch (ClassNotFoundException err) {
            err.printStackTrace();
        } catch (Exception err) {
            System.out.println("se ha encontrado un error inesperado que es " + err.getMessage());
        }
        //if(txtUsuario.getText().equals("Hugo") && passUsuario.getText().equals("1234")){
            
        
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
    //---------------------BTNREGUSUARIO----------------------------------
    @FXML
    private void btnReguserAction(ActionEvent evento) throws IOException{
       
       
        Parent regEmp=FXMLLoader.load(getClass().getResource("/com/Hugos/View/AgregarEmpleado.fxml"));
        Stage stage=new Stage();
        Scene scene=new Scene(regEmp);
        stage.setScene(scene);
        stage.setTitle("Registro de empleados");
        stage.show();
    }
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

}
