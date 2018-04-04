using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            nszillow.clsusr obj = new nszillow.clsusr();
            nszillow.clsusrprp objprp = new nszillow.clsusrprp();
            objprp.usreml = TextBox2.Text;
            objprp.usrregdat = DateTime.Now;
            objprp.usrrol = 'A';
            String pwd = Guid.NewGuid().ToString();
            pwd = pwd.Substring(0, 9);
            objprp.usrpwd = pwd;
            Int32 usrcod = obj.Save_Rec(objprp);

            nszillow.clsagt obj1 = new nszillow.clsagt();
            nszillow.clsagtprp objprp1 = new nszillow.clsagtprp();
            objprp1.agtloccod = Convert.ToInt32(DropDownList2.SelectedValue);
            objprp1.agtnam = TextBox1.Text;
            objprp1.agtpic = "";
            objprp1.agtprf = "";
            objprp1.agtser = "";
            objprp1.agtusrcod = usrcod;
            obj1.Save_Rec(objprp1);

            //MailMessage mm = new MailMessage("admin@gmail.com", TextBox2.Text, "Password Info", "Your Password is " + pwd);
            //SmtpClient c = new SmtpClient("mail.ConnectZone.in" + 25);
            //c.Send(mm);
            //Response.Redirect("frmagt.aspx");
            Label1.Text = "Agent Successfully Registered";
        }
        catch
        {
            Label1.Text = "Agent Not Registered";
        }

    }
}