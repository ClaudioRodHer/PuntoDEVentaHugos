package com.Hugos.Controller;

import com.Hugos.ConectionDB.ConeccionUsers;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import com.mysql.jdbc.Statement;
import java.net.URL;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javax.swing.JOptionPane;

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
    private TextField txthoraEntrada;
    @FXML
    private TextField txthoraSalida;
    @FXML
    private TextField txtContraseña;

    @FXML
    private TableView tabla;
    ConeccionUsers cc = new ConeccionUsers();
    Connection cn = cc.conexion();
    @FXML
    private void btnAgregarAction() throws ClassNotFoundException {
        try {

            Statement estado = (Statement) cn.createStatement();
            estado.executeUpdate("INSERT INTO empleado(nombre,apellido1,apellido2,telefono,puesto,horaEntrada,horaSalida,Contrasenia) VALUES('"
                    + txtNombre.getText() + "','"
                    + txtApePat.getText() + "','"
                    + txtApeMat.getText() + "','"
                    + txtTelefono.getText() + "','"
                    + cmbPuesto.getSelectionModel().getSelectedItem() + "','"
                    + txthoraEntrada.getText() + "','"
                    + txthoraSalida.getText() + "','"
                    + txtContraseña.getText() + "')");
        } catch (SQLException ex) {
            System.out.println("Error en MySQL: " + ex.getMessage());
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

    /* @FXML
    //private void tblTablaAction() {
    private void mostrar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/HugosDB", "root", "");
            Statement tabl = (Statement) con.createStatement();
            
            ResultSet res= tabl.executeQuery("SELECT * FROM empleado;");
            
            Object datos[]=new Object[8];
            //JOptionPane.showConfirmDialog(null,"Hola");
            while(res.next()){
                for(int x=0;x<8;x++){
                    datos[x]=res.getObject(x+1);
                }
            }
            
            TableColumn col1= new TableColumn("Col1");
            TableColumn col2= new TableColumn("Col1");
            TableColumn col3= new TableColumn("Col1");
            TableColumn col4= new TableColumn("Col1");
            TableColumn col5= new TableColumn("Col1");
            TableColumn col6= new TableColumn("Col1");
            TableColumn col7= new TableColumn("Col1");
            TableColumn col8= new TableColumn("Col1");
            
            tabla.getColumns().addAll(col1,col2,col3,col4,col5,col6,col7,col8);
            
// (datos);
            
            //tabla.setItems();
            res.close();
           //tabla.getItems().addAll();

        } catch (SQLException ex) {
            System.out.println("Error en MySQL: " + ex.getMessage());
        } catch (ClassNotFoundException err) {
            err.printStackTrace();
        } catch (Exception err) {
            System.out.println("se ha encontrado un error inesperado que es " + err.getMessage());
        }
    }*/
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        //  cmbPuesto.getItems().addAll("Administrador", "Cajero", "Repartidor");
        cmbPuesto.getItems().addAll("Administrador", "Cajero", "Repartidor");
        //nel
    }

}
