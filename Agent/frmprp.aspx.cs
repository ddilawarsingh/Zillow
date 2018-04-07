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

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        nszillow.clsprp obj = new nszillow.clsprp();
        nszillow.clsprpprp objprp = new nszillow.clsprpprp();

        objprp.prpagtcod = Convert.ToInt32(Session["cod"]);
        objprp.prpadd = txtboxadd.Text;
        objprp.prpcrd = lblcrd.Text;
        objprp.prpdsc = txtboxdsc.Text;
        objprp.prplstdat = DateTime.Now;
        objprp.prpmanpiccod = -1;
        objprp.prpprc = Convert.ToDouble(txtboxprc);
        objprp.prpprptycod = Convert.ToInt32(drpprptyp.SelectedValue);
        objprp.prpsalsts = Convert.ToChar(radiobtnSls.SelectedValue);
        objprp.prptit = txtboxtit.Text;
        objprp.prpsts = 'A';

        ViewState["cod"] = obj.Save_Rec(objprp);
        TabContainer1.Tabs[0].Enabled = false;
        TabContainer1.Tabs[1].Enabled = true;
        TabContainer1.Tabs[2].Enabled = true;
        TabContainer1.ActiveTab = TabContainer1.Tabs[1];
    }

    protected void btnsubmitfet_Click(object sender, EventArgs e)
    {
        nszillow.clsprpfet obj = new nszillow.clsprpfet();
        nszillow.clsprpfetprp objprp = new nszillow.clsprpfetprp();

        objprp.prpfetprpcod = Convert.ToInt32(ViewState["cod"]);
        objprp.prpfetfetcod = Convert.ToInt32(drpdwnlstfet.SelectedValue);
        objprp.prpfetdsc = txtboxfetdsc.Text;

        obj.Save_Rec(objprp);
        grdbind();
        txtboxfetdsc.Text = string.Empty;
    }

    private void grdbind()
    {
        nszillow.clsprpfet obj = new nszillow.clsprpfet();
        grdviewfet.DataSource = obj.dispprpfet(Convert.ToInt32(Session["@cod"]));
        grdviewfet.DataBind();
    }

}