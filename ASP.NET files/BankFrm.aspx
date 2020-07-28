<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="BankFrm.aspx.cs" Inherits="BankFrm" %>

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
        .style3
        {
            height: 30px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    
    <table class="style1">
        <tr>
            <td class="style2">
            </td>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="Bank Information Table"></asp:Label>
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Bank ID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBankId" runat="server" 
                    ValidationGroup="Bank"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*Bank ID" ControlToValidate="txtBankId" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="Bank"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Bank Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBankName" runat="server" AutoPostBack="True" 
                     ValidationGroup="Bank" ontextchanged="txtBankName_TextChanged1" onkeypress= "return string_val(event);" ></asp:TextBox>
                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="Already Exist"></asp:Label>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="*Bank Name" ControlToValidate="txtBankName" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="Bank"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                </td>
            <td class="style3">
                <asp:Button ID="btnSubmitBank" runat="server" Text="Submit" 
                    onclick="btnSubmitBank_Click" ValidationGroup="Bank" />
            </td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblErrBank" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
    <table>
    <tr>
    <td>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="BankId" 
            DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" 
            ForeColor="Black">
         <Columns>
             <asp:BoundField DataField="BankId" HeaderText="BankId" ReadOnly="True" 
                 SortExpression="BankId" />
             <asp:BoundField DataField="BankName" HeaderText="BankName" 
                 SortExpression="BankName" />
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
            DeleteCommand="DELETE FROM [BankMaster] WHERE [BankId] = @BankId" 
            InsertCommand="INSERT INTO [BankMaster] ([BankId], [BankName]) VALUES (@BankId, @BankName)" 
            SelectCommand="SELECT * FROM [BankMst]" 
            UpdateCommand="UPDATE [BankMaster] SET [BankName] = @BankName WHERE [BankId] = @BankId">
            <DeleteParameters>
                <asp:Parameter Name="BankId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BankId" Type="Int32" />
                <asp:Parameter Name="BankName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BankName" Type="String" />
                <asp:Parameter Name="BankId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
       </td>
       </tr>
       </table>
       </asp:Content>

