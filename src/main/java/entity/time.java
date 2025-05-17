package entity;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import org.json.JSONArray;
import org.json.JSONObject;

public class time {
	        public static String getETA(String origin, String destination, String apiKey) {
	            try {
	                String originEnc = URLEncoder.encode(origin, "UTF-8");
	                String destEnc = URLEncoder.encode(destination, "UTF-8");

	                URI uri = new URI(
	                        "https",
	                        "maps.googleapis.com",
	                        "/maps/api/directions/json",
	                        "origin=" + originEnc +
	                                "&destination=" + destEnc +
	                                "&key=" + apiKey,
	                        null
	                );

	                URL url = uri.toURL();

	                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	                conn.setRequestMethod("GET");

	                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	                StringBuilder response = new StringBuilder();
	                String line;
	                while ((line = in.readLine()) != null) {
	                    response.append(line);
	                }
	                in.close();

	                // DEBUG: Print full JSON response
	                System.out.println("Google API Response:\n" + response);

	                JSONObject json = new JSONObject(response.toString());

	                // Check for valid response
	                if (!json.has("routes") || json.getJSONArray("routes").isEmpty()) {
	                    return "No routes found";
	                }

	                JSONArray routes = json.getJSONArray("routes");
	                JSONObject leg = routes.getJSONObject(0).getJSONArray("legs").getJSONObject(0);
	                return leg.getJSONObject("duration").getString("text");

	            } catch (Exception e) {
	                e.printStackTrace();
	            }

	            return "Unable to fetch ETA";
	        }
	    
	}



