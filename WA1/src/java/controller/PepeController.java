/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        //Do something...
        return mv;
    }
}
