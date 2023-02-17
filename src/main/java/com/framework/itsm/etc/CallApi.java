package com.framework.itsm.etc;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Component;

@Component
public class CallApi {


	public String getXml(String xmlMessage, String targetUrl) {
		try {
			URL url = new URL(targetUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setConnectTimeout(5000);
			con.setReadTimeout(60000);
			con.setRequestMethod("GET");
			con.setDoOutput(false);

			StringBuilder sb = new StringBuilder();

			if(con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));

				String line = "";
				while((line = br.readLine() ) != null) {
					sb.append(line).append("\n");
				}
				br.close();

				return sb.toString();
			}
		}catch(Exception e) {
			return null;
		}

		return null;
	}

	public String get(String jsonMessage, String targetUrl) {
		try {
			URL url = new URL(targetUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setConnectTimeout(5000);
			con.setReadTimeout(60000);
			con.setRequestMethod("GET");
			con.setDoOutput(false);

			StringBuilder sb = new StringBuilder();

			if(con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));

				String line = "";
				while((line = br.readLine() ) != null) {
					sb.append(line).append("\n");
				}
				br.close();

				return sb.toString();
			}
		}catch(Exception e) {
			return null;
		}

		return null;
	}

	public String post(String jsonMessage, String targetUrl) {
		try {
			URL url = new URL(targetUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setConnectTimeout(5000);
			con.setReadTimeout(60000);
			con.setRequestMethod("POST");
			con.setRequestProperty("Accept", "application/json");
			con.setRequestProperty("Content-type", "application/json");
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setUseCaches(false);
			con.setDefaultUseCaches(false);

			OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
			wr.write(jsonMessage);
			wr.flush();

			StringBuilder sb = new StringBuilder();
			int rtnCode = con.getResponseCode();
			if(rtnCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));

				String line = "";
				while((line = br.readLine() ) != null) {
					sb.append(line).append("\n");
				}
				br.close();

				return sb.toString();
			}
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}

		return null;
	}






} 
