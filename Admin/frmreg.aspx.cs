using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
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
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Agent Registered Successfully. Password will be sent to the entered email')", true);
                }
                catch (Exception exp)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Agent Registered Failed')", true);
                }
            }
            catch (SqlException exp)
            {
                if(exp.Message.StartsWith("Violation of UNIQUE KEY constraint"))
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Agent Registered Failed! Entered Email Already Exists')", true);
            }

            

            //MailMessage mm = new MailMessage("admin@gmail.com", TextBox2.Text, "Password Info", "Your Password is " + pwd);
            //SmtpClient c = new SmtpClient("mail.ConnectZone.in" + 25);
            //c.Send(mm);
            //Response.Redirect("frmagt.aspx");
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
        DropDownList1.SelectedIndex = 1;
        DropDownList2.SelectedIndex = 1;
        TextBox1.Text = String.Empty;
        TextBox2.Text = String.Empty;
        TextBox1.Focus();
    }

}