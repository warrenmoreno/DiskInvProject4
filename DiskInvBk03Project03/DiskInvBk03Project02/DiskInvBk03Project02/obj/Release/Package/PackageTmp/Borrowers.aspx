<%-- *************************** ASP Flower Box ******************************** --%>
<%-- Date	        Name	   Description                                       --%>
<%-- 04/26/2020     Warren     Inital implementation of Borrowers entry          --%>
<%-- 05/01/2020     Warren     Added ListView to add, upd, & del Borrowers.      --%>
<%--                                                                             --%>
<%-- *************************************************************************** --%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="Borrowers.aspx.cs" Inherits="DiskInvBk03Project02.Borrowers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        </p>
    <p>
        Borrower</p>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="BorrowerID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="BorrowerIDLabel" runat="server" Text='<%# Eval("BorrowerID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirNameLabel" runat="server" Text='<%# Eval("FirName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LasNameLabel" runat="server" Text='<%# Eval("LasName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneNumLabel" runat="server" Text='<%# Eval("PhoneNum") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Edit" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="BorrowerIDLabel1" runat="server" Text='<%# Eval("BorrowerID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FirNameTextBox" runat="server" Text='<%# Bind("FirName") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="FirNameTextBox" ErrorMessage="</br> Required" 
                                    InitialValue="" Display="Dynamic" ValidationGroup="Edit">
                                </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="LasNameTextBox" runat="server" Text='<%# Bind("LasName") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="LasNameTextBox" 
                            ErrorMessage="</br> Required" Display="Dynamic"  ValidationGroup="Edit">
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="PhoneNumTextBox" runat="server" Text='<%# Bind("PhoneNum") %>' />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="PhoneNumTextBox" Display="Dynamic" ErrorMessage="</br> Use this format: XXX-XXX-XXXX." ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="Edit">
                                </asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="PhoneNumTextBox" Display="Dynamic" ErrorMessage= "</br> Please Enter a phone number." ValidationGroup="Edit"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="FirNameTextBox" ErrorMessage="</br> Required" 
                                        InitialValue="" Display="Dynamic" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="LasNameTextBox" runat="server" Text='<%# Bind("LasName") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="LasNameTextBox" 
                                ErrorMessage="</br> Required" Display="Dynamic"  ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="PhoneNumTextBox" runat="server" Text='<%# Bind("PhoneNum") %>' />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="PhoneNumTextBox" Display="Dynamic" ErrorMessage="</br> Use this format: XXX-XXX-XXXX." ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="Insert">
                                </asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="PhoneNumTextBox" Display="Dynamic" ErrorMessage="</br> Please Enter a phone number." ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="BorrowerIDLabel" runat="server" Text='<%# Eval("BorrowerID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirNameLabel" runat="server" Text='<%# Eval("FirName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LasNameLabel" runat="server" Text='<%# Eval("LasName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneNumLabel" runat="server" Text='<%# Eval("PhoneNum") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">BorrowerID</th>
                                    <th runat="server">FirName</th>
                                    <th runat="server">LasName</th>
                                    <th runat="server">PhoneNum</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333">
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
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="BorrowerIDLabel" runat="server" Text='<%# Eval("BorrowerID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirNameLabel" runat="server" Text='<%# Eval("FirName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LasNameLabel" runat="server" Text='<%# Eval("LasName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneNumLabel" runat="server" Text='<%# Eval("PhoneNum") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryWMConnectionString %>" 
            DeleteCommand="sp_del_Borrower" DeleteCommandType="StoredProcedure" 
            InsertCommand="sp_ins_Borrower" InsertCommandType="StoredProcedure" 
            SelectCommand="SELECT [BorrowerID], [FirName], [LasName], [PhoneNum] FROM [Borrower] ORDER BY [LasName], [FirName]" 
            UpdateCommand="sp_upd_Borrower" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="BorrowerID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirName" Type="String" />
                <asp:Parameter Name="LasName" Type="String" />
                <asp:Parameter Name="PhoneNum" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BorrowerID" Type="Int32" />
                <asp:Parameter Name="FirName" Type="String" />
                <asp:Parameter Name="LasName" Type="String" />
                <asp:Parameter Name="PhoneNum" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    </asp:Content>
