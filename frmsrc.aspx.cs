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



    protected void grdview1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Response.Redirect("frmprpdet.aspx?pcod="+grdview1.DataKeys[e.NewEditIndex][0].ToString());
    }
}