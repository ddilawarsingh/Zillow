using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn1_Click(object sender, EventArgs e)
    {
        nszillow.clsusr obj = new nszillow.clsusr();
        Int32 cod;
        Char rol;
        cod = obj.logincheck(txteml.Text,txtpwd.Text,out rol);
        if (cod == -1 || cod == -2)
        {
            Label1.Text = "Email or Password Incorrect";
        }
        else
        {
            Session["cod"] = cod;
            if (rol == 'A')
            {
                //nszillow.clsagt obj1 = new nszillow.clsagt();
                //List<nszillow.clsagtprp> agt = obj1.Find_Rec(Convert.ToInt32(Session["cod"]));
                //String url = GetRouteUrl("lstagt", new { agentname = agt[0].agtnam.Replace(" ", String.Empty), agentpage = "Profile"  });
                //Response.Redirect(url);
                Response.Redirect("agent/frmprf.aspx");
            }
            else if (rol == 'D')
            {
                Response.Redirect("admin/frmcty.aspx");
            }
            else if(rol == 'U')
            {

            }
        }
    }

    protected void btncreateaccount_Click(object sender, EventArgs e)
    {
        nszillow.clsusr obj = new nszillow.clsusr();
        nszillow.clsusrprp objprp = new nszillow.clsusrprp();
        objprp.usreml = txtbxemail.Text;
        objprp.usrpwd = txtbxpw.Text;
        objprp.usrregdat = DateTime.Now;
        objprp.usrrol = 'U';
        try
        {
            obj.Save_Rec(objprp);
        }
        catch (Exception exp)
        {
        }
    }
}
