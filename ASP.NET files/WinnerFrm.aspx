<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="WinnerFrm.aspx.cs" Inherits="Admin_WinnerFrm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        height: 21px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td class="style2">
            </td>
        <td class="style2">
            <asp:Label ID="Label2" runat="server" Text="Winner Information"></asp:Label>
        </td>
        <td class="style2">
            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label9" runat="server" Text="ItemName"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="ItemName" DataValueField="ItemId" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:umbid %>" 
                SelectCommand="SELECT [ItemId], [ItemName] FROM [ItemMaster] WHERE ([EndDate] = @EndDate)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label10" DbType="Date" Name="EndDate" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                CellPadding="4" CellSpacing="2" ForeColor="Black" 
                >
                <Columns>
                    <asp:BoundField DataField="BiddingId" HeaderText="BiddingId" />
                    <asp:BoundField DataField="BiddingDate" DataFormatString="{0:d}" 
                        HeaderText="BiddingDate" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" />
                    <asp:BoundField DataField="ItemId" HeaderText="ItemId" />
                    <asp:BoundField DataField="BidPoint" HeaderText="BidPoint" />
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
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Winner ID"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtWinnerId" runat="server" ValidationGroup="Winner" 
                Enabled="False"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ErrorMessage="*WinnerId" ForeColor="Red" ValidationGroup="Winner" 
                ControlToValidate="txtWinnerId"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Date"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDate" runat="server" ValidationGroup="Winner" 
                Enabled="False"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="*Date" ForeColor="Red" ValidationGroup="Winner" 
                ControlToValidate="txtDate"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" Text="Bid ID"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtBidId" runat="server" ValidationGroup="Winner" 
                Enabled="False"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="*Bid ID" ForeColor="Red" ValidationGroup="Winner" 
                ControlToValidate="txtBidPoint"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label6" runat="server" Text="User Name"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtUserName" runat="server" ValidationGroup="Winner" 
                Enabled="False"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="*User Name" ForeColor="Red" ValidationGroup="Winner" 
                ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label7" runat="server" Text="ItemName"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtItemId" runat="server" ValidationGroup="Winner" 
                Enabled="False"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="*Item ID" ForeColor="Red" ValidationGroup="Winner" 
                ControlToValidate="txtItemId"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label8" runat="server" Text="Bid Point"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtBidPoint" runat="server" ValidationGroup="Winner" 
                Enabled="False"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="*Bid Point" ForeColor="Red" ValidationGroup="Winner" 
                ControlToValidate="txtBidPoint"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:Label ID="lblErrWinner" runat="server" Text="Label" Visible="False"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

