using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class StateFrm : System.Web.UI.Page
{
    int x;
    Class1 obj = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtStateId.Text = obj.scalar("select isnull(max(StateId),0)+1 from StateMaster").ToString();
        txtStateId.Enabled = false;
        lblErrState.Visible = false;
        Label6.Visible = false;
        
        
    }
   
    protected void btnSubmitState_Click1(object sender, EventArgs e)
    {
        obj.x = obj.insert("insert into StateMaster values (" + txtStateId.Text + ",'" + txtStateName.Text + "')");
        if (obj.x != 0)
        {
            lblErrState.Visible = true;
            lblErrState.Text = "Successfully Inserted";
            GridView1.DataBind();
            
           
        }
        else
        {
            lblErrState.Visible = true;
            lblErrState.Text = "Invalid Info";
        }
    }
    protected void txtStateName_TextChanged(object sender, EventArgs e)
    {
        obj.x = obj.check("select StateName from StateMaster where StateName='" + txtStateName.Text + "'");
        if (obj.x != 0)
        {
            Label6.Visible = true;
            txtStateName.Text = "";
            txtStateName.Focus();
        }
    }
}