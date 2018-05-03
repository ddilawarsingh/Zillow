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
            datalistBind();
        }

    }

    private void datalistBind()
    {
        nszillow.clsagtrev obj = new nszillow.clsagtrev();
        DataSet ds = obj.Disp_Rev_By_Agent(Convert.ToInt32(Session["cod"]));
        datalstrev.DataSource = ds;
        datalstrev.DataBind();
    }

}