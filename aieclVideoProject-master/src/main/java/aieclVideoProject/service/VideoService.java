package aieclVideoProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import aieclVideoProject.model.Video;
import aieclVideoProject.repository.VideoRepository;
import aieclVideoProject.vo.VideoListVO;

@Service
@Transactional
public class VideoService {

	@Autowired
	private VideoRepository videoRepository;
	
	@Transactional(readOnly=true)
	public VideoListVO findAll(int page, int maxResults) {
		Page<Video> result = executeQueryFindAll(page, maxResults);
		
		if(shouldExecuteSameQuaeryInLastPage(page, result)){
			int lastPage = result.getTotalPages()-1;
			result = executeQueryFindAll(lastPage,maxResults);
		}
		
		return buildResult(result);
	}

	public void save(Video video) {
		videoRepository.save(video);
	}

	@Secured("ROLE_ADMIN")
	public void delete(int videoId) {
		videoRepository.delete(videoId);
	}

	@Transactional(readOnly=true)
	public VideoListVO findByNameLike(int page, int maxResults, String name) {
		Page<Video> result = executeQueryFindByName(page, maxResults, name);
		
		if(shouldExecuteSameQuaeryInLastPage(page, result)){
			int lastPage = result.getTotalPages()-1;
			result = executeQueryFindByName(lastPage,maxResults,name);
		}
		
		return buildResult(result);
	}

	private Page<Video> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return videoRepository.findByNameLike(pageRequest, "%" + name + "%");
	}
	
	@Transactional(readOnly=true)
	public Video findById(Integer id) {
		return videoRepository.findOne(id);
	}

	private VideoListVO buildResult(Page<Video> result) {
		return new VideoListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
	}

	private boolean shouldExecuteSameQuaeryInLastPage(int page, Page<Video> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
	}

	private Page<Video> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return videoRepository.findAll(pageRequest);
	}
	
    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }
    
    private boolean isUserAfterOrOnLastPage(int page, Page<Video> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Video> result) {
        return result.getTotalElements() > 0;
    }

}
