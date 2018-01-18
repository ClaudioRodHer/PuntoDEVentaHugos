package com.Hugos.Controller;

import com.Hugos.ConectionDB.ConeccionUsers;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    //ahi es donde se hara la accion del boton para poder hacer el evento del 
    ConeccionUsers cc = new ConeccionUsers();
    Connection cn = cc.conexion();

    @FXML
    private void btnAceptarAction(ActionEvent evento) throws IOException, SQLException {
        //Statement admin = (Statement) con.createStatement();
        String tipus = "";
        String Users = "SELECT * FROM empleado WHERE nombre='" + txtUsuario.getText()
                + "' AND Contrasenia='" + passUsuario.getText() + "';";
        try {
            Statement st = (Statement) cn.createStatement();
            ResultSet rs = st.executeQuery(Users);
            while (rs.next()) {
                tipus = rs.getString("Puesto");
            }
            switch (tipus) {
                case "Administrador":
                    {
                        ((Node) (evento.getSource())).getScene().getWindow().hide();
                        Parent adm = FXMLLoader.load(getClass().getResource("/com/Hugos/View/HomeAdmin.fxml"));
                        Stage stage = new Stage();
                        Scene scene = new Scene(adm);
                        stage.setScene(scene);
                        stage.setTitle("Administrador");
                        stage.getIcons().add(new Image("/com/Hugos/Resources/hugo.png"));
                        stage.show();
                        break;
                    }
                case "Cajero":
                    {
                        ((Node) (evento.getSource())).getScene().getWindow().hide();//esta linea oculta la ventana anterior
                        //apartir de aqui se hace el llamado a la interfaz del menu
                        Parent menu = FXMLLoader.load(getClass().getResource("/com/Hugos/View/HomeCajero.fxml"));
                        Stage stage = new Stage();
                        Scene scene = new Scene(menu);
                        stage.setScene(scene);
                        stage.setTitle("Menu");
                        stage.getIcons().add(new Image("/com/Hugos/Resources/hugo.png"));
                        stage.show();
                        break;
                    }
                default:
                    JOptionPane.showMessageDialog(null, "Usuario Incorrecto");
                    txtUsuario.setText("");
                    passUsuario.setText("");
                    break;
            }
        } catch (Exception e) {
        }

        
    }

    //-----------BOTON DE CANCELAR--------------------------------//
    @FXML
    private void BtnCancelarAction(ActionEvent evento) {
        JOptionPane.showMessageDialog(null, "Hasta la proxima");
        System.exit(0);
    }

    //-----------BOTON DE REGISTRO DE LA ENTRADA DE LOS EMPLEADOS---------------//
    @FXML
    private void BtnRegistroEntradaAction(ActionEvent evento) throws IOException {
        // ((Node)(evento.getSource())).getScene().getWindow().hide();//esta linea oculta la ventana anterior
        //apartir de aqui se hace el llamado a la interfaz del menu
        Parent RegEntrada = FXMLLoader.load(getClass().getResource("/com/Hugos/View/RegistroEntrada.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(RegEntrada);
        stage.setScene(scene);
        stage.setTitle("Registro de llegada");
        stage.getIcons().add(new Image("/com/Hugos/Resources/hugo.png"));
        stage.show();
    }

    //---------------------BTNREGUSUARIO----------------------------------
    @FXML
    private void btnReguserAction(ActionEvent evento) throws IOException {

        Parent regEmp = FXMLLoader.load(getClass().getResource("/com/Hugos/View/AgregarEmpleado.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(regEmp);
        stage.setScene(scene);
        stage.setTitle("Registro de empleados");
        stage.show();
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

}
