package aieclVideoProject.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import aieclVideoProject.interceptor.LoginInterceptor;

@Controller
@RequestMapping("/login")
public class LoginController {

	Logger logger = Logger.getLogger(LoginController.class);
	
    @RequestMapping(method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.PUT})
    public ModelAndView doGet() {
    	logger.info("méthode doGet appelée");
        return new ModelAndView("login");
    }
}
