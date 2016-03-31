package qcm.utils;

import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;
import javafx.util.Callback;

public class GenericCellFactory<T>
		implements Callback<ListView<T>, ListCell<T>> {

	@Override
	public ListCell<T> call(ListView<T> param) {
		return new ListCell<T>() {
			@Override
			protected void updateItem(T o, boolean empty) {
				super.updateItem(o, empty);
				if (o != null)
					setText(o.toString());
			}
		};
	}

}
