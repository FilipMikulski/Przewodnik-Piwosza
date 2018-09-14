package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.TypeOfBeer;
import pl.coderslab.repository.TypeOfBeerRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/types")
public class TypeOfBeerController {

    @Autowired
    TypeOfBeerRepository typeOfBeerRepository;

    @RequestMapping(path = "/form", method = RequestMethod.GET)
    public String showForm(@RequestParam(required = false) Long id, Model model) {
        TypeOfBeer typeOfBeer = id == null ? new TypeOfBeer () : typeOfBeerRepository.findOne(id);
        model.addAttribute("typeOfBeer", typeOfBeer);
        return "types/form";
    }

    @RequestMapping(path = "/form", method = RequestMethod.POST)
    public String saveForm(@Valid TypeOfBeer typeOfBeer, BindingResult bindingResult) {

        if(bindingResult.hasErrors()){
            return "types/form";
        }
        if (typeOfBeer.getId() == null) {
            typeOfBeerRepository.save(typeOfBeer);
        } else {
            typeOfBeerRepository.save(typeOfBeer);
        }
        return "redirect:list";
    }

    @RequestMapping(path = "/list")
    public String listPubs() {
        return "types/list";
    }

    @RequestMapping(path = "/confirmDelete")
    public String confirmDelete(@RequestParam Long id) {

        return "types/confirmDelete";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam Long id)  {
        typeOfBeerRepository.delete(id);
        return "redirect:list";
    }

    @ModelAttribute("types")
    public List<TypeOfBeer> getTypes() {
        return typeOfBeerRepository.findAll();
    }

}
