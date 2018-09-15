<%-- fork
    Document   : amortamer

    Created on : Sep 1, 2018, 12:14:21 PM
    Author     : Baden286
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%-- Include do header jspf --%> 
        <center><%@include file="jspf/header.jspf" %></center> 

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">

        <title>Tabela Price</title>
            <%
                double pmt = 0;
                double juros = 0;
                double val = 0;
             %>     
    </head>
    <body>
        <%-- Include do menu jspf --%> 
        <%@include file="jspf/Menu.jspf" %>
        <link rel="stylesheet" href="css/css.css">
        <div align="center">
        <h1>Tabela Price</h1><br>
        <div class="panel panel-default"><br>
        <form>
            <label>Capital</label><br>
        <input type="text" name="PV"/><br>
        <label>Taxa (em %)</label> <br>      
        <input type="text" name="i"/><br>        
        <label>Período (em meses)</label> <br>       
        <input type="text" name="n"/></br>
<br />
                   
                        <input class="btn btn primary" type="submit" value="Enviar" />
                        <input class="btn btn primary" type="submit" value="Cancelar" />
                        
        </form>
                <br>

            
            <% try{ %>
            <%   
                double PV = Double.parseDouble(request.getParameter("PV"));
                double i = Double.parseDouble(request.getParameter("i")) / 100 ;
                int n = Integer.parseInt(request.getParameter("n")); %>
            <div class="container">
            <table class="table table-bordered">
            <tr><th colspan="1">Periodo (Meses)</th><th>Saldo(R$)</th><th>Parcela(R$)</th><th>Juros(R$)</th><th>Prestação(R$)</th></tr>
           <%
                      val = PV;
                      pmt = PV /((1- Math.pow((1+i),-n))/i );
                      
                      for(int count =1; count <= n; count++){ 
                        juros = val * i ;
                        val = val -  ( pmt - juros);
                        
                      DecimalFormat df = new DecimalFormat("#,##0.00");
            %>
                
            
             <tr><th><%= count %></th><td><%=  df.format(val) %></td><td><%= df.format( pmt)  %></td><td><%=  df.format(juros) %></td><td><%=  df.format(pmt - juros) %></td></tr>
          <% }%> 
            <%-- </tbody> --%>

              </table>
        <%}catch(Exception ex){%>
        <b>Informe todos os dados acima corretamente</b><br>
        <%}%>
        <br>
        </div>
        <%-- Include do rodapé --%>
                <%@include file="jspf/footer.jspf" %>

    </body>
</html>
