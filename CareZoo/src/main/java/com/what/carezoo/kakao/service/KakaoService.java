package com.what.carezoo.kakao.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.apache.catalina.authenticator.Constants;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;

@Service
public class KakaoService {

//	public Map<String, Object> getUserInfo(String access_token) {
//
//		final String REQUEST_URL = "https://kapi.kakao.com/v2/user/me";
////		String CLIENT_ID = "41a4d171ad03df64283feec510fc4a40";
////		String REDIRECT_URI = "http://localhost:9000/Ykproject/write";
//
//		final HttpClient client = HttpClientBuilder.create().build();
//		final HttpPost post = new HttpPost(REQUEST_URL);
//		post.addHeader("Authorization", "Bearer " + access_token);
//		// post.addHeader("property_keys","[\"kakao_account.email\"]");
//
//		JsonNode node = null;
//		HttpResponse response;
//		Map<String, Object> customer = null;
//		try {
//			response = client.execute(post);
//			int responseCode = response.getStatusLine().getStatusCode();
//			ObjectMapper mapper = new ObjectMapper();
//			System.out.println("test : " + response.getEntity().getContent());
//			node = mapper.readTree(response.getEntity().getContent());
//
//			System.out.println("responseCode : " + responseCode);
//			System.out.println("node : " + node);
//
//			customer = new HashMap<String, Object>();
//			customer.put(Constants.Customer.NAME, node.get("properties").get("nickname").asText());
//			customer.put(Constants.Customer.SNS_TYPE, Constants.SNS.KAKAO);
//			customer.put(Constants.Customer.SNS_KEY, node.get("id").asText());
//			customer.put(Constants.Customer.EMAIL, node.get("kakao_account").get("email").asText());
//			System.out.println(customer);
//
//		} catch (ClientProtocolException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return customer;
//	}
//	
//	public Map<String, Object> logout(String access_token) {
//
//		final String REQUEST_URL = "https://kapi.kakao.com/v1/user/logout";
////		String CLIENT_ID = "41a4d171ad03df64283feec510fc4a40";
////		String REDIRECT_URI = "http://localhost:9000/Ykproject/write";
//
//		final HttpClient client = HttpClientBuilder.create().build();
//		final HttpPost post = new HttpPost(REQUEST_URL);
//		post.addHeader("Authorization", "Bearer " + access_token);
//		// post.addHeader("property_keys","[\"kakao_account.email\"]");
//
//		JsonNode node = null;
//		HttpResponse response;
//		Map<String, Object> customer = null;
//		try {
//			response = client.execute(post);
//			int responseCode = response.getStatusLine().getStatusCode();
//			ObjectMapper mapper = new ObjectMapper();
//			System.out.println("test : " + response.getEntity().getContent());
//			node = mapper.readTree(response.getEntity().getContent());
//			
//			System.out.println("kakao Logout: " + customer);
//		} catch (ClientProtocolException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return customer;
//	}
//	
//	
}
