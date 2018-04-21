package com.project.stylezone;

import java.io.IOException;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

/**
 * Hello world!
 *
 */
public class AppConstant {

	public final static String message = "message";
	public final static String accountEmail = "stylezonewebsite@gmail.com";
	public final static String accountPassword = "stylezone12345";
	public static final String USERVERIFICATION = "Verify Account";
	public static final String BASEURL = "http://localhost:8080/Stylezone-ui/";

	public static String getCurrentDateTime() {
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm a");
		return sdf.format(dt);
	}

	public static String getFormatedDate(Date dt) {

		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd ");
		return sdf.format(dt);

	}
	
	
	public static Date getFormatedDateDDMMYY(Date dt) {
		SimpleDateFormat myFormat = new SimpleDateFormat("dd MM yyyy");
		String format = myFormat.format(dt);
		try {
			return myFormat.parse(format);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	public static Date getDateFromStringDDMMYY(String date) {

		SimpleDateFormat myFormat = new SimpleDateFormat("dd-MM-yyyy");
		 try {
			return myFormat.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	public static Date getDateTime() {
		java.util.Date dt = new java.util.Date();

		return dt;
	}

	public static String getOTP() {
		SecureRandom random = new SecureRandom();
		int num = random.nextInt(100000);
		return String.format("%05d", num);

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

	public static Date getEpiryTime() {
		// TODO Auto-generated method stub
		Calendar now = Calendar.getInstance();
		now.add(Calendar.MINUTE, 10);
		Date teenMinutesFromNow = now.getTime();
		return teenMinutesFromNow;

	}

	public static String getCurrentTimeInMs() {
		
		// TODO Auto-generated method stub
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyMMddhhmmssMs");
		return ft.format(dNow)+UUID.randomUUID().toString().replace("-", "");
	}

	
	public static long betweenDates(Date firstDate, Date secondDate) throws IOException
	{
	    return ChronoUnit.DAYS.between(firstDate.toInstant(), secondDate.toInstant());
	}
}
