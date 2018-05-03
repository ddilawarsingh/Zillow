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

    }



    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        nszillow.clsagtrev obj = new nszillow.clsagtrev();
        nszillow.clsagtrevprp objprp = new nszillow.clsagtrevprp();
        objprp.agtrevagtcod = Convert.ToInt32(Request.QueryString["agtcod"]);
        objprp.agtrevprpcod = Convert.ToInt32(Request.QueryString["prpcod"]);
        objprp.agtrevusrcod = Convert.ToInt32(Session["cod"]);
        objprp.agtrevdat = DateTime.Now;
        objprp.agtrevtit = txtboxrevtit.Text;
        objprp.agtrevdsc = txtboxrevdsc.Text;
        objprp.agtrevscr = Rating1.CurrentRating;

        try
        {
            obj.Save_Rec(objprp);
        }
        catch (Exception exp)
        {

        }

    }
}