package com.lec.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class NullParamReqWrapper extends HttpServletRequestWrapper {

	private Map<String, String[]> parameterMap = null;
	
	public NullParamReqWrapper(HttpServletRequest req) {
		super(req);
		parameterMap = new HashMap<>(req.getParameterMap());		
	}

	public void checkNull(String[] parameterNames) {
		for(int i=0;i<parameterNames.length;i++) {
			if(!parameterMap.containsKey(parameterNames[i])) {
				String[] values = new String[] {""}; 
				parameterMap.put(parameterNames[i], values);
			}
		}
	}
}
