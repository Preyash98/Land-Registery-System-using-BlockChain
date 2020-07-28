using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_WinnerFrm : System.Web.UI.Page
{
    int x;
    DataSet ds, ds1;
    Class1 obj = new Class1(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        txtWinnerId.Text = obj.scalar("select isnull(max(WinnerId),0)+1 from WinnerMaster").ToString();
        

        Label10.Text = DateTime.Now.ToShortDateString();

        if (!Page.IsPostBack)
        {
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Select", string.Empty));
        }

        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        obj.x = obj.insert("insert into WinnerMaster values (" + txtWinnerId.Text + ",'" + txtDate.Text + "'," + txtBidId.Text + ",'" + txtUserName.Text + "'," + txtItemId.Text + "," + txtBidPoint.Text + ")");
        if (obj.x != 0)
        {
            lblErrWinner.Visible = true;
            lblErrWinner.Text = "Successfully Inserted";
           
        }
        else
        {
            lblErrWinner.Visible = true;
            lblErrWinner.Text = "Invalid Info";
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (String.Compare(DropDownList1.SelectedItem.Text, "Select") != 0)
        {
            ds = new DataSet();
            ds.Clear();
            ds = obj.selectall("SELECT        MIN(BidPoint) AS Point FROM            BiddingMaster WHERE        (BidPoint IN (SELECT        Bidmst_1.BidPoint FROM            BiddingMaster AS Bidmst_1 INNER JOIN ItemMaster as Itemmst  ON Bidmst_1.ItemId = Itemmst.ItemId WHERE        (Itemmst.EndDate = '" + Label10.Text + "') AND (Bidmst_1.ItemId = " + DropDownList1.SelectedValue + ") GROUP BY Bidmst_1.BidPoint, Bidmst_1.ItemId  HAVING (COUNT(Bidmst_1.BidPoint) < 2)))");
            if (ds != null)
            {
                ds1 = new DataSet();
                ds1.Clear();
                string point=Convert.ToString(ds.Tables[0].Rows[0]["Point"]);
                if (String.Compare(point, "") != 0)
                {
                    ds1 = obj.selectall("Select * from BiddingMaster where ItemId=" + DropDownList1.SelectedValue + " and BidPoint=" + ds.Tables[0].Rows[0]["Point"]);

                    txtDate.Text = ds1.Tables[0].Rows[0]["BiddingDate"].ToString();
                    txtBidId.Text = ds1.Tables[0].Rows[0]["BiddingId"].ToString();
                    txtUserName.Text = ds1.Tables[0].Rows[0]["UserName"].ToString();
                    txtItemId.Text = ds1.Tables[0].Rows[0]["ItemId"].ToString();
                    txtBidPoint.Text = ds1.Tables[0].Rows[0]["BidPoint"].ToString();
                    GridView1.DataSource = ds1;
                    GridView1.DataBind();
                }
                else
                {
                    lblErrWinner.Visible = true;
                    lblErrWinner.Text = "Valid Bid Not Found";
                }
            }

        }
    }
}