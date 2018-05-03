using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Agent_Default : System.Web.UI.Page
{
    private String crd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            grdbind();
            lstbind();
            datalistprpBind();
            if (crd.Length > 0)
            {
                Lat.Value = crd.Split(',')[0].Remove(0, 1);
                Lon.Value = crd.Split(',')[1].Remove(0, 1).TrimEnd(')');

            }
        }
    }

    protected void datalistpics_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Int32 prppiccod = Convert.ToInt32(datalistpics.DataKeys[e.Item.ItemIndex]);
            nszillow.clsprppic obj = new nszillow.clsprppic();
            List<nszillow.clsprppicprp> k = obj.Find_Rec(prppiccod);
            Literal litrl = (Literal)(e.Item.FindControl("literal1"));
            if (k[0].prppicsts == 'P')
            {
                litrl.Text = "<img src='../prpfils/" + k[0].prppiccod.ToString() + k[0].prppicfil + "' height='180px' width='180px'/>";
            }
            else
            {
                litrl.Text = "<embed src='../prpfils/" + k[0].prppiccod.ToString() + k[0].prppicfil + "' height='180px' width='180px' autoplay='false'/>";
            }

        }
    }

    private void datalistprpBind()
    {
        nszillow.clsprp obj = new nszillow.clsprp();
        DataSet ds = obj.dispprpdet(Convert.ToInt32(Request.QueryString["pcod"]));
        datalstprpdet.DataSource = ds;
        datalstprpdet.DataBind();
        crd = ds.Tables[0].Rows[0]["prpcrd"].ToString();
    }

    private void grdbind()
    {
        nszillow.clsprpfet obj = new nszillow.clsprpfet();
        grdviewfet.DataSource = obj.dispprpfet(Convert.ToInt32(Request.QueryString["pcod"]));
        grdviewfet.DataBind();
    }

    private void lstbind()
    {
        nszillow.clsprppic obj = new nszillow.clsprppic();
        datalistpics.DataSource = obj.Display_Rec(Convert.ToInt32(Request.QueryString["pcod"]));
        datalistpics.DataBind();
    }

    protected String GetPath(String pic)
    {
        if (pic.Equals(""))
        {
            return "nopic.png";
        }
        else
        {
            return pic;
        }
    }
}