package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Beer;
import pl.coderslab.entity.CommentBeer;
import pl.coderslab.entity.CurrentUser;
import pl.coderslab.entity.User;
import pl.coderslab.repository.BeerRepository;
import pl.coderslab.repository.CommentBeerRepository;
import pl.coderslab.repository.PubRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/beerComment")
public class CommentBeerController {

    @Autowired
    CommentBeerRepository commentBeerRepository;

    @Autowired
    PubRepository pubRepository;

    @Autowired
    BeerRepository beerRepository;



    @RequestMapping(path = "/form", method = RequestMethod.GET)
    public String showForm(@RequestParam(required = false) Long id, Model model) {
        CommentBeer commentBeer = id == null ? new CommentBeer() : commentBeerRepository.findOne(id);
        model.addAttribute("commentBeer", commentBeer);
        return "commentBeer/form";
    }

    @RequestMapping(path = "/form", method = RequestMethod.POST)
    public String saveForm(@RequestParam Long idbeer, @Valid CommentBeer commentBeer, BindingResult bindingResult,
                           @AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        commentBeer.setUser(entityUser);
        Beer beer = beerRepository.findOne(idbeer);
        commentBeer.setBeer(beer);
        if (bindingResult.hasErrors()) {
            return "commentBeer/form";
        }

        if (commentBeer.getId() == null) {
            commentBeerRepository.save(commentBeer);
        } else {
            commentBeerRepository.save(commentBeer);
        }
        return "redirect:/beer/details?id=" + beer.getId();

    }


    @RequestMapping(path = "/list")
    public String listPubs() {

        return "commentBeer/list";
    }

    @RequestMapping(path = "/confirmDelete")
    public String confirmDelete(@RequestParam Long id) {

        return "commentBeer/confirmDelete";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam Long id) {
        commentBeerRepository.delete(id);
        return "redirect:list";
    }

    @ModelAttribute("beercomments")
    public List<CommentBeer> getBeerComments() {
        return commentBeerRepository.findAll();
    }


}
