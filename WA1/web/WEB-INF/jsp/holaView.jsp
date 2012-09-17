<%-- 
    Document   : holaView
    Created on : 16/09/2012, 11:46:38 PM
    Author     : Andres
--%>





<script>
    var ajax;

    function funcionCallback()
    {
        document.all.salida.innerHTML = "<b>PEPE</b>";	
        if( ajax.readyState == 4 )
        {
            if( ajax.status == 200 )
            {
                // Escribimos el resultado en la pagina HTML mediante DHTML
                document.all.salida.innerHTML = "<b>"+ajax.responseText+"</b>";	
            }
        }
    }

    function recuperaResidencia()
    {
        // Creamos el control XMLHttpRequest segun el navegador en el que estemos 
        if( window.XMLHttpRequest )
            ajax = new XMLHttpRequest(); // No Internet Explorer
        else
            ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer

        // Almacenamos en el control al funcion que se invocara cuando la peticion
        // cambie de estado	
        ajax.onreadystatechange = funcionCallback;

        // Enviamos la peticion
        ajax.open( "GET", "\\WEB-INF\\jspnewjsp.jsp?persona="+document.all.codigo.value, true );
        ajax.send( "" );
    }
</script>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="controller.Descripciones"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="controller.UtilAndres"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HolaView</title>
    </head>
    <body onload="">
        <h1>Hola!</h1>
        <spring:nestedPath path="descripcion">
            <form action="" method="post">
                Código:

                <%--
                <spring:bind path="codigo">
                    <input type="text" name="${status.expression}" value="${status.value}">
                </spring:bind> 
                --%>

                <select id="codigo" size="1" name="codigo">
                    <%
                        SessionFactory sf = UtilAndres.getSessionFactory();
                        Session s = sf.getCurrentSession();
                        s.beginTransaction();
                        Descripciones e = null;
                        List<Descripciones> desc = new ArrayList<Descripciones>();
                        try {
                            //e = (Descripciones) s..get(Descripciones.class);
                            desc = s.getNamedQuery("Descripciones.findAll").list();
                        } catch (HibernateException he) {
                        }
                        for (Descripciones d : desc) {
                    %>
                    <option value="<%out.print(d.getCodigo());%>"><% out.print(d.getCodigo());%></option>
                    <%                            }
                    %>  
                </select>
                <input type="button" value="OK" onclick="recuperaResidencia()">
            </form>
        </spring:nestedPath>
        <span id="salida"></span>
    </body>
</html>
