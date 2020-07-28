using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class QuestionFrm : System.Web.UI.Page
{
    int x;
    Class1 obj = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtQuesId.Text = obj.scalar("select isnull(max(QuesId),0)+1 from QuestionMaster").ToString();
        txtQuesId.Enabled = false;
        lblErrQuestion.Visible = false;
        Label5.Visible = false;
        
    }
   
    protected void btnSubmitQuestion_Click1(object sender, EventArgs e)
    {
        obj.x = obj.insert("insert into QuestionMaster values (" + txtQuesId.Text + ",'" + txtQuestion.Text + "')");
        if (obj.x != 0)
        {
            lblErrQuestion.Visible = true;
            lblErrQuestion.Text = "Successfully Inserted";
           
        }
        else
        {
            lblErrQuestion.Visible = true;
            lblErrQuestion.Text = "Invalid Info";
        }
    }
    protected void txtQuestion_TextChanged(object sender, EventArgs e)
    {
        obj.x = obj.check("select Question from QuestionMaster where Question='" + txtQuestion.Text + "'");
        if (obj.x != 0)
        {
            Label5.Visible = true;
            txtQuestion.Text = "";
            txtQuestion.Focus();
        }
    }
}