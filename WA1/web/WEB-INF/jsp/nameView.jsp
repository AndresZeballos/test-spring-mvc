<%-- 
    Document   : nameView
    Created on : 14/09/2012, 16:58:24
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingrese su identificador o su nombre</title>
    </head>
    <body>
        <h1>Ingrese su identificador o su nombre</h1>
        <spring:nestedPath path="name">
            <form action="" method="post">
                Id o nombre:
                <spring:bind path="value">
                    <input type="text" name="${status.expression}" value="${status.value}">
                </spring:bind>
                <input type="submit" value="OK">
            </form>
        </spring:nestedPath>
    </body>
</html>
