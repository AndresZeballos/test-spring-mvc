<%-- 
    Document   : descripcionView
    Created on : 16/09/2012, 11:46:55 PM
    Author     : Andres
--%>

<%@page import="controller.UtilAndres"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="controller.Descripciones"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="controller.UtilAndres"%>

<%

    String codigo = request.getParameter("codigo");
    String categoria = request.getParameter("categoria");
    String descripcion = request.getParameter("descripcion");


    System.out.println(codigo + ";" + categoria + ";" + descripcion);
    SessionFactory sf = UtilAndres.getSessionFactory();
    Session s = sf.getCurrentSession();
    s.beginTransaction();
    Descripciones e = null;
    try {
        e = (Descripciones) s.get(Descripciones.class, codigo);
        System.out.println(e.getCodigo() + ";" + e.getCategoria() + ";" + e.getDescripcion());
        e.setCategoria(categoria);
        e.setDescripcion(descripcion);
        s.update(e);
        s.flush();
        s.getTransaction().commit();
        
%>
{
    "ok": "OK"
}
<%
    } catch (HibernateException he) {
    }

%>
