package entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class userLiked {
	@Id
	String id;
	String fullname;
	String email;
	Date likeDate;

	public userLiked() {
		super();
	}

	public userLiked(String id, String fullname, String email, Date likeDate) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.likeDate = likeDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

}
