package src.application;

import java.io.IOException;
import java.util.List;

import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import src.controllers.EditController;
import src.controllers.MainController;
import src.controllers.PersonnViewController;
import src.models.Utilisateur;
import src.qcm.utils.WebGate;

public class Main extends Application {
	private Stage primaryStage;
	private BorderPane rootLayout;
	private ObservableList<Utilisateur> usersList;
	private PersonnViewController personnViewController;
	private WebGate webGate;

	@Override
	public void start(Stage primaryStage) {
		this.primaryStage = primaryStage;
		this.primaryStage.setTitle("AddressApp");

		initRootLayout();

		showPersonOverview();
	}

	/**
	 * Initializes the root layout.
	 */
	public void initRootLayout() {
		try {
			// Load root layout from fxml file.
			FXMLLoader loader = new FXMLLoader();
			loader.setLocation(Main.class.getResource("/src/views/MainView.fxml"));
			rootLayout = (BorderPane) loader.load();
			MainController ctrl = loader.getController();
			ctrl.setMainApp(this);
			// Show the scene containing the root layout.
			Scene scene = new Scene(rootLayout);
			primaryStage.setScene(scene);
			primaryStage.show();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Shows the person overview inside the root layout.
	 */
	public void showPersonOverview() {
		try {
			// Load person overview.
			FXMLLoader loader = new FXMLLoader();
			loader.setLocation(Main.class.getResource("/src/views/PersonnView.fxml"));
			AnchorPane personOverview = (AnchorPane) loader.load();

			// Set person overview into the center of root layout.
			rootLayout.setCenter(personOverview);

			// Give the controller access to the main app.
			personnViewController = loader.getController();
			personnViewController.setMainApp(this);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Opens a dialog to edit details for the specified person. If the user
	 * clicks OK, the changes are saved into the provided person object and true
	 * is returned.
	 *
	 * @param user
	 *            the person object to be edited
	 * @return true if the user clicked OK, false otherwise.
	 */
	public boolean showPersonEditDialog(Utilisateur user) {
		try {
			// Load the fxml file and create a new stage for the popup dialog.
			FXMLLoader loader = new FXMLLoader();
			loader.setLocation(Main.class.getResource("src/views/EditView.fxml"));
			AnchorPane page = (AnchorPane) loader.load();

			// Create the dialog Stage.
			Stage dialogStage = new Stage();
			dialogStage.setTitle("Edition utilisateur");
			dialogStage.initModality(Modality.WINDOW_MODAL);
			dialogStage.setResizable(false);
			dialogStage.initOwner(primaryStage);
			Scene scene = new Scene(page);
			dialogStage.setScene(scene);

			// Set the person into the controller.
			EditController controller = loader.getController();
			controller.setDialogStage(dialogStage);
			controller.setUser(user);

			// Show the dialog and wait until the user closes it
			dialogStage.showAndWait();

			return controller.isOkClicked();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

	public void handleDelete() {
		personnViewController.deleteUser();
	}

	public void handleAdd() {
		personnViewController.handleAddUser();
	}

	public void handleUpdate() {
		personnViewController.handleEditUser();
	}

	public Main() {
		super();
		webGate = new WebGate();
		usersList = FXCollections.observableArrayList();
		try {
			List<Utilisateur> users = webGate.getAll(Utilisateur.class);
			for (Utilisateur u : users) {
				usersList.add(u);
			}
		} catch (IOException e) {
			// Alert Bootstrap JavaFX
			e.printStackTrace();
		}

	}

	/**
	 * Returns the main stage.
	 * 
	 * @return
	 */
	public Stage getPrimaryStage() {
		return primaryStage;
	}

	public static void main(String[] args) {
		launch(args);
	}

	public ObservableList<Utilisateur> getPersonData() {
		return usersList;
	}

	public void setPersonData(ObservableList<Utilisateur> personData) {
		this.usersList = personData;
	}
}
