using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Convert.ToBoolean(Session["userLoggedIn"]) == true)
        {
            applink.Visible = true;
            favlink.Visible = true;
            signoutlink.Visible = true;
            loginlink.Visible = false;
            signuplink.Visible = false;
        }
        else
        {
            applink.Visible = false;
            favlink.Visible = false;
            signoutlink.Visible = false;
            loginlink.Visible = true;
            signuplink.Visible = true;
        }

    }

    protected void btn1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            nszillow.clsusr obj = new nszillow.clsusr();
            Int32 cod;
            Char rol;
            cod = obj.logincheck(txteml.Text, txtpwd.Text, out rol);
            if (cod == -1 || cod == -2)
            {
                dvMessage.Visible = true;
                Label1.Text = "Email or Password Incorrect";
            }
            else
            {
                FormsAuthenticationTicket tk = new FormsAuthenticationTicket(1, txteml.Text, DateTime.Now, DateTime.Now.AddHours(2), false, rol.ToString());
                String s = FormsAuthentication.Encrypt(tk);
                HttpCookie ck = new HttpCookie(FormsAuthentication.FormsCookieName, s);
                Response.Cookies.Add(ck);
                Session["cod"] = cod;
                if (rol == 'A')
                {
                    Response.Redirect("agent/frmprf.aspx");
                }
                else if (rol == 'D')
                {
                    //FormsAuthentication.RedirectFromLoginPage()
                    //FormsAuthentication.RedirectFromLoginPage("ADMIN", false);
                    //Session["userLoggedIn"] = false;
                    Response.Redirect("admin/frmcty.aspx");
                }
                else if (rol == 'U')
                {
                    Session["userLoggedIn"] = true;
                    Response.Redirect("index.aspx");
                }
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
        catch
        {
        }
    }
}
