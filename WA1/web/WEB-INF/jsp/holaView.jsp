<%-- 
    Document   : holaView
    Created on : 16/09/2012, 11:46:38 PM
    Author     : Andres
--%>

<script>
    function preguntar(){
        $.ajax({
            url: "newjsp.htm",
            data: {
                persona: $("#codigo").val()
            },
            success: function(data){
                $("#salida").html(data);
            }
        });
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
        <script type="text/javascript" src="/WA1/scripts/jquery-1.8.1.js"></script>
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
                <input type="button" value="OK" onclick="preguntar()">
            </form>


        </spring:nestedPath>
        <span id="salida"></span>
    </body>
</html>
