package qcm.utils;

import java.util.List;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class WebGateList {
	private Long timestamp;
	private ObservableList<Object> list;

	public WebGateList() {
		list = FXCollections.observableArrayList();
	}

	public <T extends Object> boolean add(T o) {
		timestamp = System.currentTimeMillis();
		return list.add(o);
	}

	public boolean addAll(List<Object> list) {
		timestamp = System.currentTimeMillis();
		return this.list.addAll(list);
	}

	public void clearList(Class<Object> clazz) {
		list.clear();
	}

	public Long getTimestamp() {
		return timestamp;
	}

	public ObservableList<Object> getList() {
		return list;
	}

	public void setTimestamp(Long timestamp) {
		this.timestamp = timestamp;
	}
}
