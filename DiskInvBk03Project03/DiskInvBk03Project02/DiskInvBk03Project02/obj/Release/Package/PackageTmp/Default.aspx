<%-- *************************** ASP Flower Box ******************************** --%>
<%-- Date	        Name	   Description                                       --%>
<%-- 05/01/2020     Warren     Jumbotron Image added h1 font modified            --%>
<%--                                                                             --%>
<%-- *************************************************************************** --%>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DiskInvBk03Project02._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background-image: url(images/login_screen.png); background-size: cover;">
        <h1 style="color:red; font-style:italic;">
            Welcome to WM Disk Inventory.
        </h1>
        
    </div>
    
    <div class="row" >
        <div class="col-md-4">

        </div>
        <div class="col-md-4">

        </div>
        <div class="col-md-4">

        </div>
    </div>
</asp:Content>
