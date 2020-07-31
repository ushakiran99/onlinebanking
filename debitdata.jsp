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
<title>Success</title>
</head>
<body>
<% String dbUrl = "jdbc:mysql://localhost:3306/OnlineBanking";
String username = "root";
String password = "";
HttpSession session = request.getSession();
int bal = (int)session.getAttribute("balance");
try
{
if(bal>0)
bal = bal-1000;
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(dbUrl,username,password);
PreparedStatement p = con.prepareStatement("insert into bankdata(debit,credit,balance) values(?,?,?)");
p.setInt(1, 1000);
p.setInt(2,0);
p.setInt(3,bal);
p.executeUpdate();
con.close();
}

catch (Exception e)
{

e.printStackTrace();
}
finally
{
response.sendRedirect("Account.jsp");
}

%>
<table align="center" border = "1" bgcolor = "">
<tr>
<td><%= session.getAttribute("balance") %></td>
</tr>
</table>
</body>
</html>