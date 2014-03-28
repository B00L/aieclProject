package aieclVideoProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "protected/video")
public class VideoController {
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome(){
		return new ModelAndView("videoDetail");
	}
}
