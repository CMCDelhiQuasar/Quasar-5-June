package com.cmcdelhi.quasar.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class MotherSessionAction extends ActionSupport implements
		ServletRequestAware, SessionAware {

	String key;
	String value;
	// the request Object
	HttpServletRequest request;

	// this is for maintaining the session throughout the admin session
	Map adminSessionMap;

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String startSession() {

		if (key.equals("admin") && value.equals("admin")) {
			adminSessionMap.put("SECRET", "CMC_DELHI_QUASAR");
			return "startsession";
		} else {
			return "endsession";
		}
	}

	public String endSession() {
		adminSessionMap.remove("SECRET");
		return "endsession";
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		adminSessionMap = arg0;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
