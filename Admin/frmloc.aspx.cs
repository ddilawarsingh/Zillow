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
        txtboxcrd.Text = Coordinates;
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
            if (Page.IsValid)
            {
                nszillow.clslocprp objprp = new nszillow.clslocprp();
                nszillow.clsloc obj = new nszillow.clsloc();
                objprp.locctycod = Convert.ToInt32(DropDownList1.SelectedValue);
                objprp.locnam = TextBox1.Text;
                objprp.loccrd = Coordinates;
                obj.Save_Rec(objprp);
                GridView1.DataBind();
                clear_all();
            }
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
        txtboxcrd.Text = aa.Text;
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
        txtboxcrd.Text = string.Empty;
    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        ListItem l = new ListItem();
        l.Text = "Select City";
        l.Selected = true;
        l.Value = "-1";
        DropDownList1.Items.Insert(0,l);
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "deleteRow")
        {
            nszillow.clslocprp objprp = new nszillow.clslocprp();
            nszillow.clsloc obj = new nszillow.clsloc();
            objprp.loccod = Convert.ToInt32(e.CommandArgument);

            try
            {
                obj.Delete_Rec(objprp);
            }
            catch (SqlException exp)
            {
                if(exp.Class==16)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error: Cannot Delete Location! As Location is Not Null ')", true);
                }
            }

            GridView1.DataBind();
            clear_all();

        }
    }
}

//OnRowDeleting="GridView1_RowDeleting"