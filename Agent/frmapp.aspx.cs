using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Agent_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            gridBind();
        }
    }

    private void gridBind()
    {
        nszillow.clsapp obj = new nszillow.clsapp();
        DataSet ds = obj.Find_Rec_By_Agent(Convert.ToInt32(Session["cod"]));
        grdview.DataSource = ds;
        grdview.DataBind();
    }

    protected String GetPath(String pic)
    {
        if (pic.Equals(""))
            return "nopic.png";
        else
            return pic;
    }

    protected void grdview_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        nszillow.clsappprp objprp = new nszillow.clsappprp();
        objprp.appcod = Convert.ToInt32(e.Keys[0]);
        nszillow.clsapp obj = new nszillow.clsapp();
        obj.Delete_Rec(objprp);
        gridBind();
    }
}