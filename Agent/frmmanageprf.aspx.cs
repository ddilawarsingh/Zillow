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
        if(Page.IsPostBack==false)
        {
            fetchData();
        }
    }

    private void fetchData()
    {
        List<nszillow.clsagtprp> agentPrf;
        nszillow.clsagt agentObj = new nszillow.clsagt();
        agentPrf=agentObj.Find_Rec(Convert.ToInt32(Session["cod"]));
        txtbox1.Text = agentPrf[0].agtprf;
        String[] services = agentPrf[0].agtser.Split(',');
        Int32 j = 0;
        for (Int32 i = 0; i < chkboxlist1.Items.Count && j<services.Length; i++)
        {
            if (chkboxlist1.Items[i].Value == services[j])
            {
                chkboxlist1.Items[i].Selected = true;
                j++;
            }
        }
        hidden.Value = agentPrf[0].agtpic;
    }


    protected void btn1_Click(object sender, EventArgs e)
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
            objprp.agtpic = fp+"?ts="+DateTime.Now.ToString();
        }
        else
        {
            objprp.agtpic = hidden.Value;
        }
        
        
        try
        {
            
            obj.Update_Rec(objprp);

            if (fp != "")
            {
                //System.IO.FileInfo file = new System.IO.FileInfo();
                //System.IO.File.Delete(Server.MapPath("../agtpics" + "//" + Session["cod"] + fp));
                fileupload1.PostedFile.SaveAs(Server.MapPath("../agtpics" + "//" + Session["cod"] + fp));
            }

            divFail.Visible = false;
            divSuc.Visible = true;
            //fetchData();

        }
        catch
        {
            divFail.Visible = true;
            divSuc.Visible = false;
        }
    }
}