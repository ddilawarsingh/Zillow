using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
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
        grdview.DataSource = obj.Find_Rec_By_User(Convert.ToInt32(Session["cod"]));
        grdview.DataBind();
    }

    protected String GetPath(String pic)
    {
        if (pic.Equals(""))
            return "nopic.png";
        else
            return pic;
    }

    protected void grdview_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdview.EditIndex = e.NewEditIndex;
        gridBind();
        AjaxControlToolkit.CalendarExtender calext = (AjaxControlToolkit.CalendarExtender)grdview.Rows[e.NewEditIndex].FindControl("calext");
        calext.StartDate = DateTime.Now;
    }

    protected void grdview_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        nszillow.clsappprp objprp = new nszillow.clsappprp();
        nszillow.clsapp obj = new nszillow.clsapp();

        TextBox txtboxappdat = (TextBox)grdview.Rows[grdview.EditIndex].FindControl("txtboxappdat");
        TextBox txtboxphn = (TextBox)grdview.Rows[grdview.EditIndex].FindControl("txtboxphn");
        TextBox txtboxdsc = (TextBox)grdview.Rows[grdview.EditIndex].FindControl("txtboxdsc");

        objprp.appcod = Convert.ToInt32(grdview.DataKeys[e.RowIndex].Values[0]);
        objprp.appdat = Convert.ToDateTime(txtboxappdat.Text+" 00:00:00");
        objprp.appdsc = txtboxdsc.Text;
        objprp.appphn = txtboxphn.Text;

        obj.Update_Rec(objprp);

        grdview.EditIndex = -1;
        gridBind();

    }

    protected void grdview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdview.EditIndex = -1;
        gridBind();
    }

    protected void grdview_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        nszillow.clsappprp objprp = new nszillow.clsappprp();
        nszillow.clsapp obj = new nszillow.clsapp();

        objprp.appcod = Convert.ToInt32(grdview.DataKeys[e.RowIndex].Values[0]);

        obj.Delete_Rec(objprp);

        grdview.EditIndex = -1;
        gridBind();
    }

    protected void grdview_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "openprpdet")
        {
            Response.Redirect("frmprpdet.aspx?pcod=" + Convert.ToString(e.CommandArgument));
        }
        else if(e.CommandName == "openagtprf")
        {
            Response.Redirect("frmagtprf.aspx?agtcod="+Convert.ToString(e.CommandArgument));
        }
    }
}