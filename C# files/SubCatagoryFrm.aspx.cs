using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SubCatagoryFrm : System.Web.UI.Page
{
    int x;
    Class1 obj = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtSCateId.Text = obj.scalar("select isnull(max(SCateId),0)+1 from SubCategoryMaster").ToString();
        txtSCateId.Enabled = false;
        lblErrSCate.Visible = false;
        Label6.Visible = false;
        
    }
    protected void btnSubmicSCate_Click(object sender, EventArgs e)
    {
       
    }
    protected void btnSubmicSCate_Click1(object sender, EventArgs e)
    {
        obj.x = obj.insert("insert into SubCategoryMaster values (" + txtSCateId.Text + ",'" + txtSCateName.Text + "'," + ddlCateId.SelectedValue + ")");
        if (obj.x != 0)
        {
            lblErrSCate.Visible = true;
            lblErrSCate.Text = "Successfully Inserted";
            GridView1.DataBind();
            
        }
        else
        {
            lblErrSCate.Visible = true;
            lblErrSCate.Text = "Invalid Info";
        }
    }
    protected void txtSCateName_TextChanged(object sender, EventArgs e)
    {
        obj.x = obj.check("select SCateName from SubCategoryMaster where SCateName='" + txtSCateName.Text + "'");
        if (obj.x != 0)
        {
            Label6.Visible = true;
            txtSCateName.Text = "";
            txtSCateName.Focus();
        }
    }
}