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

/**
 *
 * @author Andres
 */
public class PepeController extends SimpleFormController {

    public PepeController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(Descripciones.class);
        setCommandName("descripcion");
        setSuccessView("descripcionView");
        setFormView("holaView");
    }

    @Override
    protected ModelAndView onSubmit(
            HttpServletRequest request,
            HttpServletResponse response,
            Object command,
            BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());

        Descripciones descripcion = (Descripciones) command;

        SessionFactory sf = UtilAndres.getSessionFactory();
        Session s = sf.getCurrentSession();
        s.beginTransaction();
        Descripciones e = null;
        try {
            e = (Descripciones) s.get(Descripciones.class, descripcion.getCodigo());
        } catch (HibernateException he) {
        }

        if (e == null) {
            e = new Descripciones();
            e.setCodigo(descripcion.getCodigo());
            e.setCategoria("");
            e.setMarca((Marcas) s.get(Marcas.class, ""));
            s.save(e);
            
        }

        String str = e.getCodigo() + ";" + e.getCategoria() + ";" + e.getMarca().getMarca() + ";" + e.getDescripcion();

        mv.addObject("descripcion", str);
        s.getTransaction().commit();
        return mv;
    }
}
