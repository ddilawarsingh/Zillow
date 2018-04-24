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
        if (Page.IsPostBack == false)
        {
            TabContainer1.Tabs[1].Enabled = false;
            TabContainer1.Tabs[2].Enabled = false;
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

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        nszillow.clsprp obj = new nszillow.clsprp();
        nszillow.clsprpprp objprp = new nszillow.clsprpprp();

        objprp.prpagtcod = Convert.ToInt32(Session["cod"]);
        objprp.prpadd = txtboxadd.Text;
        objprp.prpcrd = hidden.Value;
        objprp.prpdsc = txtboxdsc.Text;
        objprp.prplstdat = DateTime.Now;
        objprp.prpmanpiccod = -1;
        objprp.prpprc = Convert.ToDouble(txtboxprc.Text);
        objprp.prpprptycod = Convert.ToInt32(drpprptyp.SelectedValue);
        objprp.prpsalsts = Convert.ToChar(radiobtnSls.SelectedValue);
        objprp.prptit = txtboxtit.Text;
        objprp.prpsts = 'A';

        ViewState["cod"] = obj.Save_Rec(objprp); ;
        TabContainer1.Tabs[0].Enabled = false;
        TabContainer1.Tabs[1].Enabled = true;
        TabContainer1.Tabs[2].Enabled = true;
        TabContainer1.ActiveTab = TabContainer1.Tabs[1];
        
        
    }

    protected void btnsubmitfet_Click(object sender, EventArgs e)
    {
        nszillow.clsprpfet obj = new nszillow.clsprpfet();
        nszillow.clsprpfetprp objprp = new nszillow.clsprpfetprp();
        if (btnsubmitfet.Text == "Submit")
        {
            objprp.prpfetprpcod = Convert.ToInt32(ViewState["cod"]);
            objprp.prpfetfetcod = Convert.ToInt32(drpdwnlstfet.SelectedValue);
            objprp.prpfetdsc = txtboxfetdsc.Text;

            obj.Save_Rec(objprp);
            
            txtboxfetdsc.Text = String.Empty;
            grdbind();
        }
        else if(btnsubmitfet.Text == "Update")
        {
            objprp.prpfetcod = Convert.ToInt32(grdviewfet.DataKeys[grdviewfet.EditIndex].Values[0]);
            objprp.prpfetdsc = txtboxfetdsc.Text;
            objprp.prpfetfetcod = Convert.ToInt32(drpdwnlstfet.SelectedValue);
            obj.Update_Rec(objprp);
            txtboxfetdsc.Text = String.Empty;
            btnsubmitfet.Text = "Submit";
            grdviewfet.EditIndex = -1;
            grdbind();
        }
        
    }

    private void grdbind()
    {
        nszillow.clsprpfet obj = new nszillow.clsprpfet();
        grdviewfet.DataSource = obj.dispprpfet(Convert.ToInt32(ViewState["cod"]));
        grdviewfet.DataBind();
    }


    protected void grdviewfet_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        nszillow.clsprpfet obj = new nszillow.clsprpfet();
        nszillow.clsprpfetprp objprp = new nszillow.clsprpfetprp();
        objprp.prpfetcod = Convert.ToInt32(grdviewfet.DataKeys[e.RowIndex].Value);
        obj.Delete_Rec(objprp);
        grdbind();
    }

    protected void grdviewfet_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        txtboxfetdsc.Text = String.Empty;
        btnsubmitfet.Text = "Submit";
        grdviewfet.EditIndex = -1;
        grdbind();
    }

    protected void grdviewfet_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdviewfet.EditIndex = e.NewEditIndex;
        drpdwnlstfet.SelectedValue = grdviewfet.DataKeys[e.NewEditIndex].Values[1].ToString();
        txtboxfetdsc.Text = ((Label)grdviewfet.Rows[e.NewEditIndex].FindControl("lblfetdsc")).Text;
        btnsubmitfet.Text = "Update";
        grdbind();
    }

    protected void btnfileupload_Click(object sender, EventArgs e)
    {
        nszillow.clsprppicprp objprp = new nszillow.clsprppicprp();
        nszillow.clsprppic obj = new nszillow.clsprppic();
        objprp.prppicprpcod = Convert.ToInt32(ViewState["cod"]);
        objprp.prppicsts = Convert.ToChar(radiobtnAV.SelectedValue);
        objprp.prppicdsc = txtboxfildsc.Text;
        String fil = fileupload1.PostedFile.FileName;
        if (fil != "")
        {
            fil = fil.Substring(fil.LastIndexOf('.'));
        }
        objprp.prppicfil = fil;
        Int32 a = obj.Save_Rec(objprp);
        if (fil != "")
        {
            fileupload1.PostedFile.SaveAs(Server.MapPath("../prpfils") + "//" + a.ToString() + fil);
        }
        txtboxfildsc.Text = String.Empty;
        datalstbind();
    }

    void datalstbind()
    {
        nszillow.clsprppic obj = new nszillow.clsprppic();
        datalistpics.DataSource = obj.Display_Rec(Convert.ToInt32(ViewState["cod"]));
        datalistpics.DataBind();
    }

    protected void datalistpics_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Int32 prppiccod = Convert.ToInt32(datalistpics.DataKeys[e.Item.ItemIndex]);
            nszillow.clsprppic obj = new nszillow.clsprppic();
            List<nszillow.clsprppicprp> k = obj.Find_Rec(prppiccod);
            Literal litrl = (Literal)(e.Item.FindControl("literal1"));
            LinkButton lnkbtnfilselect =(LinkButton) e.Item.FindControl("lnkbtnfilselect");
            if (k[0].prppicsts=='P')
            {
                litrl.Text = "<img src='../prpfils/" + k[0].prppiccod.ToString() + k[0].prppicfil + "' height='180px' width='180px'/>";
                lnkbtnfilselect.Visible = true;

            }
            else
            {
                litrl.Text = "<embed src='../prpfils/" + k[0].prppiccod.ToString() + k[0].prppicfil + "' height='180px' width='180px' autoplay='false'/>";
                lnkbtnfilselect.Visible = false;
            }
            
        }
    }
}