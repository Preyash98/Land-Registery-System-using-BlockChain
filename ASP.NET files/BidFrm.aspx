<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="BidFrm.aspx.cs" Inherits="BidFrm" %>

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
                <asp:Label ID="Label2" runat="server" Text="Bid Master Table"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Bid ID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBidId" runat="server" 
                    ValidationGroup="Bid"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="*Bid ID" ControlToValidate="txtBidId" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="Bid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="Bider Name" ></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtBiderName" runat="server" 
                    ValidationGroup="Bid" AutoPostBack="True" 
                    ontextchanged="txtBiderName_TextChanged" 
                    onkeypress= "return string_val(event);"></asp:TextBox>
                <asp:Label ID="Label13" runat="server" ForeColor="Red" Text="Already Exist"></asp:Label>
            </td>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="*Bider Name" ControlToValidate="txtBiderName" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="Bid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Bider Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBiderAddr" runat="server" 
                    ValidationGroup="Bid"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ErrorMessage="*Bider Address" ControlToValidate="txtBiderAddr" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="Bid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Bid Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBidPW" runat="server" 
                    ValidationGroup="Bid" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ErrorMessage="*Bid Password" ControlToValidate="txtBidPW" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="Bid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Bider Mobile"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBiderMob" runat="server" 
                    ValidationGroup="Bid" onkeypress = "return phone(event);"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ErrorMessage="*Bider Mobile" ControlToValidate="txtBiderMob" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="Bid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Country Name"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCountryId" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="CountryName" 
                    DataValueField="CountryId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:umbid %>" 
                    SelectCommand="SELECT * FROM [CountryMaster]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="State Name"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlStateId" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="StateName" DataValueField="StateId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:umbid %>" 
                    SelectCommand="SELECT [StateId], [StateName] FROM [StateMaster] WHERE ([CountryId] = @CountryId)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCountryId" Name="CountryId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="City Name"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCityId" runat="server" DataSourceID="SqlDataSource3" 
                    DataTextField="CityName" DataValueField="CityId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:umbid %>" 
                    SelectCommand="SELECT [CityId], [CityName] FROM [CityMaster] WHERE ([StateId] = @StateId)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlStateId" Name="StateId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Question"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlQuesId" runat="server" DataSourceID="SqlDataSource4" 
                    DataTextField="Question" DataValueField="QuesId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:umbid %>" 
                    SelectCommand="SELECT * FROM [QuestionMaster]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Bid Fee"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBidFee" runat="server" 
                    ValidationGroup="Bid"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ErrorMessage="*Bid fee" ControlToValidate="txtBidFee" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="Bid" onkeypress = "return numeric(event);"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmitBid" runat="server" Text="Submit" 
                    ValidationGroup="Bid" onclick="btnSubmitBid_Click1" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Label ID="lblErrBid" runat="server" Text="Label"></asp:Label>
                &nbsp;</td>
        </tr>
    </table>
    <table>
    <tr>
    <td>
    <div style="vertical-align:top;width:400px;height:200px;overflow:auto">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BidID" 
            DataSourceID="SqlDataSource5" BackColor="#CCCCCC" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" 
            ForeColor="Black">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="BidID" HeaderText="BidID" ReadOnly="True" 
                    SortExpression="BidID" />
                <asp:BoundField DataField="BiderName" HeaderText="BiderName" 
                    SortExpression="BiderName" />
                <asp:BoundField DataField="BiderAddress" HeaderText="BiderAddress" 
                    SortExpression="BiderAddress" />
                <asp:BoundField DataField="BidPassword" HeaderText="BidPassword" 
                    SortExpression="BidPassword" />
                <asp:BoundField DataField="BidMobile" HeaderText="BidMobile" 
                    SortExpression="BidMobile" />
                <asp:BoundField DataField="CityId" HeaderText="CityId" 
                    SortExpression="CityId" />
                <asp:BoundField DataField="CountryId" HeaderText="CountryId" 
                    SortExpression="CountryId" />
                <asp:BoundField DataField="StateId" HeaderText="StateId" 
                    SortExpression="StateId" />
                <asp:BoundField DataField="QuesId" HeaderText="QuesId" 
                    SortExpression="QuesId" />
                <asp:BoundField DataField="BidFee" HeaderText="BidFee" 
                    SortExpression="BidFee" />
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
        </asp:GridView></div>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:umbid %>" 
            DeleteCommand="DELETE FROM [BidMaster] WHERE [BidID] = @BidID" 
            InsertCommand="INSERT INTO [BidMaster] ([BidID], [BiderName], [BiderAddress], [BidPassword], [BidMobile], [CityId], [CountryId], [StateId], [QuesId], [BidFee]) VALUES (@BidID, @BiderName, @BiderAddress, @BidPassword, @BidMobile, @CityId, @CountryId, @StateId, @QuesId, @BidFee)" 
            SelectCommand="SELECT * FROM [BidMaster]" 
            UpdateCommand="UPDATE [BidMaster] SET [BiderName] = @BiderName, [BiderAddress] = @BiderAddress, [BidPassword] = @BidPassword, [BidMobile] = @BidMobile, [CityId] = @CityId, [CountryId] = @CountryId, [StateId] = @StateId, [QuesId] = @QuesId, [BidFee] = @BidFee WHERE [BidID] = @BidID">
            <DeleteParameters>
                <asp:Parameter Name="BidID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BidID" Type="Int32" />
                <asp:Parameter Name="BiderName" Type="String" />
                <asp:Parameter Name="BiderAddress" Type="String" />
                <asp:Parameter Name="BidPassword" Type="String" />
                <asp:Parameter Name="BidMobile" Type="String" />
                <asp:Parameter Name="CityId" Type="Int32" />
                <asp:Parameter Name="CountryId" Type="Int32" />
                <asp:Parameter Name="StateId" Type="Int32" />
                <asp:Parameter Name="QuesId" Type="Int32" />
                <asp:Parameter Name="BidFee" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BiderName" Type="String" />
                <asp:Parameter Name="BiderAddress" Type="String" />
                <asp:Parameter Name="BidPassword" Type="String" />
                <asp:Parameter Name="BidMobile" Type="String" />
                <asp:Parameter Name="CityId" Type="Int32" />
                <asp:Parameter Name="CountryId" Type="Int32" />
                <asp:Parameter Name="StateId" Type="Int32" />
                <asp:Parameter Name="QuesId" Type="Int32" />
                <asp:Parameter Name="BidFee" Type="Decimal" />
                <asp:Parameter Name="BidID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </td></tr></table>
&nbsp;&nbsp;&nbsp; 
</asp:Content>

