<%-- *************************************************************************** --%>
<%-- Date	        Name	   Description                                       --%>
<%-- --------------------------------------------------------------------------- --%>
<%-- 04/26/2020     Warren     Inital implementation of Disks entry.             --%>
<%-- 05/01/2020     Warren     Added ListView to add, upd, & del Disks.          --%>
<%--                                                                             --%>
<%-- *************************************************************************** --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="Disks.aspx.cs" Inherits="DiskInvBk03Project02.Disks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p style="color:red; font-style:italic; font-size:large;" >
        <br/>    
        Disks
    </p>
<p>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="DiskID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="DiskIDLabel" runat="server" Text='<%# Eval("DiskID") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskNameLabel" runat="server" Text='<%# Eval("DiskName") %>' />
                </td>
                <td>
                    <asp:Label ID="ReleaseDateLabel" runat="server" Text='<%# Eval("ReleaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreIDLabel" runat="server" Text='<%# Eval("GenreID") %>' />
                </td>
                <td>
                    <asp:Label ID="StatusIDLabel" runat="server" Text='<%# Eval("StatusID") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskTypeIDLabel" runat="server" Text='<%# Eval("DiskTypeID") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #333333;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Edit" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="DiskIDLabel1" runat="server" Text='<%# Eval("DiskID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiskNameTextBox" runat="server" Text='<%# Bind("DiskName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DiskNameTextBox" ErrorMessage="</br> Required" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="ReleaseDateTextBox" runat="server" Text='<%# Bind("ReleaseDate") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ReleaseDateTextBox" ErrorMessage="</br> Required" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="GenreIDTextBox" runat="server" Text='<%# Bind("GenreID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="GenreIDTextBox" ErrorMessage="</br> Required" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="StatusIDTextBox" runat="server" Text='<%# Bind("StatusID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="StatusIDTextBox" ErrorMessage="</br> Required" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="DiskTypeIDTextBox" runat="server" Text='<%# Bind("DiskTypeID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DiskTypeIDTextBox" ErrorMessage="</br> Required" ValidationGroup="Edit"></asp:RequiredFieldValidator>
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
                    <asp:TextBox ID="DiskNameTextBox" runat="server" Text='<%# Bind("DiskName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="</br> Required" ControlToValidate="DiskNameTextBox" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="ReleaseDateTextBox" runat="server" Text='<%# Bind("ReleaseDate") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="</br> Required" ControlToValidate="ReleaseDateTextBox" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="GenreIDTextBox" runat="server" Text='<%# Bind("GenreID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="</br> Required" ControlToValidate="GenreIDTextBox" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="StatusIDTextBox" runat="server" Text='<%# Bind("StatusID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="</br> Required" ControlToValidate="StatusIDTextBox" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="DiskTypeIDTextBox" runat="server" Text='<%# Bind("DiskTypeID") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="</br> Required" ControlToValidate="DiskTypeIDTextBox" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="DiskIDLabel" runat="server" Text='<%# Eval("DiskID") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskNameLabel" runat="server" Text='<%# Eval("DiskName") %>' />
                </td>
                <td>
                    <asp:Label ID="ReleaseDateLabel" runat="server" Text='<%# Eval("ReleaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreIDLabel" runat="server" Text='<%# Eval("GenreID") %>' />
                </td>
                <td>
                    <asp:Label ID="StatusIDLabel" runat="server" Text='<%# Eval("StatusID") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskTypeIDLabel" runat="server" Text='<%# Eval("DiskTypeID") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">DiskID</th>
                                <th runat="server">DiskName</th>
                                <th runat="server">ReleaseDate</th>
                                <th runat="server">GenreID</th>
                                <th runat="server">StatusID</th>
                                <th runat="server">DiskTypeID</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
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
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="DiskIDLabel" runat="server" Text='<%# Eval("DiskID") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskNameLabel" runat="server" Text='<%# Eval("DiskName") %>' />
                </td>
                <td>
                    <asp:Label ID="ReleaseDateLabel" runat="server" Text='<%# Eval("ReleaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreIDLabel" runat="server" Text='<%# Eval("GenreID") %>' />
                </td>
                <td>
                    <asp:Label ID="StatusIDLabel" runat="server" Text='<%# Eval("StatusID") %>' />
                </td>
                <td>
                    <asp:Label ID="DiskTypeIDLabel" runat="server" Text='<%# Eval("DiskTypeID") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryWMConnectionString %>" 
        DeleteCommand="sp_del_Disk" 
        InsertCommand="sp_ins_Disk" 
        SelectCommand="SELECT [DiskID], [DiskName], [ReleaseDate], [GenreID], [StatusID], [DiskTypeID] FROM [Disk] ORDER BY [DiskName]" 
        UpdateCommand="sp_upd_Disk" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="DiskID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DiskName" Type="String" />
            <asp:Parameter Name="ReleaseDate" DbType="Date" />
            <asp:Parameter Name="GenreID" Type="Int32" />
            <asp:Parameter Name="StatusID" Type="Int32" />
            <asp:Parameter Name="DiskTypeID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DiskID" Type="Int32" />
            <asp:Parameter Name="DiskName" Type="String" />
            <asp:Parameter Name="ReleaseDate" DbType="Date" />
            <asp:Parameter Name="GenreID" Type="Int32" />
            <asp:Parameter Name="StatusID" Type="Int32" />
            <asp:Parameter Name="DiskTypeID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>

</asp:Content>
