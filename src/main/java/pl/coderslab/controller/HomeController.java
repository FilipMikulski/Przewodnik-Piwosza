package pl.coderslab.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.entity.User;
import pl.coderslab.repository.CommentBeerRepository;
import pl.coderslab.repository.CommentPubRepository;
import pl.coderslab.service.UserServiceImpl;

import javax.validation.Valid;
import java.util.List;


@Controller
public class HomeController {


    @Autowired
    UserServiceImpl userService;

    @Autowired
    CommentBeerRepository commentBeerRepository;

    @Autowired
    CommentPubRepository commentPubRepository;



    @RequestMapping("/")
    public String home() {
        return "index";
    }

    @RequestMapping(path = "/register", method = RequestMethod.GET)
    public String registerForm(@RequestParam(required = false) Long id, Model model) {
        model.addAttribute("user", new User());
        return "user/register";
    }
    @RequestMapping(path = "/register", method = RequestMethod.POST)
    public String registerSave(@Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "user/register";
        }
        userService.saveUser(user);
        return "index";
    }


    @ModelAttribute("bestof5")
    public List<Object[]> bestof5() {
        return commentPubRepository.averageGratePub(new PageRequest(0, 5));
    }

    @ModelAttribute("best5")
    public List<Object[]> best5() {
        return commentBeerRepository.averageGrateBeer(new PageRequest(0, 5));
    }

}
