package com.Hugos.Controller;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import com.mysql.jdbc.Statement;
import java.net.URL;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;

public class AgregarEmpleadoController implements Initializable {

    @FXML
    private TextField txtNombre;
    @FXML
    private TextField txtApePat;
    @FXML
    private TextField txtApeMat;
    @FXML
    private TextField txtTelefono;
    @FXML
    private ComboBox cmbPuesto;

    @FXML
    private TextField txtContraseña;

    @FXML
    private TableView tabla;

    @FXML
    private void btnAgregarAction() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/HugosDB", "root", "");
            Statement estado = (Statement) con.createStatement();
            estado.executeUpdate("INSERT INTO empleado(nombre,apellido1,apellido2,telefono,puesto,Contraseña) VALUES('"
                    + txtNombre.getText() + "',"
                    + "'" + txtApePat.getText() + "'"
                    + ",'" + txtApeMat.getText() + "','" + txtTelefono.getText() + "','"
                    + cmbPuesto.getSelectionModel().getSelectedItem() + "','"
                    + txtContraseña.getText() + "')");
            

        } catch (SQLException ex) {
            System.out.println("Error en MySQL: " + ex.getMessage());
        } catch (ClassNotFoundException err) {
            err.printStackTrace();
        } catch (Exception err) {
            System.out.println("se ha encontrado un error inesperado que es " + err.getMessage());
        }
    }

    @FXML
    private void btnNuevoAction() {

    }

    @FXML
    private void btnModificarAction(ActionEvent evento) {

    }

    @FXML
    private void btnEliminarAction(ActionEvent evento) {

    }

    @FXML
    private void tblTablaAction() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/HugosDB", "root", "");
            Statement tabl = (Statement) con.createStatement();
            tabl.executeUpdate("SELECT * FROM empleado");
           tabla.getItems().addAll();

        } catch (SQLException ex) {
            System.out.println("Error en MySQL: " + ex.getMessage());
        } catch (ClassNotFoundException err) {
            err.printStackTrace();
        } catch (Exception err) {
            System.out.println("se ha encontrado un error inesperado que es " + err.getMessage());
        }
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        cmbPuesto.getItems().addAll("Administrador", "Cajero", "Repartidor");
       
    }

}
