<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : descripciones
    Created on : 22/09/2012, 07:12:52 PM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:query var="results" dataSource="jdbc/myDatasource">
    SELECT * FROM descripciones
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Descripciones</title>
    </head>
    <body>
        <table border="1">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${results.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${results.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
