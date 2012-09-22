<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : 22/09/2012, 06:42:07 PM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="descripcionesQuery" dataSource="jdbc/myDatasource">
    SELECT * FROM descripciones
    WHERE codigo = ? <sql:param value="${param.codigo}"/>
</sql:query>

<c:set var="descripcionesDetails" value="${descripcionesQuery.rows[0]}"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>${descripcionesDetails.codigos}</title>
    </head>

    <body>
        <table>
            <tr>
                <th colspan="2">${descripcionesDetails.codigo}</th>
            </tr>
            <tr>
                <td><strong>Description: </strong></td>
                <td><span style="font-size:smaller; font-style:italic;">${descripcionesDetails.descripcion}</span></td>
            </tr>
            <tr>
                <td><strong>Counselor: </strong></td>
                <td><strong>${descripcionesDetails.marca}</strong>
                </td>
            </tr>
            <tr>
                <td><strong>Contact Details: </strong></td>
                <td>${descripcionesDetails.categoria}</td>
            </tr>
        </table>
    </body>
</html>
