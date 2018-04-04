using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            GridView1.DataBind();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        nszillow.clscityprp objprp = new nszillow.clscityprp();
        nszillow.clscity obj = new nszillow.clscity();
        objprp.ctynam = TextBox1.Text;
        if (objprp.ctynam != String.Empty)
        {
            obj.Save_Rec(objprp);
        }
        GridView1.DataBind();
    }
}