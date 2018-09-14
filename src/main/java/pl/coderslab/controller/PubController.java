package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.CommentPub;
import pl.coderslab.entity.CurrentUser;
import pl.coderslab.entity.Pub;

import pl.coderslab.entity.User;
import pl.coderslab.repository.CommentPubRepository;
import pl.coderslab.repository.PubRepository;


import javax.validation.Valid;
import java.util.List;
import java.util.Set;

@RequestMapping("/pub")
@Controller
public class PubController {

    @Autowired
    PubRepository pubRepository;

    @Autowired
    CommentPubRepository commentPubRepository;


    @RequestMapping(path = "/form", method = RequestMethod.GET)
    public String showForm(@RequestParam(required = false) Long id, Model model) {
        Pub pub = id == null ? new Pub() : pubRepository.findOne(id);
        model.addAttribute("pub", pub);
        return "pub/form";
    }

    @RequestMapping(path = "/form", method = RequestMethod.POST)
    public String saveForm(@Valid Pub pub, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "pub/form";
        }
        if (pub.getId() == null) {
            pubRepository.save(pub);
        } else {
            pubRepository.save(pub);
        }
        return "redirect:list";
    }

    @RequestMapping(path = "/list")
    public String listPubs() {
        return "pub/list";
    }

    @RequestMapping(path = "/confirmDelete")
    public String confirmDelete(@RequestParam Long id) {

        return "pub/confirmDelete";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam Long id) {
        pubRepository.delete(id);
        return "redirect:list";
    }

    @RequestMapping("/pubList")
    public String showAll(Model model) {
        List<Pub> pubs = pubRepository.findAll();
        model.addAttribute("pubs", pubs);
        return "pub/pubList";
    }

    @RequestMapping("/details")
    public String getDetails(@RequestParam Long id, Model model, @AuthenticationPrincipal CurrentUser customUser) {
        Pub pub = pubRepository.findOne(id);
        model.addAttribute("pub", pub);
        List<CommentPub> commentPub = commentPubRepository.findCommentPubByPubId(id);
        model.addAttribute("commentPub", commentPub);
        User user = customUser.getUser();
        model.addAttribute("user", user);
        return "pub/details";

    }

    @RequestMapping("/search")
    public String search(@RequestParam String pubName, Model model) {
        Set<Pub> pubs = pubRepository.findAllbyName(pubName);
        model.addAttribute("pubs", pubs);
        return "pub/pubList";
    }


    @ModelAttribute("pubs")
    public List<Pub> getPubs() {
        return pubRepository.findAll();
    }

}
