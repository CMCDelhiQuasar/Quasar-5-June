package com.cmcdelhi.quasar.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class DuePaymentCancellation extends ActionSupport implements
		SessionAware, ServletRequestAware {

	HttpServletRequest request;

	// this is for maintaining the sesson throughout the student payment.
	Map duePaymentSessionMap;

	public String cancelDuePaymentSession() {

		if (duePaymentSessionMap.get("REGISTERING_STUDENT_EMAIL") != null) {
			// removing the session objects
			duePaymentSessionMap.remove("NUMBER_OF_INSTALLMENTS");
			duePaymentSessionMap.remove("shagird");
			duePaymentSessionMap
					.remove("shagirdregistrationpaymentpaymentmode");
			duePaymentSessionMap.remove("shagirdregistrationpayment");
			duePaymentSessionMap.remove("shagirdregistrationfullfeepayment");
			duePaymentSessionMap.remove("allInstallmentsList");
			duePaymentSessionMap.remove("REGISTERING_STUDENT_EMAIL");
			duePaymentSessionMap.remove("DUE_TAG");
			return SUCCESS;
		} else {
			return ERROR;
		}

	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		duePaymentSessionMap = arg0;
	}

}
