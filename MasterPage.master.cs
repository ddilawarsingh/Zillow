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
}
