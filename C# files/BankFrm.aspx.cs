using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class BankFrm : System.Web.UI.Page
{
    int x;
    Class1 obj = new Class1(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        txtBankId.Text = obj.scalar("select isnull(max(BankId),0)+1 from BankMst").ToString();
        txtBankId.Enabled = false;
        lblErrBank.Visible = false;
        Label5.Visible = false;
   // Label1.Text = "Welcome :" + Session["Admin"].ToString();
        
    }
    protected void btnSubmitBank_Click(object sender, EventArgs e)
    {
        obj.x = obj.insert("insert into BankMst values ("+txtBankId.Text+",'"+txtBankName.Text+"')");
        if (obj.x != 0)
        {
            lblErrBank.Visible = true;
            lblErrBank.Text = "Successfully Inserted";
            GridView1.DataBind();
        }
        else
        {
            lblErrBank.Visible = true;
            lblErrBank.Text = "Invalid Info";
        }
    }
    protected void txtBankName_TextChanged(object sender, EventArgs e)
    {
        
    }
    protected void txtBankName_TextChanged1(object sender, EventArgs e)
    {
        obj.x = obj.check("select BankName from BankMst where BankName='" + txtBankName.Text + "'");
        if (obj.x != 0)
        {
            Label5.Visible = true;
            txtBankName.Text = "";
            txtBankName.Focus();
        }
    }
}