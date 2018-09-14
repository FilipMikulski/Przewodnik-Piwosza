package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.coderslab.entity.*;
import pl.coderslab.repository.BeerRepository;
import pl.coderslab.repository.CommentBeerRepository;
import pl.coderslab.repository.PubRepository;
import pl.coderslab.repository.TypeOfBeerRepository;
import pl.coderslab.storage.StorageService;

import javax.validation.Valid;
import java.util.List;
import java.util.Set;

@RequestMapping("/beer")
@Controller
public class BeerController {

    @Autowired
    BeerRepository beerRepository;

    @Autowired
    TypeOfBeerRepository typeOfBeerRepository;

    @Autowired
    PubRepository pubRepository;

    @Autowired
    CommentBeerRepository commentBeerRepository;

    @Autowired
    StorageService storageService;


    @RequestMapping("/search")
    public String search(@RequestParam String beerName, Model model) {
        Set<Pub> pubs = beerRepository.findAllByName(beerName);
        model.addAttribute("pubs", pubs);
        return "pub/pubList";
    }


    @RequestMapping(path = "/form", method = RequestMethod.GET)
    public String showForm(@RequestParam(required = false) Long id, Model model) {
        Beer beer = id == null ? new Beer() : beerRepository.findOne(id);
        model.addAttribute("beer", beer);
        return "beer/form";
    }

    @RequestMapping(path = "/form", method = RequestMethod.POST)
    public String saveForm(@Valid Beer beer, BindingResult bindingResult, @RequestParam("file") MultipartFile file) {

        if (bindingResult.hasErrors()) {
            return "beer/form";
        }
        if (!file.isEmpty()) {

            storageService.store(file);
            String imgCoverFileName = StringUtils.cleanPath(file.getOriginalFilename());
            beer.setImage(imgCoverFileName);

        } else {

            Beer productFromDataBase = beerRepository.findOne(beer.getId());
            if (productFromDataBase != null) {
                beer.setImage(productFromDataBase.getImage());
            }
        }
        if (beer.getId() == null) {
            beerRepository.save(beer);
        } else {
            beerRepository.save(beer);
        }
        return "redirect:list";
    }

    @RequestMapping(path = "/list")
    public String listBeers() {
        return "beer/list";
    }

    @RequestMapping(path = "/confirmDelete")
    public String confirmDelete(@RequestParam Long id) {

        return "beer/confirmDelete";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam Long id) {
        beerRepository.delete(id);
        return "redirect:list";
    }

    @RequestMapping("/beerList")
    public String showAll(Model model) {
        List<Beer> beers = beerRepository.findAll();
        model.addAttribute("beers", beers);
        return "beer/beerList";
    }

    @RequestMapping("/details")
    public String getDescription(@RequestParam Long id, Model model, @AuthenticationPrincipal CurrentUser customUser) {
        Beer beer = beerRepository.findOne(id);
        model.addAttribute("beer", beer);
        List<CommentBeer> commentBeer = commentBeerRepository.findCommentBeerByBeerId(id);
        model.addAttribute("commentBeer", commentBeer);
        User user = customUser.getUser();
        model.addAttribute("user", user);

        return "beer/details";
    }

    @ModelAttribute("beers")
    public List<Beer> getBeers() {
        return beerRepository.findAll();
    }

    @ModelAttribute("types")
    public List<TypeOfBeer> getTypes() {
        return typeOfBeerRepository.findAll();
    }

    @ModelAttribute("pubs")
    public List<Pub> getPubs() {
        return pubRepository.findAll();
    }

}
