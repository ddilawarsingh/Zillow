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

    }

    protected void btn1_Click(object sender, EventArgs e)
    {
        try
        {
            nszillow.clsagt obj = new nszillow.clsagt();
            nszillow.clsagtprp objprp = new nszillow.clsagtprp();

            objprp.agtcod = Convert.ToInt32(Session["cod"]);
            objprp.agtprf = txtbox1.Text;
            String s = "";
            for (Int32 i = 0; i < chkboxlist1.Items.Count; i++)
            {
                if (chkboxlist1.Items[i].Selected == true)
                {
                    s = s + chkboxlist1.Items[i].Value + ",";
                }
            }

            if (s != "")
            {
                s = s.Substring(0, s.Length - 1);
            }
            objprp.agtser = s;

            String fp = fileupload1.PostedFile.FileName;
            if (fp != "")
            {
                fp = fp.Substring(fp.LastIndexOf('.'));
                objprp.agtpic = fp;
            }

            obj.Update_Rec(objprp);

            if (fp != "")
            {
                fileupload1.PostedFile.SaveAs(Server.MapPath("../agtpics" + "//" + Session["cod"] + fp));
            }

            lblupdsts.Text = "Profile Updated";

        }
        catch
        {
            lblupdsts.Text = "Profile Not Updatad";
        }
    }
}