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
            datalstbind();
        }
    }

    private void datalstbind()
    {
        nszillow.clsagt obj = new nszillow.clsagt();

        datalistagt.DataSource = obj.dispagtprf(Convert.ToInt32(Request.QueryString["agtcod"]));

        datalistagt.DataBind();

    }

    protected String GetPath(String pic)
    {
        if (pic.Equals(""))
            return "nopic.png";
        else
            return pic;
    }
}