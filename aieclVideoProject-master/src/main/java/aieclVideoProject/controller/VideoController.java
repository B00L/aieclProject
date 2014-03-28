package aieclVideoProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import aieclVideoProject.model.Video;
import aieclVideoProject.service.VideoService;

@Controller
@RequestMapping(value = "protected/videoView")
public class VideoController {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome(){
		return new ModelAndView("videoView");
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> searchVideo(@PathVariable("id") Integer id){
		return getVideo(id);
	}
	
	private ResponseEntity<?> getVideo(Integer id) {
		Video video = videoService.findById(id);
		video.setViewCount(video.getViewCount()+1);
		videoService.save(video);
		return new ResponseEntity<Video>(video, HttpStatus.OK);
	}
	
}
