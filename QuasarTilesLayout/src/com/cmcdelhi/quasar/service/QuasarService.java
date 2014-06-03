package com.cmcdelhi.quasar.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import com.cmcdelhi.quasar.paymentDetails.Payment;
import com.cmcdelhi.quasar.student.QuasarConnectionManager;

public class QuasarService {

	QuasarConnectionManager connectionManager;

	public QuasarService() {
		// Establishing the Connection with Quasar Connection Manager
		connectionManager = QuasarConnectionManager.getInstance();

	}

	// This is class simply returns all the Pending Payments
	public List<Payment> getPendingPayments() {

		return null;

	}

	// This is class simply returns certain number the Pending Payments
	ArrayList<Payment> getPendingPayments(int noOfResult) {
		return null;
	}

	// This is class simply returns certain number the Pending Payments from
	// start to end
	ArrayList<Payment> getPendingPayments(int startResult, int noOfResult) {
		return null;
	}

	// This is class simply returns all the Pending Payments based on a Date
	public List<Payment> getPendingPayments(String date) {
		PaymentService ps = new PaymentService();
		List<Payment> paymentList = ps.getPayment(0, 0, null, 0, 0, null, date,
				0, 0, null, 0, 0, 0, 0, null);
		return paymentList;
	}

	ArrayList<Payment> getPendingPayments(Date d, int noOfResult) {
		return null;
	}

	ArrayList<Payment> getPendingPayments(Date d, int startResult,
			int noOfResult) {
		return null;
	}

	ArrayList<Payment> getPendingPayments(Date startDate, Date endDate) {
		return null;
	}

	ArrayList<Payment> getPendingPayments(Date startDate, Date endDate,
			int noOfResult) {
		return null;
	}

	ArrayList<Payment> getPendingFees(Date startDate, Date endDate,
			int noOfResultint, int startResult) {
		return null;
	}

}
