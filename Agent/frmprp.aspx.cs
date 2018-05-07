using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Agent_Default : System.Web.UI.Page
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

    protected void datalistprp_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "deleteProperty")
        {
            nszillow.clsprp obj = new nszillow.clsprp();
            try
            {
                obj.Delete_Rec(Convert.ToInt32(e.CommandArgument));
                datalistprp.DataBind();
            }
            catch
            {

            }
        }
    }
}