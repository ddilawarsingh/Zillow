﻿using System;
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

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        searchResults();
    }

    private void searchResults()
    {
        nszillow.clsagt obj = new nszillow.clsagt();
        if (DropDownLoc.Items.Count != 0)
        {
            GridView1.DataSource = obj.dispagtbyloc(Convert.ToInt32(DropDownLoc.SelectedValue));
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }

    protected String GetPath(Int32 cod,String pic)
    {
        if (pic.Equals(""))
        {
            return "nopic.png";
        }
        else
        {
            return cod.ToString() + pic;
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        nszillow.clsagtprp objprp = new nszillow.clsagtprp();
        nszillow.clsagt obj = new nszillow.clsagt();
        
        objprp.agtcod = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        objprp.agtusrcod = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[1]);
        try
        {
            obj.Delete_Rec(objprp);
            searchResults();
        }
        catch
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('ERROR! Deleting Agent')", true);
        }
    }

    protected void DropDownLoc_DataBound(object sender, EventArgs e)
    {
        ListItem l = new ListItem();
        l.Text = "Select Location";
        l.Value = "-1";
        DropDownLoc.Items.Insert(0, l);
    }

    protected void DropDownCity_DataBound(object sender, EventArgs e)
    {
        ListItem l = new ListItem();
        l.Text = "Select City";
        l.Value = "-1";
        DropDownCity.Items.Insert(0, l);
    }
}


