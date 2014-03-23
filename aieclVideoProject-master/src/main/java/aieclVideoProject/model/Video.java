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
	private int viewCount;
	private String videoPath;
	private String duration;
	private String videoResolution;	

	public Video() {
		
	}

	public Video(int id, String name, String videoClass, String uploadDate,
			int viewCount, String videoPath, String duration,
			String videoResolution) {
		super();
		this.id = id;
		this.name = name;
		this.videoClass = videoClass;
		this.uploadDate = uploadDate;
		this.viewCount = viewCount;
		this.videoPath = videoPath;
		this.duration = duration;
		this.videoResolution = videoResolution;
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

	public String getVideoResolution() {
		return videoResolution;
	}

	public void setVideoResolution(String videoResolution) {
		this.videoResolution = videoResolution;
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
