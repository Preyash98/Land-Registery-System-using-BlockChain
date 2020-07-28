<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="SubCatagoryFrm.aspx.cs" Inherits="SubCatagoryFrm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Sub Category Information Table"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Sub Category ID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSCateId" runat="server" 
                    ValidationGroup="SubCate"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="*Sub Category" ControlToValidate="txtSCateId" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="SubCate"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Sub Category Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSCateName" runat="server" 
                    ValidationGroup="SubCate" AutoPostBack="True" 
                    ontextchanged="txtSCateName_TextChanged" 
                    onkeypress = "return string_val(event);"></asp:TextBox>
                <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="Already Exist"></asp:Label>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="*Sub Category Name" ControlToValidate="txtSCateName" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="SubCate"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Category Name"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCateId" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="CateName" DataValueField="CateId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:umbid %>" 
                    SelectCommand="SELECT [CateId], [CateName] FROM [CategoryMaster]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmicSCate" runat="server" Text="Submit" 
                    ValidationGroup="SubCate" onclick="btnSubmicSCate_Click1" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblErrSCate" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <table>
    <tr>
    <td>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
            CellSpacing="2" DataKeyNames="SCateId" DataSourceID="SqlDataSource2" 
            ForeColor="Black">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="SCateId" HeaderText="SCateId" ReadOnly="True" 
                    SortExpression="SCateId" />
                <asp:BoundField DataField="SCateName" HeaderText="SCateName" 
                    SortExpression="SCateName" />
                <asp:BoundField DataField="CateId" HeaderText="CateId" 
                    SortExpression="CateId" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:umbid %>" 
            DeleteCommand="DELETE FROM [SubCategoryMaster] WHERE [SCateId] = @SCateId" 
            InsertCommand="INSERT INTO [SubCategoryMaster] ([SCateId], [SCateName], [CateId]) VALUES (@SCateId, @SCateName, @CateId)" 
            SelectCommand="SELECT * FROM [SubCategoryMaster]" 
            UpdateCommand="UPDATE [SubCategoryMaster] SET [SCateName] = @SCateName, [CateId] = @CateId WHERE [SCateId] = @SCateId">
            <DeleteParameters>
                <asp:Parameter Name="SCateId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SCateId" Type="Int32" />
                <asp:Parameter Name="SCateName" Type="String" />
                <asp:Parameter Name="CateId" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SCateName" Type="String" />
                <asp:Parameter Name="CateId" Type="Int32" />
                <asp:Parameter Name="SCateId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </td>
    </tr>
    </table>

   
</asp:Content>

