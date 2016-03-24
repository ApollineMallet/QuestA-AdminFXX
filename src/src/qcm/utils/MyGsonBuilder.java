package src.qcm.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class MyGsonBuilder {
	public static Gson create() {
		GsonBuilder gsonBuilder = new GsonBuilder();
		gsonBuilder.setDateFormat("yyyy-MM-dd HH:mm:ss");
		return gsonBuilder.create();
	}

}
