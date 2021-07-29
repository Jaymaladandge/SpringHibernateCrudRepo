package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.PersonService;
import com.model.Person;

@Controller
public class PersonController {

	private PersonService personService;

	@Autowired(required = true)
	@Qualifier(value = "personService")
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	@RequestMapping("/")
	public String show(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("personList", this.personService.listPersons());
		return "person";
	}

	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String listPersons(Model model) {
		System.out.println("listPersons()....");
		model.addAttribute("person", new Person());
		model.addAttribute("personList", this.personService.listPersons());
		return "person";
	}

	// For add and update person both
	@RequestMapping(value = "person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person person) {
		System.out.println("----------------------------------");
		if (person.getId() == 0) {
			// new person, add it
			this.personService.addPerson(person);
		} else {
			// existing person, call update
			this.personService.updatePerson(person);
			System.out.println("updated...!!");
		}
		return "redirect:/persons";
	}

	@RequestMapping("remove/{id}")
	public String removePerson(@PathVariable("id") int id) {
		this.personService.removePerson(id);
		return "redirect:/persons";
	}

	@RequestMapping(value = "edit/{id}")
	public String editPerson(@PathVariable("id") int id, Model model) {
		System.out.println("editPerson()");
		model.addAttribute("person", this.personService.getPersonById(id));
		model.addAttribute("personList", this.personService.listPersons());
		return "person";
	}	

}
