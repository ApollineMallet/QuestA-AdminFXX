package src.qcm.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

public class HttpUtils {

	private static String sendHTML(HttpEntityEnclosingRequestBase request, Map<String, Object> params) throws ClientProtocolException, IOException {
		String result = "";
		CloseableHttpClient httpClient = HttpClients.createDefault();
		try {
			ArrayList<NameValuePair> postParameters = new ArrayList<NameValuePair>();

			for (Entry<String, Object> entry : params.entrySet()) {
				String value = null;
				if (entry.getValue() != null)
					value = (String) entry.getValue().toString();
				postParameters.add(new BasicNameValuePair(entry.getKey(), value));
			}

			request.setEntity(new UrlEncodedFormEntity(postParameters, "utf-8"));
			ResponseHandler<String> responseHandler = new BasicResponseHandler();
			result = httpClient.execute(request, responseHandler);
		} finally {
			httpClient.close();
		}
		return result;
	}

	public static String getHTML(String urlToRead) throws ClientProtocolException, IOException {
		String result = "";
		CloseableHttpClient httpClient = HttpClients.createDefault();
		try {
			HttpGet getRequest = new HttpGet(urlToRead);
			HttpResponse response;
			response = httpClient.execute(getRequest);

			if (response.getStatusLine().getStatusCode() == 200) {
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					result = EntityUtils.toString(entity, HTTP.UTF_8);
				}
			}
			// ResponseHandler<String> responseHandler = new BasicResponseHandler();
			// result = httpClient.execute(getRequest, responseHandler);
		} finally {
			httpClient.close();
		}
		return result;
	}

	public static String postHTML(String urlToRead, Map<String, Object> params) throws ClientProtocolException, IOException {
		System.out.println("POST:" + urlToRead);
		return sendHTML(new HttpPost(urlToRead), params);
	}

	public static String putHTML(String urlToRead, Map<String, Object> params) throws ClientProtocolException, IOException {
		return sendHTML(new HttpPut(urlToRead), params);
	}

	public static String deleteHTML(String urlToRead) throws ClientProtocolException, IOException {
		String result = "";
		CloseableHttpClient httpClient = HttpClients.createDefault();
		try {
			HttpDelete deleteRequest = new HttpDelete(urlToRead);
			ResponseHandler<String> responseHandler = new BasicResponseHandler();
			result = httpClient.execute(deleteRequest, responseHandler);
		} finally {
			httpClient.close();
		}
		return result;
	}
}
