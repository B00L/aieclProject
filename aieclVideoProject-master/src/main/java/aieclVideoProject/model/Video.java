package aieclVideoProject.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Entity implementation class for Entity: Video
 *
 */
@Entity
public class Video {
	
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String videoClass;
	private String uploadDate;
	private String eventDate;
	private int eventYear;
	private int viewCount;
	private String videoPath;
	private String duration;
	private String resolution;	

	public Video() {
		
	}

	public Video(String name, String videoClass, String uploadDate,
			String eventDate, int eventYear, int viewCount, String videoPath,
			String duration, String resolution) {
		super();
		this.name = name;
		this.videoClass = videoClass;
		this.uploadDate = uploadDate;
		this.eventDate = eventDate;
		this.eventYear = eventYear;
		this.viewCount = viewCount;
		this.videoPath = videoPath;
		this.duration = duration;
		this.resolution = resolution;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getVideoClass() {
		return videoClass;
	}

	public void setVideoClass(String videoClass) {
		this.videoClass = videoClass;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}
	

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public int getEventYear() {
		return eventYear;
	}

	public void setEventYear(int eventYear) {
		this.eventYear = eventYear;
	}

	@Override
	public int hashCode() {
		return id;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Video other = (Video) obj;
		if (id != other.id)
			return false;
		return true;
	}
   
	
}
