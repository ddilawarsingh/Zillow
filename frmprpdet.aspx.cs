using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            grdbind();
            lstbind();
            nszillow.clsprp obj = new nszillow.clsprp();
            DataSet ds = obj.dispprpdet(Convert.ToInt32(Request.QueryString["pcod"]));
            datalstprpdet.DataSource = ds;
            datalstprpdet.DataBind();
            String crd = ds.Tables[0].Rows[0]["prpcod"].ToString();
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
                litrl.Text = "<img src='prpfils/" + k[0].prppiccod.ToString() + k[0].prppicfil + "' height='180px' width='180px'/>";
            }
            else
            {
                litrl.Text = "<embed src='prpfils/" + k[0].prppiccod.ToString() + k[0].prppicfil + "' height='180px' width='180px' autoplay='false'/>";
            }

        }
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

    protected void datalstprpdet_EditCommand(object source, DataListCommandEventArgs e)
    {
        if (Session["cod"] == null)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            nszillow.clsfav obj = new nszillow.clsfav();
            nszillow.clsfavprp objprp = new nszillow.clsfavprp();
            objprp.favdat = DateTime.Now;
            objprp.favprpcod = Convert.ToInt32(Request.QueryString["pcod"]);
            objprp.favusrcod = Convert.ToInt32(Session["cod"]);
            obj.Save_Rec(objprp);
            Response.Redirect("frmfav.aspx");
        }
    }
}