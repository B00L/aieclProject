package aieclVideoProject.vo;

import aieclVideoProject.model.Video;

import java.util.List;

public class VideoListVO {
    private int pagesCount;
    private long totalVideos;

    private String actionMessage;
    private String searchMessage;

    private List<Video> videos;

    public VideoListVO() {
    }

    public VideoListVO(int pages, long totalVideos, List<Video> videos) {
        this.pagesCount = pages;
        this.videos = videos;
        this.totalVideos = totalVideos;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Video> getVideos() {
        return videos;
    }

    public void setVideos(List<Video> videos) {
        this.videos = videos;
    }

    public long getTotalVideos() {
        return totalVideos;
    }

    public void setTotalVideos(long totalVideos) {
        this.totalVideos = totalVideos;
    }

    public String getActionMessage() {
        return actionMessage;
    }

    public void setActionMessage(String actionMessage) {
        this.actionMessage = actionMessage;
    }

    public String getSearchMessage() {
        return searchMessage;
    }

    public void setSearchMessage(String searchMessage) {
        this.searchMessage = searchMessage;
    }
}
