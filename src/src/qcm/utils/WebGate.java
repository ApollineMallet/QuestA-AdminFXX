package src.qcm.utils;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.client.ClientProtocolException;

import com.google.gson.Gson;

public class WebGate {
	private Map<String, String> restUrlMappings;
	private String baseUrl;

	public WebGate() {
		baseUrl = "http://127.0.0.1:8080/Q2Base_Rest/rest/";
		restUrlMappings = new HashMap<>();
		restUrlMappings.put("Utilisateur", "user");
	}

	private <T> String getControllerUrl(Class<T> clazz) {
		String result = clazz.getSimpleName();
		if (restUrlMappings.containsKey(result))
			result = restUrlMappings.get(clazz.getSimpleName());
		return result;
	}

	private Map<String, Object> beanToMap(Object o) {
		Map<String, Object> result = new HashMap<>();
		Field[] declaredFields = o.getClass().getDeclaredFields();
		for (Field field : declaredFields) {
			if (field.getType().isPrimitive() || PrimitiveTypes.isWrapperType(field.getType())) {
				field.setAccessible(true);
				System.out.println(field.getName());
				try {
					result.put(field.getName(), field.get(o));
				} catch (IllegalArgumentException | IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;

	}

	public <T> List<T> getAll(Class<T> clazz) throws ClientProtocolException, IOException {
		List<T> result = new ArrayList<T>();
		String jsonUsers = HttpUtils.getHTML(baseUrl + getControllerUrl(clazz) + "/all");
		Gson gson = MyGsonBuilder.create();
		result = gson.fromJson(jsonUsers, new ListType<T>(clazz));
		return result;
	}

	public <T> List<T> getAll(Class<T> clazz, int offset, int limit) throws ClientProtocolException, IOException {
		List<T> result = new ArrayList<T>();
		String jsonUsers = HttpUtils.getHTML(baseUrl + getControllerUrl(clazz) + "/limit/" + offset + "/" + limit);
		Gson gson = MyGsonBuilder.create();
		result = gson.fromJson(jsonUsers, new ListType<T>(clazz));
		return result;
	}

	public <T> T getOne(Class<T> clazz, Object id) throws ClientProtocolException, IOException {
		String jsonO = HttpUtils.getHTML(baseUrl + getControllerUrl(clazz) + "/" + id);
		Gson gson = MyGsonBuilder.create();
		T result = gson.fromJson(jsonO, clazz);
		return result;
	}

	public <T> String delete(T object, Object id) throws ClientProtocolException, IOException {
		return HttpUtils.deleteHTML(baseUrl + getControllerUrl(object.getClass()) + "/" + String.valueOf(id));
	}

	public <T> String add(T object)
			throws ClientProtocolException, IllegalArgumentException, IllegalAccessException, IOException {
		return HttpUtils.putHTML(baseUrl + getControllerUrl(object.getClass()) + "/add", beanToMap(object));
	}

	public <T> String update(T object, Object id)
			throws ClientProtocolException, IllegalArgumentException, IllegalAccessException, IOException {
		return HttpUtils.postHTML(baseUrl + getControllerUrl(object.getClass()) + "/update/" + id, beanToMap(object));
	}

	public <T> int count(Class<T> clazz) throws ClientProtocolException, IOException {
		String jsonO = HttpUtils.getHTML(baseUrl + getControllerUrl(clazz) + "/count");
		Gson gson = MyGsonBuilder.create();
		int result = gson.fromJson(jsonO, Integer.class);
		return result;

	}
}
