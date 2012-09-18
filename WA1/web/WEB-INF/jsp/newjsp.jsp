<%-- 
    Document   : newjsp
    Created on : 17/09/2012, 17:36:47
    Author     : Andres
--%>

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
    } catch (HibernateException he) {
    }
%>
    {
        "codigo": "<%=e.getCodigo()%>",
        "categoria": "<%=e.getCategoria()%>",
        "descripcion": "<%=e.getDescripcion()%>"
    }