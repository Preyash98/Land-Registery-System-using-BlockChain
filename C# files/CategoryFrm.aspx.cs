using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class CategoryFrm : System.Web.UI.Page
{
    int x;
    Class1 obj = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtCateId.Text = obj.scalar("select isnull(max(cateid),0)+1 from CategoryMaster").ToString();
        txtCateId.Enabled = false;
        lblErrCate.Visible = false;
        Label5.Visible = false;
        
    }
    
  protected void btnSubmitCate_Click1(object sender, EventArgs e)
    {
        obj.x = obj.insert("insert into CategoryMaster values (" + txtCateId.Text + ",'"+txtCateName.Text+"')");
        if (obj.x != 0)
        {
            lblErrCate.Visible = true;
            lblErrCate.Text = "Successfully Inserted";
            GridView1.DataBind();
        }
        else
        {
            lblErrCate.Visible = true;
            lblErrCate.Text = "Invalid Info";
        }
    }
  protected void txtCateName_TextChanged(object sender, EventArgs e)
  {
      obj.x = obj.check("select CateName from CategoryMaster where CateName='" + txtCateName.Text + "'");
      if (obj.x != 0)
      {
          Label5.Visible = true;
          txtCateName.Text = "";
          txtCateName.Focus();
      }
  }
} 