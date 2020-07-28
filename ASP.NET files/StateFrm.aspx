<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="StateFrm.aspx.cs" Inherits="StateFrm" %>

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
            <td class="style2">
            </td>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="StateInformationTable"></asp:Label>
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="State ID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtStateId" runat="server" 
                    ValidationGroup="State"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="*State ID" ControlToValidate="txtStateId" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="State"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="State Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtStateName" runat="server" 
                    ValidationGroup="State" AutoPostBack="True" ForeColor="Black" 
                    ontextchanged="txtStateName_TextChanged" 
                    onkeypress = "return string_val(event);"></asp:TextBox>
                <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="Already Exist"></asp:Label>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="*State Name" ControlToValidate="txtStateName" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="State"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmitState" runat="server" Text="Submit" 
                    ValidationGroup="State" onclick="btnSubmitState_Click1"  />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblErrState" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <table align="center">
    <tr>
    <td>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
            CellSpacing="2" DataKeyNames="StateId" DataSourceID="SqlDataSource2" 
            ForeColor="Black">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="StateId" HeaderText="StateId" ReadOnly="True" 
                    SortExpression="StateId" />
                <asp:BoundField DataField="StateName" HeaderText="StateName" 
                    SortExpression="StateName" />
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
            SelectCommand="SELECT * FROM [StateMaster]">
        </asp:SqlDataSource>
    </td>
    </tr>
    </table>

    </asp:Content>
