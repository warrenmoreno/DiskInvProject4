<%-- *************************** ASP Flower Box ******************************** --%>
<%-- Date	        Name	   Description                                       --%>
<%-- 04/26/2020     Warren     Inital implementation of Artists entry            --%>
<%-- 05/01/2020     Warren     Added ListView to add, upd, & del Artist.         --%>
<%--                                                                             --%>
<%-- *************************************************************************** --%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Artists.aspx.cs" Inherits="DiskInvBk03Project02.Artists" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <br />
    <p style="color:red; font-style:italic; font-size:large;" >Artists<br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ArtistID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                </td>
                <td>
                    <asp:Label ID="FirNameLabel" runat="server" Text='<%# Eval("FirName") %>' />
                </td>
                <td>
                    <asp:Label ID="LasNameLabel" runat="server" Text='<%# Eval("LasName") %>' />
                </td>
                <td>
                    <asp:Label ID="Artist_Type_IDLabel" runat="server" Text='<%# Eval("Artist_Type_ID") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #333333;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Edit" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="ArtistIDLabel1" runat="server" Text='<%# Eval("ArtistID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="FirNameTextBox" runat="server" Text='<%# Bind("FirName") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FirNameTextBox" ErrorMessage="</br> Required" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="LasNameTextBox" runat="server" Text='<%# Bind("LasName") %>' />
                    
                </td>
                <td>
                    <asp:TextBox ID="Artist_Type_IDTextBox" runat="server" Text='<%# Bind("Artist_Type_ID") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Artist_Type_IDTextBox" ErrorMessage="</br> Required" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="FirNameTextBox" runat="server" Text='<%# Bind("FirName") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirNameTextBox" ErrorMessage="</br> Required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="LasNameTextBox" runat="server" Text='<%# Bind("LasName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Artist_Type_IDTextBox" runat="server" Text='<%# Bind("Artist_Type_ID") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Artist_Type_IDTextBox" ErrorMessage="</br> Required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                </td>
                <td>
                    <asp:Label ID="FirNameLabel" runat="server" Text='<%# Eval("FirName") %>' />
                </td>
                <td>
                    <asp:Label ID="LasNameLabel" runat="server" Text='<%# Eval("LasName") %>' />
                </td>
                <td>
                    <asp:Label ID="Artist_Type_IDLabel" runat="server" Text='<%# Eval("Artist_Type_ID") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">ArtistID</th>
                                <th runat="server">FirName</th>
                                <th runat="server">LasName</th>
                                <th runat="server">Artist_Type_ID</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #008A8C; font-weight: bold;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                </td>
                <td>
                    <asp:Label ID="FirNameLabel" runat="server" Text='<%# Eval("FirName") %>' />
                </td>
                <td>
                    <asp:Label ID="LasNameLabel" runat="server" Text='<%# Eval("LasName") %>' />
                </td>
                <td>
                    <asp:Label ID="Artist_Type_IDLabel" runat="server" Text='<%# Eval("Artist_Type_ID") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryWMConnectionString %>" 
        DeleteCommand="sp_del_Artist" 
        DeleteCommandType="StoredProcedure" 
        InsertCommand="sp_ins_Artist" InsertCommandType="StoredProcedure" 
        SelectCommand="SELECT TOP (1000) [ArtistID]
              ,[FirName]
              ,[LasName]
              ,[Artist_Type_ID]
        FROM [Artist]
        ORDER BY  LasName, FirName" UpdateCommand="sp_upd_Artist" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="ArtistID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirName" Type="String" />
            <asp:Parameter Name="LasName" Type="String" />
            <asp:Parameter Name="Artist_Type_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ArtistID" Type="Int32" />
            <asp:Parameter Name="FirName" Type="String" />
            <asp:Parameter Name="LasName" Type="String" />
            <asp:Parameter Name="Artist_Type_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </p>
</asp:Content>
