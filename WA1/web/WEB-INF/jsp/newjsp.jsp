<%-- 
    Document   : newjsp
    Created on : 17/09/2012, 17:36:47
    Author     : Andres
--%>

<%
	// Obtener el parametro con el nombre de la persona
	String persona = request.getParameter("persona");

	// Devolver el lugar de residencia de la persona
	if( persona.equalsIgnoreCase("Jesus Hernandez") )
	{
		out.print("GUADALAJARA");
	}
	else
	if( persona.equalsIgnoreCase("Fulano de tal") )
	{
		out.print("PINTO");
	}
	else
	if( persona.equalsIgnoreCase("Fulano de cual") )
	{
		out.print("VALDEMORO");
	}
	else
	{
		out.print("PERSONA DESCONOCIDA");
	}
%>