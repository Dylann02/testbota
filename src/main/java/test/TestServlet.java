package test;

import java.util.ArrayList;
import java.util.List;
import model.Personne;
import src.annotation.ApiRest;
import src.annotation.Controller;
import src.annotation.UrlMapping;
import src.utils.MethodHttp;
import src.utils.ModelAndView;


@Controller
public class TestServlet{

    @UrlMapping(url = "/",methodHttp =MethodHttp.GET)
    public ModelAndView sauter(){
        ModelAndView m = new ModelAndView("test");
        List<String> fruits = new ArrayList<>();
        fruits.add("banane");
        fruits.add("pomme");
        fruits.add("papaye");

        m.addAtribute("listeFruits", fruits);
        return m;
    }


    @UrlMapping(url = "/test",methodHttp =MethodHttp.GET)
    @ApiRest
    public Personne test(){
        return new Personne("Dylan", 90);
    }

    @UrlMapping(url = "/listePersonne",methodHttp =MethodHttp.GET)
    @ApiRest
    public List<Personne> desc(){
        List<Personne> p = new ArrayList<>();
        p.add(new Personne("dylan", 19));
        p.add(new Personne("bold", 20));
        return p;
    }

    @UrlMapping(url = "/string",methodHttp =MethodHttp.GET)
    @ApiRest
    public String mety(){
        return "{test : mety}";
    }
}