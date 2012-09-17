/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import service.HelloService;

/**
 *
 * @author Andres
 */
public class HelloController extends SimpleFormController {

    private HelloService helloService;

    public void setHelloService(HelloService helloService) {
        this.helloService = helloService;
    }

    public HelloController() {
        setCommandClass(Name.class);
        setCommandName("name");
        setSuccessView("helloView");
        setFormView("nameView");
    }

    @Override
    protected ModelAndView onSubmit(
            HttpServletRequest request,
            HttpServletResponse response,
            Object command,
            BindException errors) throws Exception {

        Name name = (Name) command;
        ModelAndView mv = new ModelAndView(getSuccessView());

        SessionFactory sf = UtilAndres.getSessionFactory();
        Session s = sf.getCurrentSession();
        s.beginTransaction();
        Eventos e = null;
        try {
            //e = (Eventos) s.load(Eventos.class, Integer.parseInt(name.getValue()));
            e = (Eventos) s.get(Eventos.class, Integer.parseInt(name.getValue()));
        } catch (HibernateException he) {
        } catch (NumberFormatException nfe) {
            if (e == null) {
                e = new Eventos();
                e.setNombre(name.getValue());
                s.save(e);
                s.getTransaction().commit();
            }
            mv.addObject("helloMessage", HelloService.sayHello(
                    e.getNombre() + ", su identificador es: " + e.getId().toString()));
            return mv;
        }
        mv.addObject("helloMessage", HelloService.sayHello(e.getNombre()));

        s.getTransaction().commit();
        return mv;
    }
}
