<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionFrm.aspx.cs" Inherits="QuestionFrm" %>

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
                <asp:Label ID="Label2" runat="server" Text="Question Information Table"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Question ID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtQuesId" runat="server" 
                    ValidationGroup="Question"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="*Question ID" ControlToValidate="txtQuesId" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="Question"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Question"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtQuestion" runat="server" 
                    ValidationGroup="Question" AutoPostBack="True" 
                    ontextchanged="txtQuestion_TextChanged"></asp:TextBox>
                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="Already Exist"></asp:Label>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="*Question" ControlToValidate="txtQuestion" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="Question"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmitQuestion" runat="server" Text="Submit" 
                    ValidationGroup="Question" onclick="btnSubmitQuestion_Click1" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblErrQuestion" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

