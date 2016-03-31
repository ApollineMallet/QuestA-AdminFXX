package application;

import java.io.IOException;
import java.util.Observable;
import java.util.Observer;

import controllers.EditController;
import controllers.LoginController;
import controllers.MainController;
import controllers.PersonnViewController;
import qcm.models.pojo.Questionnaire;
import qcm.models.pojo.Reponse;
import qcm.models.pojo.Utilisateur;
import qcm.utils.ViewUtils;
import qcm.utils.WebGate;
import qcm.utils.saves.SaveOperationTypes;
import qcm.utils.saves.TaskQueue;

public class Main extends Application implements Observer {
	private Stage primaryStage;
	private BorderPane rootLayout;
	private ObservableList<Utilisateur> usersList;
	private ObservableList<Questionnaire> quizList;
	private ObservableList<Reponse> reponsesList;
	private PersonnViewController personnViewController;
	private WebGate webGate;
	private TaskQueue taskQueue;
	private MainController mainController;

	@Override
	public void start(Stage primaryStage) {
		this.primaryStage = primaryStage;
		this.primaryStage.setTitle("Quiz-Admin");

		initRootLayout();

		// showPersonOverview();
		taskQueue.start();
		showConnexion();
	}

	/**
	 * Initializes the root layout.
	 */
	public void initRootLayout() {
		try {
			// Load root layout from fxml file.
			FXMLLoader loader = new FXMLLoader();
			loader.setLocation(Main.class.getResource("/views/MainView.fxml"));
			rootLayout = (BorderPane) loader.load();
			mainController = loader.getController();
			mainController.setMainApp(this);
			mainController.getPbTasks().progressProperty().bind(taskQueue.getService().progressProperty());

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
			loader.setLocation(Main.class.getResource("/views/PersonnView.fxml"));
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
		return ViewUtils.showDialog("/views/EditView.fxml", primaryStage, new Function<EditController, String>() {
			@Override
			public String apply(EditController t) {
				t.setUser(user);
				return "Edition utilisateur";
			}
		});
	}

	public void showConnexion() {
		if (ViewUtils.showDialog("/views/LoginView.fxml", primaryStage, new Function<LoginController, String>() {

			@Override
			public String apply(LoginController t) {
				t.setMainApp(Main.this);
				return "Connexion";
			}
		})) {
			showPersonOverview();
			loadLists();
		}
	}

	public void handleDelete() {
		personnViewController.deleteUser();
	}

	public Main() {
		super();
		webGate = new WebGate();
		taskQueue = new TaskQueue("mainFx", webGate);
		taskQueue.addObserver(this);

		usersList = webGate.getList(Utilisateur.class);
		quizList = webGate.getList(Questionnaire.class);
		reponsesList = webGate.getList(Reponse.class);
		/*
		 * try { List<Utilisateur> users = webGate.getAll(Utilisateur.class);
		 * for (Utilisateur u : users) { usersList.add(u); } } catch
		 * (IOException e) { // TODO Alert Bootstrap JavaFX e.printStackTrace();
		 * }
		 */
		// loadLists();
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

	public WebGate getWebGate() {
		return webGate;
	}

	public TaskQueue getTaskQueue() {
		return taskQueue;
	}

	@Override
	public void stop() throws Exception {
		taskQueue.stop();
		super.stop();
	}

	@SuppressWarnings("unchecked")
	@Override
	public void update(Observable o, Object arg) {
		Object[] args = (Object[]) arg;
		if (args[0].equals(SaveOperationTypes.GET)) {
			webGate.addAll((List<Object>) args[2], (Class<Object>) args[1]);
		}
	}

	public ObservableList<Questionnaire> getQuizData() {
		return quizList;
	}

	public ObservableList<Reponse> getReponsesList() {
		return reponsesList;
	}

	public void loadLists() {
		taskQueue.getAll(Utilisateur.class);
		taskQueue.getAll(Questionnaire.class);
		taskQueue.getAll(Reponse.class);
	}
}
