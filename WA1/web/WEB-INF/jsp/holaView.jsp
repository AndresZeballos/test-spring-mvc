<%-- 
    Document   : holaView
    Created on : 16/09/2012, 11:46:38 PM
    Author     : Andres
--%>

<script type="text/javascript">
    function preguntar(){
        $.ajax({
            url: "newjsp.htm",
            data: {
                persona: $("#codigo").val()
            },
            success: function(data){
                var json = eval('(' + data + ')');
                $("#salida").html(
                "<table border='1' cellspacing='3' cellpadding='3' width='800'><tr>"+
                    "<th scope='col'>Codigo</th>"+
                    "<th scope='col'>Categoria</th>"+
                    "<th scope='col'>Descripcion</th>"+
                    "</tr><tr>" +
                    "<td id='cod'>"+json.codigo+"</td>"+
                    "<td id='cat'>"+json.categoria+"</td>"+
                    "<td id='des'>"+json.descripcion+"</td>"+
                    "<td id='edit' width='1'><input type='button' value='Editar' onClick='editar()'></td>"+
                    "</tr></table>");
            }
        });
    }
    
    
    function actualizar(){
        fila = {
            "codigo": document.getElementById('cod_edicion').value,
            "categoria": document.getElementById('cat_edicion').value,
            "descripcion": document.getElementById('des_edicion').value
        }
        document.getElementById('cod').innerHTML = fila.codigo;
        document.getElementById('cat').innerHTML = fila.categoria;
        document.getElementById('des').innerHTML = fila.descripcion;
        document.getElementById('edit').innerHTML = "<input type='button' value='Editar' onClick='editar()'>";
        $.ajax({
            url: "descripcionView.htm",
            data: fila,
            success: function(data){
                data = eval('(' + data + ')');
                if(data.ok == 'OK'){
                    $("#ok").html("Actualización completa");
                }
            }
        });
    }
    
    function editar(){
        fila = {
            "codigo": document.getElementById('cod').innerHTML,
            "categoria": document.getElementById('cat').innerHTML,
            "descripcion": document.getElementById('des').innerHTML
        }
        document.getElementById('cod').innerHTML = "<textarea id='cod_edicion' rows='1' cols='25'>"+fila.codigo+"</textarea>";
        document.getElementById('cat').innerHTML = "<textarea id='cat_edicion' rows='1' cols='25'>"+fila.categoria+"</textarea>";
        document.getElementById('des').innerHTML = "<textarea id='des_edicion' rows='1' cols='25'>"+fila.descripcion+"</textarea>";
        document.getElementById('edit').innerHTML = "<input type='button' value='Actualizar' onClick='actualizar()'>";
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
        <style>
            textarea {
                resize: none;
            }
        </style>
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
        <div id="salida"></div>
        <div id="ok"></div>
    </body>
</html>
