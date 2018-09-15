<%-- 
    Document   : amortamer
    Created on : Sep 1, 2018, 12:14:21 PM
    Author     : EduardoSimao
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <center><%@include file="jspf/header.jspf" %></center> 

        <title>Amortização Americana</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
    </head>

    <body>
        <%-- Include do menu jspf --%> 
        <%@include file="jspf/Menu.jspf" %>
                <link rel="stylesheet" href="css/css.css">


        <div align="center">
            <h1>Amortização Americana</h1><br>
        <div class="panel panel-default">
        <div class="panel-body">
        </div>
        <form>
            <label>Capital</label><br> <input type="text" name="SalDev"/><br/>
            <label>Taxa (em %)</label> <br><input type="text" name="Taxa"/><br/>
            <label>Período (em meses)</label> <br><input type="text" name="Tempo"/><br/><br>
                        <input class="btn btn primary" type="submit" value="Enviar" />
                        <input class="btn btn primary" type="submit" value="Cancelar" />
        </form><br>
        
        <%try{%>
        <%
            double saldev = Double.parseDouble(request.getParameter("SalDev"));
            double taxa = Double.parseDouble(request.getParameter("Taxa"));
            double tempo = Integer.parseInt(request.getParameter("Tempo"));
            
            DecimalFormat df = new DecimalFormat("#,##0.00");

        %>
        <div class="container">
            <table class="table table-bordered">
            <tr><th colspan="1">Periodo (Meses)</th><th>Saldo (R$)</th><th>Amortização (R$)</th><th>Juros (R$)</th><th>Prestação (R$)</th></tr>
        <% double amort = 0; double juros = 0; double presta = 0;
        taxa = taxa/100;
        for(int ct = 0; ct <= tempo; ct++){
        if(ct == 1){juros = saldev * taxa; presta = juros; }
        if(ct == tempo){presta = presta + saldev; amort = saldev; saldev = 0; } %>
            <tr>   
                <th><%= ct %></th> <%-- Periodo --%>
                <td><%= df.format(saldev) %></td> <%-- Saldo --%>
                <td><%= df.format(amort) %></td> <%-- Amortização --%>
                <td><%= df.format(juros) %></td> <%-- Juros --%>
                <td><%= df.format(presta) %></td> <%-- Prestação --%>
            </tr>
            <%}
            juros = juros*tempo;
            double presttotal = amort+juros; %>
            <tr>
                <th>Total:</th> <%-- Total --%>
                <th> --- </th>
                <th><%= df.format(amort) %></th> <%-- Amortização Total --%>
                <th><%= df.format(juros) %></th> <%-- Juros Total --%>
                <th><%= df.format(presttotal) %></th> <%-- Prestação Total --%>
            </tr>
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