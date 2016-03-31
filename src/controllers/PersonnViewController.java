package controllers;

import java.io.IOException;

import application.Main;
import javafx.beans.property.SimpleObjectProperty;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TableView;
import qcm.models.pojo.Questionnaire;
import qcm.models.pojo.Reponse;
import qcm.models.pojo.Utilisateur;
import qcm.utils.GenericCellFactory;

public class PersonnViewController {
	@FXML
	private TableView<Utilisateur> personnTable;
	@FXML
	private TableColumn<Utilisateur, String> prenomColumn;
	@FXML
	private TableColumn<Utilisateur, String> nomColumn;

	@FXML
	private Label prenomLabel;

	@FXML
	private Label nomLabel;

	@FXML
	private Label emailLabel;

	@FXML
	private ListView<Questionnaire> lvQuizzes;

	@FXML
	private ComboBox<Reponse> cmbReponses;

	private Main mainApp;

	public PersonnViewController() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * Initializes the controller class. This method is automatically called after the fxml file has been loaded.
	 */
	@FXML
	private void initialize() {
		// Initialize the person table with the two columns.
		prenomColumn.setCellValueFactory((CellDataFeatures<Utilisateur, String> feature) -> {
			Utilisateur user = feature.getValue();
			return new SimpleObjectProperty<>(user.getPrenom());
		});
		nomColumn.setCellValueFactory((CellDataFeatures<Utilisateur, String> feature) -> {
			Utilisateur user = feature.getValue();
			return new SimpleObjectProperty<>(user.getNom());
		});
		showUser(null);
		personnTable.getSelectionModel().selectedItemProperty().addListener((observable, oldValue, newValue) -> showUser(newValue));
		lvQuizzes.setCellFactory(new GenericCellFactory<Questionnaire>());
		cmbReponses.setCellFactory(new GenericCellFactory<Reponse>());
	}

	public TableView<Utilisateur> getPersonnTable() {
		return personnTable;
	}

	public void setPersonnTable(TableView<Utilisateur> personnTable) {
		this.personnTable = personnTable;
	}

	public TableColumn<Utilisateur, String> getPrenomColumn() {
		return prenomColumn;
	}

	public void setPrenomColumn(TableColumn<Utilisateur, String> prenomColumn) {
		this.prenomColumn = prenomColumn;
	}

	public TableColumn<Utilisateur, String> getNomColumn() {
		return nomColumn;
	}

	public void setNomColumn(TableColumn<Utilisateur, String> nomColumn) {
		this.nomColumn = nomColumn;
	}

	public void setMainApp(Main mainApp) {
		this.mainApp = mainApp;
		personnTable.setItems(mainApp.getPersonData());
		lvQuizzes.setItems(mainApp.getQuizData());
		cmbReponses.setItems(mainApp.getReponsesList());
		// lblCount.textProperty().bind(mainApp.getTaskQueue().getService().progressProperty().asString());
	}

	private void showUser(Utilisateur user) {
		if (user != null) {
			prenomLabel.setText(user.getPrenom());
			nomLabel.setText(user.getNom());
			emailLabel.setText(user.getMail());

		} else {
			prenomLabel.setText("");
			nomLabel.setText("");
			emailLabel.setText("");
		}
	}

	@FXML
	public void deleteUser() {
		int selectedIndex = personnTable.getSelectionModel().getSelectedIndex();
		Utilisateur selectedUser = personnTable.getSelectionModel().getSelectedItem();
		if (selectedIndex >= 0) {
			personnTable.getItems().remove(selectedIndex);
			mainApp.getTaskQueue().delete(selectedUser, selectedUser.getId());
		} else {
			Alert alert = new Alert(AlertType.WARNING);
			alert.initOwner(mainApp.getPrimaryStage());
			alert.setTitle("No Selection");
			alert.setHeaderText("No Person Selected");
			alert.setContentText("Please select a person in the table.");

			alert.showAndWait();
		}
	}

	public void handleAddUser() {
		mainApp.getTaskQueue().getAll(Utilisateur.class);
		Utilisateur user = new Utilisateur();
		boolean okClicked = mainApp.showPersonEditDialog(user);
		if (okClicked) {
			mainApp.getPersonData().add(user);
			try {
				mainApp.getWebGate().add(user);
			} catch (IllegalArgumentException | IllegalAccessException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void handleEditUser() {
		Utilisateur selectedUser = personnTable.getSelectionModel().getSelectedItem();
		if (selectedUser != null) {
			boolean okClicked = mainApp.showPersonEditDialog(selectedUser);
			if (okClicked) {
				showUser(selectedUser);
				try {
					mainApp.getTaskQueue().update(selectedUser, selectedUser.getId());
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				personnTable.refresh();
			}

		} else {
			// Nothing selected.
			Alert alert = new Alert(AlertType.WARNING);
			alert.initOwner(mainApp.getPrimaryStage());
			alert.setTitle("No Selection");
			alert.setHeaderText("No User Selected");
			alert.setContentText("Please select a person in the table.");

			alert.showAndWait();
		}
	}

}
