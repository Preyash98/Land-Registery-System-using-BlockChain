<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="CategoryFrm.aspx.cs" Inherits="CategoryFrm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Category Information Table"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Category ID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCateId" runat="server" 
                    ValidationGroup="Cate"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="*Category ID" ControlToValidate="txtCateId" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="Cate"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Cate Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCateName" runat="server" 
                    ValidationGroup="Cate" AutoPostBack="True" 
                    ontextchanged="txtCateName_TextChanged" 
                    onkeypress = "return string_val(event);"></asp:TextBox>
                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="Already Exist"></asp:Label>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="*Category Name" ControlToValidate="txtCateName" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="Cate"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmitCate" runat="server" Text="Submit" 
                    ValidationGroup="Cate" onclick="btnSubmitCate_Click1" 
                    style="height: 26px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblErrCate" runat="server" Text="Label"></asp:Label>
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
            CellSpacing="2" DataKeyNames="CateId" DataSourceID="SqlDataSource1" 
            ForeColor="Black">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="CateId" HeaderText="CateId" ReadOnly="True" 
                    SortExpression="CateId" />
                <asp:BoundField DataField="CateName" HeaderText="CateName" 
                    SortExpression="CateName" />
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:umbid %>" 
            DeleteCommand="DELETE FROM [CategoryMaster] WHERE [CateId] = @CateId" 
            InsertCommand="INSERT INTO [CategoryMaster] ([CateId], [CateName]) VALUES (@CateId, @CateName)" 
            SelectCommand="SELECT * FROM [CategoryMaster]" 
            UpdateCommand="UPDATE [CategoryMaster] SET [CateName] = @CateName WHERE [CateId] = @CateId">
            <DeleteParameters>
                <asp:Parameter Name="CateId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CateId" Type="Int32" />
                <asp:Parameter Name="CateName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CateName" Type="String" />
                <asp:Parameter Name="CateId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </td>
    </tr>
    </table>
</asp:Content>

