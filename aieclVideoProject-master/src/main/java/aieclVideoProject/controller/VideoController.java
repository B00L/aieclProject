package aieclVideoProject.controller;

import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aieclVideoProject.service.VideoService;
import aieclVideoProject.vo.VideoListVO;

@Controller
@RequestMapping(value = "protected/video")
public class VideoController {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome(){
		return new ModelAndView("videoDetail");
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> search(@PathVariable("id") String id,
									Locale locale){
		return getVideo(id,locale,null);
	}
	
	private ResponseEntity<?> getVideo(String id, Locale locale, String actionMessageKey) {
		VideoListVO videoListVO = videoService.findById(id);
		
		Object[] args = {id};
		
		addActionMessageToVO(videoListVO,locale,"message.search.for.active",args);
		
		return new ResponseEntity<VideoListVO>(videoListVO, HttpStatus.OK);
	}
	
	private VideoListVO addActionMessageToVO(VideoListVO videoListVO, Locale locale, String actionMessageKey, Object[] args){
		if(StringUtils.isEmpty(actionMessageKey)){
			return videoListVO;
		}
			
		videoListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));
			
		return videoListVO;
	}
	
}
