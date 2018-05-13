using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            nszillow.clsusr obj = new nszillow.clsusr();
            nszillow.clsusrprp objprp = new nszillow.clsusrprp();
            objprp.usreml = TextBox2.Text;
            objprp.usrregdat = DateTime.Now;
            objprp.usrrol = 'A';
            String pwd = Guid.NewGuid().ToString();
            pwd = pwd.Substring(0, 9);
            objprp.usrpwd = pwd;

            try
            {
                Int32 usrcod = obj.Save_Rec(objprp);

                nszillow.clsagt obj1 = new nszillow.clsagt();
                nszillow.clsagtprp objprp1 = new nszillow.clsagtprp();
                objprp1.agtloccod = Convert.ToInt32(DropDownList2.SelectedValue);
                objprp1.agtnam = TextBox1.Text;
                objprp1.agtpic = "";
                objprp1.agtprf = "";
                objprp1.agtser = "";
                objprp1.agtusrcod = usrcod;
                try
                {
                    obj1.Save_Rec(objprp1);
                    clearAll();
                    divSuc.Visible = true;
                    divFail.Visible = false;
                    divEmailExists.Visible = false;

                    MailMessage mailMessage = new MailMessage("testzillowproject@gmail.com", objprp.usreml);
                    mailMessage.Subject = "Welcome to Zillow!!";
                    mailMessage.Body = "Your Password is " + pwd + ". Please Update Your Password as you login first time.";
                    SmtpClient smtpClient = new SmtpClient();
                    smtpClient.Send(mailMessage);

                }
                catch
                {
                    divFail.Visible = true;
                    divSuc.Visible = false;
                    divEmailExists.Visible = false;
                }
            }
            catch (SqlException exp)
            {
                if (exp.Message.StartsWith("Violation of UNIQUE KEY constraint"))
                {
                    divEmailExists.Visible = true;
                    divFail.Visible = false;
                    divSuc.Visible = false;
                }
            }
        }
    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        ListItem l = new ListItem();
        l.Text = "Select City";
        l.Value = "-1";
        DropDownList1.Items.Insert(0, l);
    }

    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        ListItem l = new ListItem();
        l.Text = "Select Location";
        l.Value = "-1";
        DropDownList2.Items.Insert(0, l);
    }

    private void clearAll()
    {
        TextBox1.Text = String.Empty;
        TextBox2.Text = String.Empty;
        TextBox1.Focus();
    }

}