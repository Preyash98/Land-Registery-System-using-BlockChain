<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="CityFrm.aspx.cs" Inherits="CityFrm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="City Information Table"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="City ID"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtCityId" runat="server" 
                    ValidationGroup="City"></asp:TextBox>
            </td>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="*City ID" ControlToValidate="txtCityId" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="City"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="City Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCityName" runat="server" 
                    ValidationGroup="City" AutoPostBack="True" 
                    ontextchanged="txtCityName_TextChanged" 
                    onkeypress = "return string_val(event);"></asp:TextBox>
                <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="Already Exist"></asp:Label>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="*City Name" ControlToValidate="txtCityName" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="City"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="State ID"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlStateId" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="StateName" DataValueField="StateId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:umbid %>" 
                    SelectCommand="SELECT [StateId], [StateName] FROM [StateMaster]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmitCity" runat="server" Text="Submit" 
                    ValidationGroup="City" onclick="btnSubmitCity_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblErrCity" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table >
    <tr >
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
            CellSpacing="2" DataKeyNames="CityId" DataSourceID="SqlDataSource2" 
            ForeColor="Black">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="CityId" HeaderText="CityId" ReadOnly="True" 
                    SortExpression="CityId" />
                <asp:BoundField DataField="CityName" HeaderText="CityName" 
                    SortExpression="CityName" />
                <asp:BoundField DataField="StateId" HeaderText="StateId" 
                    SortExpression="StateId" />
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
            DeleteCommand="DELETE FROM [CityMaster] WHERE [CityId] = @CityId" 
            InsertCommand="INSERT INTO [CityMaster] ([CityId], [CityName], [StateId]) VALUES (@CityId, @CityName, @StateId)" 
            SelectCommand="SELECT * FROM [CityMaster]" 
            UpdateCommand="UPDATE [CityMaster] SET [CityName] = @CityName, [StateId] = @StateId WHERE [CityId] = @CityId">
            <DeleteParameters>
                <asp:Parameter Name="CityId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CityId" Type="Int32" />
                <asp:Parameter Name="CityName" Type="String" />
                <asp:Parameter Name="StateId" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CityName" Type="String" />
                <asp:Parameter Name="StateId" Type="Int32" />
                <asp:Parameter Name="CityId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <td>
    </td>
    </tr>
    </table>
</asp:Content>

