package com.cmcdelhi.quasar.paymentDetails;

import java.util.Date;

import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Embeddable
public class PaymentDetails {

	@Temporal(TemporalType.DATE)
	private Date proposedDate;
	@Temporal(TemporalType.DATE)
	private Date paymentDate;
	private double proposedAmount;
	private double depositedAmount;
	@Temporal(TemporalType.TIMESTAMP)
	private Date timeStamp;

	public Date getProposedDate() {
		return proposedDate;
	}

	public void setProposedDate(Date proposedDate) {

		this.proposedDate = proposedDate;

	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public double getProposedAmount() {
		return proposedAmount;
	}

	public void setProposedAmount(double proposedAmount) {
		this.proposedAmount = proposedAmount;
	}

	public double getDepositedAmount() {
		return depositedAmount;
	}

	public void setDepositedAmount(double depositedAmount) {
		this.depositedAmount = depositedAmount;
	}

	public Date getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}

}
