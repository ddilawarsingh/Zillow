using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        if (Page.IsValid)
        {
            nszillow.clsfetprp objprp = new nszillow.clsfetprp();
            nszillow.clsfet obj = new nszillow.clsfet();
            objprp.fetdsc = TextBox1.Text;
            try
            {
                obj.Save_Rec(objprp);
            }
            catch
            {

            }
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "deleteRow")
        {
            nszillow.clsfetprp objprp = new nszillow.clsfetprp();
            nszillow.clsfet obj = new nszillow.clsfet();
            objprp.fetcod = Convert.ToInt32(e.CommandArgument);
            try
            {
                obj.Delete_Rec(objprp);
            }
            catch (SqlException exp)
            {
                if (exp.Class == 16)
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error: Cannot Delete Feature! As Feature is Not Null ')", true);
            }
            GridView1.DataBind();
        }
    }
}