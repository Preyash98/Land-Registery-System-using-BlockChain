<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="LandConfirm.aspx.cs" Inherits="Admin_LandConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="overflow:auto; height:110px; width:500px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LandId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="LandId" HeaderText="LandId" ReadOnly="True" SortExpression="LandId" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="LandLocation" HeaderText="LandLocation" SortExpression="LandLocation" />
            <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" />
            <asp:BoundField DataField="SCateName" HeaderText="SCateName" SortExpression="SCateName" />
            <asp:BoundField DataField="LandRate" HeaderText="LandRate" SortExpression="LandRate" />
            <asp:BoundField DataField="SqFt" HeaderText="SqFt" SortExpression="SqFt" />
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("LandMap") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("LandMap") %>' />
                </ItemTemplate>
                <ControlStyle Height="100px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("LandSatBar") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("LandSatBar") %>' />
                </ItemTemplate>
                <ControlStyle Height="100px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("LandIndex") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("LandIndex") %>' />
                </ItemTemplate>
                <ControlStyle Height="100px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT LandMst.LandId, LandMst.LandMap, LandMst.LandIndex, LandMst.LandSatBar, LandMst.LandLocation, LandMst.LandRate, LandMst.SqFt, LandMst.Status, CategoryMaster.CateName, SubCategoryMaster.SCateName, StateMaster.StateName, UserMaster.Name, CityMaster.CityName FROM StateMaster INNER JOIN LandMst ON StateMaster.StateId = LandMst.StateId INNER JOIN SubCategoryMaster INNER JOIN CategoryMaster ON SubCategoryMaster.CateId = CategoryMaster.CateId ON LandMst.Category = CategoryMaster.CateId AND LandMst.SubCategoryId = SubCategoryMaster.SCateId INNER JOIN CityMaster ON LandMst.CityId = CityMaster.CityId INNER JOIN UserMaster ON LandMst.SellerId = UserMaster.UserId WHERE (LandMst.Status IS NULL) OR (LandMst.Status LIKE 'Pending')"></asp:SqlDataSource>
    <br />
    <table class="nav_wrap">
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Confirm Land"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Land Id"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" ValidationGroup="land"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="* Not Null" ControlToValidate="TextBox4" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="land"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Confirm</asp:ListItem>
                    <asp:ListItem>Pending</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" ValidationGroup="land" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

