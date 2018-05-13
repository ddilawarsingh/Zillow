using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
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

        List<nszillow.clsusrprp> usrdet;
        nszillow.clsusr fndusr = new nszillow.clsusr();
        usrdet = fndusr.Find_Rec(objprp.appusrcod);

        try
        {
            obj.Save_Rec(objprp);

            String usreml = obj.findagtbyapp(objprp.appprpcod);
            MailMessage mailMessage = new MailMessage("testzillowproject@gmail.com", usreml);
            mailMessage.Subject = "Appointment Booked!!";
            mailMessage.Body = "Appointment booked by " + usrdet[0].usreml  + " on " +objprp.appdat.ToShortDateString()+ ". You can contact the user at "+ objprp.appphn ;
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Send(mailMessage);

            nszillow.misc.showMessageAndRedirect("Appointment Booked Successfully","frmsrc.aspx");
        }
        catch
        {
        }

    }
}