<%-- *************************** ASP Flower Box ******************************** --%>
<%-- Date	        Name	   Description                                       --%>
<%-- 04/26/2020     Warren     Inital implementation of Borrowers entry          --%>
<%--                                                                             --%>
<%-- *************************************************************************** --%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="Borrowers.aspx.cs" Inherits="DiskInvBk03Project02.Borrowers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        Please Enter Borrower Information &amp; Click Submit</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="txtFirst" runat="server">First Name</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtFirst" ErrorMessage="Name is required." 
            InitialValue="First Name" Display="Dynamic">
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtFirst" ErrorMessage="Please enter a First Name." 
            InitialValue="" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="txtLast" runat="server">Last Name</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txtLast" Display="Dynamic" ErrorMessage="Name is required." 
            InitialValue="Last Name">
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            Display="Dynamic" ErrorMessage="Please enter a Last Name." ControlToValidate="txtLast">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="txtPhone" runat="server">999-999-9999</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Use this format: XXX-XXX-XXXX" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Phone number is required." InitialValue="999-999-9999"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Please Enter a phone number."></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </p>
    <p>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </p>
</asp:Content>
