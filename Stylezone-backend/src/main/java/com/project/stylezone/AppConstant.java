package com.project.stylezone;

import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.project.stylezone.models.Brand;

/**
 * Hello world!
 *
 */
public class AppConstant 
{
   
	public final static String message="message";
	public final static String accountEmail="stylezonewebsite@gmail.com";
	public final static String accountPassword="stylezone12345";
	public static final String USERVERIFICATION = "Verify Account";
	public static final String BASEURL = "http://localhost:8080/Stylezone-ui/";
	
	public static String getCurrentDateTime() {
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm a");
		return sdf.format(dt);
	}
	
	public static HttpHeaders fetchHTTPHeaders() {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.setContentType(MediaType.APPLICATION_JSON);
		return responseHeaders;
	}
	
	public static ResponseEntity<Object> convertToReponseEntity(Object entity, HttpHeaders header, HttpStatus status) {
		return new ResponseEntity<Object>(entity, header, status);
	}

	public static ResponseEntity<List<?>> convertToReponseEntityList(List<?> entities, HttpHeaders header,
			HttpStatus status) {
		// TODO Auto-generated method stub
		 return new ResponseEntity<List<?>>(entities, header, status);
	}

}
