using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class CityFrm : System.Web.UI.Page
{
    int x;
    Class1 obj = new Class1();

    protected void Page_Load(object sender, EventArgs e)
    {
        txtCityId.Text = obj.scalar("select isnull(max(cityid),0)+1 from CityMaster").ToString();
        txtCityId.Enabled = false;
        lblErrCity.Visible = false;
        Label6.Visible = false;
        
    }

    protected void btnSubmitCity_Click(object sender, EventArgs e)
    {
        obj.x = obj.insert("insert into CityMaster values (" + txtCityId.Text + ",'" + txtCityName.Text + "'," + ddlStateId.SelectedValue + ")");
        if (obj.x != 0)
        {
            lblErrCity.Visible = true;
            lblErrCity.Text = "Successfully Inserted";
            GridView1.DataBind();
        }
        else
        {
            lblErrCity.Visible = true;
            lblErrCity.Text = "Invalid Info";
        }
    }
    protected void txtCityName_TextChanged(object sender, EventArgs e)
    {
        obj.x = obj.check("select CityName from CityMaster where CityName='" + txtCityName.Text + "'");
        if (obj.x != 0)
        {
            Label6.Visible = true;
            txtCityName.Text = "";
            txtCityName.Focus();
        }
    }
}