using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class BidFrm : System.Web.UI.Page
{
    int x;
    // MUBS_GET_SET m = new MUBS_GET_SET();
    Class1 obj = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtBidId.Text = obj.scalar("select isnull(max(bidid),0)+1 from BidMaster").ToString();
        txtBidId.Enabled = false;
        lblErrBid.Visible = false;
        Label13.Visible = false;
    }

    protected void btnSubmitBid_Click1(object sender, EventArgs e)
    {
        obj.x = obj.insert("insert into BidMaster values (" + txtBidId.Text + ",'" + txtBiderName.Text + "','" + txtBiderAddr.Text + "','" + txtBidPW.Text + "','" + txtBiderMob.Text + "'," + ddlCityId.SelectedValue + "," + ddlCountryId.SelectedValue + "," + ddlStateId.SelectedValue + "," + ddlQuesId.SelectedValue + "," + txtBidFee.Text + ")");
        if (obj.x != 0)
        {
            lblErrBid.Visible = true;
            lblErrBid.Text = "Successfully Inserted";
            GridView1.DataBind();
        }
        else
        {
            lblErrBid.Visible = true;
            lblErrBid.Text = "Invalid Info";
        }
    }
    protected void txtBiderName_TextChanged(object sender, EventArgs e)
    {
        obj.x = obj.check("select BiderName from BidMaster where BiderName='" + txtBiderName.Text + "'");
        if (obj.x != 0)
        {
            Label13.Visible = true;
            txtBiderName.Text = "";
            txtBiderName.Focus();
        }
    }
}