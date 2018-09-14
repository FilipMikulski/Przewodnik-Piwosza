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
import pl.coderslab.repository.BeerRepository;
import pl.coderslab.repository.CommentBeerRepository;
import pl.coderslab.repository.CommentPubRepository;
import pl.coderslab.repository.PubRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/pubComment")
public class CommentPubController {
    @Autowired
    CommentBeerRepository commentBeerRepository;

    @Autowired
    CommentPubRepository commentPubRepository;

    @Autowired
    PubRepository pubRepository;

    @Autowired
    BeerRepository beerRepository;


    @RequestMapping(path = "/form", method = RequestMethod.GET)
    public String showForm(@RequestParam(required = false) Long id, Model model) {
        CommentPub commentPub = id == null ? new CommentPub() : commentPubRepository.findOne(id);
        model.addAttribute("commentPub", commentPub);
        return "commentPub/form";
    }

    @RequestMapping(path = "/form", method = RequestMethod.POST)
    public String saveForm(@RequestParam Long idpub, @Valid CommentPub commentPub, BindingResult bindingResult, @AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        commentPub.setUser(entityUser);
        Pub pub = pubRepository.findOne(idpub);
        commentPub.setPub(pub);
        if (bindingResult.hasErrors()) {
            return "commentPub/form";
        }

        if (commentPub.getId() == null) {
            commentPubRepository.save(commentPub);
        } else {
            commentPubRepository.save(commentPub);
        }
        return "redirect:/pub/details?id=" + pub.getId();

    }


    @RequestMapping(path = "/list")
    public String listPubs() {

        return "commentPub/list";
    }

    @RequestMapping(path = "/confirmDelete")
    public String confirmDelete(@RequestParam Long id) {

        return "commentPub/confirmDelete";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam Long id) {
        commentPubRepository.delete(id);
        return "redirect:list";
    }

    @ModelAttribute("pubcomments")
    public List<CommentPub> getPubComments() {
        return commentPubRepository.findAll();
    }

}
