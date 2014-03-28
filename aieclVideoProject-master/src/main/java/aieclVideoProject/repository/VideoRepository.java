package aieclVideoProject.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import aieclVideoProject.model.Video;

@Repository
public interface VideoRepository  extends PagingAndSortingRepository<Video, Integer>{
	Page<Video> findByNameLike(Pageable pageable, String name);

	//Page<Video> findById(Pageable pageable, String id);
}
