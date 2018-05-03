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
        calext.StartDate = DateTime.Now;
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        nszillow.clsappprp objprp = new nszillow.clsappprp();
        nszillow.clsapp obj = new nszillow.clsapp();
        objprp.appdat = Convert.ToDateTime(txtboxdate.Text+" 00:00:00");
        objprp.appphn = txtboxphn.Text;
        objprp.appdsc = txtboxdsc.Text;
        objprp.appusrcod = Convert.ToInt32(Session["cod"]);
        objprp.appprpcod = Convert.ToInt32(Request.QueryString["pcod"]);
        objprp.appsts = 'B';
        try
        {
            obj.Save_Rec(objprp);
            nszillow.misc.showMessageAndRedirect("Appointment Booked Successfully","frmsrc.aspx");
        }
        catch (Exception exp)
        {
            Response.Write("WHHHHHHH");
        }

    }
}