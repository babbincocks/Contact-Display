<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SQLDisplayGrid.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <asp:GridView ID="gvContacts" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ContactID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1" />
                        <asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="Address2" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <br />
                <table>
                    <tr>
                        <th>
                    <asp:TextBox runat="server" ID="txtName" Text="Name"></asp:TextBox>
                        </th>
                        </tr>
                    <tr>
                        <th>
                    <asp:TextBox runat="server" ID="txtAddress1" Text="Address 1"></asp:TextBox>
                        </th>
                        <th>
                    <asp:TextBox ID="txtAddress2" runat="server" Text="Address 2"></asp:TextBox>
                        </th>
                        <th>
                            <asp:TextBox ID="txtCity" runat="server" Text="City"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th><asp:TextBox ID="txtPhone" runat="server" Text="Phone" TextMode="Phone"></asp:TextBox></th>
                        <th><asp:TextBox ID="txtEmail" runat="server" Text="E-mail"></asp:TextBox></th>
                    </tr>
                </table>
                <asp:Button ID="btnInsert" runat="server" Text="Insert Data" OnClick="btnInsert_Click" />
                    

                &nbsp;
            </asp:Panel>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Desktop Door %>" DeleteCommand="DELETE FROM [ContactInfo] WHERE [ContactID] = @original_ContactID" InsertCommand="INSERT INTO [ContactInfo] ([Name], [Address1], [Address2], [City], [Phone], [Email]) VALUES (@Name, @Address1, @Address2, @City, @Phone, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ContactInfo]" UpdateCommand="UPDATE [ContactInfo] SET [Name] = @Name, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [Phone] = @Phone, [Email] = @Email WHERE [ContactID] = @original_ContactID">
            <DeleteParameters>
                <asp:Parameter Name="original_ContactID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address1" Type="String" />
                <asp:Parameter Name="Address2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address1" Type="String" />
                <asp:Parameter Name="Address2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="original_ContactID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
