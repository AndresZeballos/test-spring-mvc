<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>

    <body>
        <sql:query var="result" dataSource="jdbc/myDatasource">
            SELECT * FROM descripciones
        </sql:query>
        <form action="response.htm">
            <strong>Codigo:</strong>
            <select name="codigo">
                <c:forEach var="row" items="${result.rows}">
                    <option value="${row.codigo}">${row.codigo}</option>
                </c:forEach>
            </select>
            <input type="submit" value="submit" name="submit" />
        </form>
    </body>
</html>
