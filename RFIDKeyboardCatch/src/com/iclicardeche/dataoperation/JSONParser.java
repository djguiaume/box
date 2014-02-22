package com.iclicardeche.dataoperation;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.os.Environment;
import android.util.Log;

public class JSONParser {

	public static ArrayList getFromJSON() throws Exception {

		if (isExternalStorageReadable()) {
			String file = getStringFromFile(Environment.getExternalStorageDirectory()+"/tagslist.JSON");
			Log.v("JSONParser", file);
			ArrayList tagList = parseJSON(file);

			return tagList;
		}
		return null;
	}

	// JSON object parsing

	public static ArrayList parseJSON(String jsonStr) {

		ArrayList tagList = new ArrayList();
		if (jsonStr != null) {
			try {
				JSONObject jsonObj = new JSONObject(jsonStr);

				// Getting JSON Array node
				JSONArray tags = jsonObj.getJSONArray("tags");

				// looping through All Contacts
				for (int i = 0; i < tags.length(); i++) {
					JSONObject c = tags.getJSONObject(i);

					String id = c.getString("idtag");
					String type = c.getString("type");
					String ressouce = c.getString("ressouce");
					// tmp hashmap for single contact
					HashMap<String, String> tag = new HashMap<String, String>();

					// adding each child node to HashMap key => value
					tag.put("idtags", id);
					tag.put("type", type);
					tag.put("ressouce", ressouce);

					// adding contact to contact list
					tagList.add(tag);
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
		} else {
			Log.e("ServiceHandler", "Couldn't get any data from the SDcard");
		}

		return tagList;
	}

	// SD card testing

	public static boolean isExternalStorageReadable() {
		String state = Environment.getExternalStorageState();
		if (Environment.MEDIA_MOUNTED.equals(state)
				|| Environment.MEDIA_MOUNTED_READ_ONLY.equals(state)) {
			return true;
		}
		return false;
	}

	// Convert file to string

	public static String convertStreamToString(InputStream is) throws Exception {
		BufferedReader reader = new BufferedReader(new InputStreamReader(is));
		StringBuilder sb = new StringBuilder();
		String line = null;
		while ((line = reader.readLine()) != null) {
			sb.append(line).append("\n");
		}
		reader.close();
		return sb.toString();
	}

	public static String getStringFromFile(String filePath) throws Exception {
		File fl = new File(filePath);
		FileInputStream fin = new FileInputStream(fl);
		String ret = convertStreamToString(fin);
		// Make sure you close all streams.
		fin.close();
		return ret;
	}

}
