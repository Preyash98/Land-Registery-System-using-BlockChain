using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_LandConfirm : System.Web.UI.Page
{
    Class1 obj = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {

        TextBox4.Enabled = false;
        Label4.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int x = obj.insert("update landmst set status='"+DropDownList1.Text+"' where landid="+TextBox4.Text+"");
        if(x!=0)
        {
            Label4.Visible = true;
            Label4.Text = "Successfully Updated";
            GridView1.DataBind();
        }
        else
        {
            Label4.Visible = true;
            Label4.Text = "Invalid Info"; 
             

        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row;
        row = GridView1.SelectedRow;
        TextBox4.Text = row.Cells[1].Text;

    }
}