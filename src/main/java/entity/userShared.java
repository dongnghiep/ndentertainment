package entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class userShared {
	@Id
	String sendName;
	String sendEmail;
	String receiverEmail;
	Date sendDate;
	
	public userShared() {
		super();
	}

	public userShared(String sendName, String sendEmail, String receiverEmail, Date sendDate) {
		super();
		this.sendName = sendName;
		this.sendEmail = sendEmail;
		this.receiverEmail = receiverEmail;
		this.sendDate = sendDate;
	}

	public String getSendName() {
		return sendName;
	}

	public void setSendName(String sendName) {
		this.sendName = sendName;
	}

	public String getSendEmail() {
		return sendEmail;
	}

	public void setSendEmail(String sendEmail) {
		this.sendEmail = sendEmail;
	}

	public String getReceiverEmail() {
		return receiverEmail;
	}

	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	
}
