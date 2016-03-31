package controllers;

import application.Main;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

public class LoginController extends ModalController {

	private Main mainApp;
	@FXML
	private TextField txtLogin;

	@FXML
	private TextField txtPassword;

	@FXML
	private Button btConnexion;

	@FXML
	private Label lblMessage;

	public void handleConnexion() {
		if (mainApp.getWebGate().connect(txtLogin.getText(), txtPassword.getText()) != null) {
			lblMessage.setVisible(false);
			okClicked = true;
			dialogStage.close();
		} else {
			lblMessage.setText("Login ou mot de passe invalides");
			lblMessage.setVisible(true);
		}
	}

	public void setMainApp(Main mainApp) {
		this.mainApp = mainApp;
	}

}
