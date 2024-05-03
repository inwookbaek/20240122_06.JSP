package com.lec.el;

import java.util.HashMap;
import java.util.Map;

public class Themometer {

	private Map<String, Double> locationCelsiusMap = new HashMap<String, Double>();
	
	public String getInfo() {
		return "온도변환기 V1.0";
	}
	
	public void setCelsius(String loc, Double val) {
		locationCelsiusMap.put(loc, val);
	}
	
	public Double getCelsius(String loc) {
		return locationCelsiusMap.get(loc);
	}
	
	public Double getFahrenheit(String loc) {
		Double celsius = getCelsius(loc);
		if(celsius == null) return null;
		return celsius.doubleValue() * 1.8 + 32.0;
	}
}
