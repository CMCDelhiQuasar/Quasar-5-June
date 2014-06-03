package com.cmcdelhi.quasar.action;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cmcdelhi.quasar.paymentDetails.Payment;
import com.cmcdelhi.quasar.service.QuasarService;
import com.opensymphony.xwork2.ActionSupport;

public class PendingPaymentAction extends ActionSupport implements
		ServletRequestAware {

	String todaysDate;

	HttpServletRequest request;

	@Override
	public String execute() throws Exception {
		System.out.println("Inside Pending Payment Action Class");
		
		return SUCCESS;
	}

	public List<Payment> obtainePendingPayments() {
		QuasarService qs = new QuasarService();

		Calendar c = Calendar.getInstance();

		String d = c.get(Calendar.DATE) + "/" + c.get(Calendar.MONTH) + "/"
				+ c.get(Calendar.YEAR);

		d = "28/06/2014";

		todaysDate = d;

		return qs.getPendingPayments(d);

	}

	public String getTodaysDate() {
		return todaysDate;
	}

	public void setTodaysDate(String todaysDate) {
		this.todaysDate = todaysDate;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
