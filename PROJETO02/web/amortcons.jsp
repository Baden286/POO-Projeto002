<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
               <% double a;%>
               <% double juros;%>
               <% double tota;%>
               <% double totj;%>
               <% double tot;%>
        <%-- Include do header jspf --%> 
        <%@include file="jspf/header.jspf" %>
    </head>
    <body>
        <%-- Include do menu jspf --%> 
        <%@include file="jspf/Menu.jspf" %>
        
        <div align="center">
            <h1>Amortização Constante</h1><br>
        <div class="panel panel-default">
       
        <form>
        <h3>Capital</h3>
        <input type="text" name="s"/>
        <h3>Taxa(em %)</h3>       
        <input type="text" name="t"/>        
        <h3>Período(em meses)</h3>        
        <input type="text" name="qtd"/><br><br>
                        <input class="btn btn primary" type="submit" value="Enviar" />
                        <input class="btn btn primary" type="submit" value="Cancelar" />
        </form><hr/>
            
        <% try{
            double s = Double.parseDouble(request.getParameter("s"));
            double t = Double.parseDouble(request.getParameter("t"));
            double qtd = Integer.parseInt(request.getParameter("qtd"));
            
            DecimalFormat df = new DecimalFormat("0,00");
            
            a=s/qtd;
            tota= a *qtd;
            totj=0;
            juros=(t*s)/100;
            %>            
        <div class="container">
            <table class="table table-bordered">
            <tr><th colspan="1">Periodo</th><th>Saldo</th><th>Amortização</th><th>Juros</th><th>Prestação</th></tr>
        <% for(int i=1; i <= qtd; i++){ %>
        <%totj=totj+juros;%>
        
        <%s=s-a; %>

        <tr><td><%=+i%></td><td><%=df.format(s) %></td><td><%=df.format(a)%></td><td><%=df.format(juros)%></td><td><%=df.format(a+juros)%> </td></tr>
            <%
         juros=(t*s)/100;
            }            
            %> 
            <div>
            <%tot = tota + totj; %>
            <%="A Armotização da Prestação é :" + tot%>
            </div>
            
        <%}catch(Exception ex){%>
        <b>Informe todos os dados acima corretamente</b><br>
        <%}%>
        

        
        </table>
        
        <br>
        </div>
        <%-- Include do rodapé --%>
        <%@include file="jspf/footer.jspf" %>
    </body>
</html>
