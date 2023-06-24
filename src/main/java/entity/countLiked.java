package entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class countLiked {
	@Id
	String title;
	Long liked;
	Date latestDate;
	Date oldestDate;
	
	public countLiked() {
		super();
	}

	public countLiked(String title, Long liked, Date latestDate, Date oldestDate) {
		super();
		this.title = title;
		this.liked = liked;
		this.latestDate = latestDate;
		this.oldestDate = oldestDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getLiked() {
		return liked;
	}

	public void setLiked(Long liked) {
		this.liked = liked;
	}

	public Date getLatestDate() {
		return latestDate;
	}

	public void setLatestDate(Date latestDate) {
		this.latestDate = latestDate;
	}

	public Date getOldestDate() {
		return oldestDate;
	}

	public void setOldestDate(Date oldestDate) {
		this.oldestDate = oldestDate;
	}
	
	
}
