<%-- 
    Document   : newjsp
    Created on : 17/09/2012, 17:36:47
    Author     : Andres
--%>

<%@page import="java.util.List"%>
<%@page import="controller.UtilAndres"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="controller.Descripciones"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="controller.UtilAndres"%>

<%
    // Obtener el parametro con el nombre de la persona
    String persona = request.getParameter("persona");

    SessionFactory sf = UtilAndres.getSessionFactory();
    Session s = sf.getCurrentSession();
    s.beginTransaction();
    Descripciones e = null;
    try {
        e = (Descripciones) s.get(Descripciones.class, persona);
        s.flush();
        s.getTransaction().commit();
        s = sf.getCurrentSession();
        s.beginTransaction();
        List<Descripciones> foo = s.getNamedQuery("Descripciones.findAll").list();
        for(Descripciones bar : foo){
            System.out.println(bar.getCodigo() + ";" + bar.getCategoria() + ";" + bar.getDescripcion());
        }
        s.getTransaction().commit();
    } catch (HibernateException he) {
    }
%>
    {
        "codigo": "<%=e.getCodigo()%>",
        "categoria": "<%=e.getCategoria()%>",
        "descripcion": "<%=e.getDescripcion()%>"
    }