<%@ page language="java" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import = "java.sql.DriverManager" %>
    <%@ page import = "java.sql.Connection" %>
    <%@ page import = "java.sql.PreparedStatement" %>
    <%@ page import = "java.sql.ResultSet" %>
    <%@ page import = "java.lang.String" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Info</title>
</head>
<body>
<% String dbUrl = "jdbc:mysql://localhost:3306/OnlineBanking";
String username = "root";
String password = "";
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
}
catch (Exception e)
{

e.printStackTrace();
}
%>
<table align="center" border = "1" bgcolor = "">
<tr>
<td>Credit</td>
<td>Debit</td>
<td>Transaction id</td>
<td>Balance</td>
</tr>
<%
try
{
Connection con = DriverManager.getConnection(dbUrl,username,password);
PreparedStatement p = con.prepareStatement("select credit,debit,transid,balance from bankdata order by transid desc limit 5");
ResultSet rs = p.executeQuery();
PreparedStatement p1 = con.prepareStatement("select balance from bankdata order by transid desc limit 1");
ResultSet res = p1.executeQuery();
while(rs.next()){
%>
<tr>

<td> <%=rs.getString("credit") %> </td>
<td> <%=rs.getString("debit") %> </td>
<td> <%=rs.getString("transid") %></td>
<td> <%=rs.getString("balance") %></td>
</tr>

<% 
}
rs.close();
if(res.next()){
%>
<h3 align = "center">Balance: <%= res.getInt("balance") %></h3>
<%
}
Integer bal = (Integer)res.getInt("balance");
res.close();
con.close();
HttpSession session = request.getSession();
session.setAttribute("balance", bal);
}
catch (Exception e)
{

e.printStackTrace();
}
%>
</table><br><br>
<div style="text-align:center">
<form action = "debitdata.jsp" method = "get">
<button type="submit">Debit</button>
</form>
</div>
</body>
</html>