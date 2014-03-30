package aieclVideoProject.controller;

import java.util.Locale;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import aieclVideoProject.model.Video;
import aieclVideoProject.service.VideoService;
import aieclVideoProject.vo.VideoListVO;


@Controller
@RequestMapping(value= "protected/videosAdmin")
public class VideosAdminController {
	private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private MessageSource messageSource;
	
	@Value("5")
	private int maxResults;	
	
	//@Secured("ROLE_ADMIN")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome(){
		return new ModelAndView("videosAdmin");
	}
	
	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll(@RequestParam int page, Locale locale){
		return createListAllResponse(page,locale);
	}
	
	@RequestMapping(method =RequestMethod.POST, produces = "application/json")
	public ResponseEntity<?> create(@ModelAttribute("video") Video video,
									@RequestParam(required=false) String searchFor,
									@RequestParam(required=false, defaultValue=DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
									Locale locale){
		videoService.save(video);
		
		if(isSearchActivated(searchFor)){
			return search(searchFor, page, locale, "message.create.success");
		}
		
		return createListAllResponse(page,locale, "message.create.success");
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
	public ResponseEntity<?> update(@PathVariable("id") int videoId,
									@RequestBody Video video,
									@RequestParam(required=false) String searchFor,
									@RequestParam(required=false, defaultValue=DEFAULT_PAGE_DISPLAYED_TO_USER)int page,
									Locale locale){
		if( videoId != video.getId()){
			return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
		}
		
		videoService.save(video);
		
		if (isSearchActivated(searchFor)){
			return search(searchFor, page, locale, "message.update.success");
		}
		
		return createListAllResponse(page, locale, "message.update.success");
	}
	
	@RequestMapping(value = "/{videoId}", method = RequestMethod.DELETE, produces = "application/json")
	public ResponseEntity<?> delete(@PathVariable("videoId") int videoId,
									@RequestParam(required=false) String searchFor,
									@RequestParam(required=false, defaultValue=DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
									Locale locale){
		try {
			videoService.delete(videoId);
		} catch (AccessDeniedException e){
			return new ResponseEntity<Object>(HttpStatus.FORBIDDEN);
		}
		
		if(isSearchActivated(searchFor)){
			return search(searchFor,page, locale, "message.delete.success");
		}
		
		return createListAllResponse(page,locale,"message.delete.success");
		
	}
	
	@RequestMapping(value = "/{name}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> search(@PathVariable("name") String name,
									@RequestParam(required=false, defaultValue=DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
									Locale locale){
		return search(name,page,locale,null);
	}

	private ResponseEntity<?> search(String name, int page, Locale locale, String actionMessageKey) {
		VideoListVO videoListVO = videoService.findByNameLike(page, maxResults, name);
		
		if(!StringUtils.isEmpty(actionMessageKey)){
			addActionMessageToVO(videoListVO,locale,actionMessageKey,null);
		}
		
		Object[] args = {name};
		
		addSearchMessageToVO(videoListVO,locale,"message.search.for.active",args);
		
		return new ResponseEntity<VideoListVO>(videoListVO, HttpStatus.OK);
	}
	
	private VideoListVO listAll(int page) {
		return videoService.findAll(page,maxResults);
	}
	
	private ResponseEntity<VideoListVO> returnListToUser(VideoListVO videoList){
		return new ResponseEntity<VideoListVO>(videoList, HttpStatus.OK);
	}
	
	private ResponseEntity<?> createListAllResponse(int page, Locale locale){
		return createListAllResponse(page, locale, null);
	}
	
    private ResponseEntity<?> createListAllResponse(int page, Locale locale, String messageKey) {
        VideoListVO videoListVO = listAll(page);

        addActionMessageToVO(videoListVO, locale, messageKey, null);

        return returnListToUser(videoListVO);
    }
	
	private VideoListVO addActionMessageToVO(VideoListVO videoListVO, Locale locale, String actionMessageKey, Object[] args){
		if(StringUtils.isEmpty(actionMessageKey)){
			return videoListVO;
		}
			
		videoListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));
			
		return videoListVO;
	}
	
	private VideoListVO addSearchMessageToVO(VideoListVO videoListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return videoListVO;
        }

        videoListVO.setSearchMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

        return videoListVO;
    }

    private boolean isSearchActivated(String searchFor) {
        return !StringUtils.isEmpty(searchFor);
    }
    
}

