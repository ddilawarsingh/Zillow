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

    protected String Coordinates
    {
        get
        {
            return hidden.Value;
        }
        set
        {
            hidden.Value = value;
        }
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text == "Submit")
        {
            nszillow.clslocprp objprp = new nszillow.clslocprp();
            nszillow.clsloc obj = new nszillow.clsloc();
            objprp.locctycod = Convert.ToInt32(DropDownList1.SelectedValue);
            objprp.locnam = TextBox1.Text;
            objprp.loccrd = Coordinates;
            obj.Save_Rec(objprp);
            GridView1.DataBind();
        }
        if (Button1.Text == "Update")
        {
            nszillow.clslocprp objprp = new nszillow.clslocprp();
            nszillow.clsloc obj = new nszillow.clsloc();
            objprp.loccod = Convert.ToInt32(GridView1.DataKeys[GridView1.EditIndex].Value);
            objprp.locctycod = Convert.ToInt32(DropDownList1.SelectedValue);
            objprp.locnam = TextBox1.Text;
            objprp.loccrd = Coordinates;
            obj.Update_Rec(objprp);
            GridView1.DataBind();
            Button1.Text = "Submit";
            clear_all();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Button1.Text = "Update";
        Label aa = (Label)(GridView1.Rows[e.NewEditIndex].FindControl("Labellocname"));
        TextBox1.Text = aa.Text;
        aa = (Label)(GridView1.Rows[e.NewEditIndex].FindControl("Labelloccrd"));
        Label1.Text = aa.Text;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        clear_all();
        Button1.Text = "Submit";
    }

    protected void clear_all()
    {
        GridView1.EditIndex = -1;
        TextBox1.Text = string.Empty;
        Label1.Text = string.Empty;
    }
}

//OnRowDeleting="GridView1_RowDeleting"