using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace nszillow
{
    interface intagt
    {
        Int32 agtcod { get; set; }
        String agtnam { get; set; }
        Int32 agtloccod { get; set; }
        String agtpic { get; set; }
        String agtser { get; set; }
        String agtprf { get; set; }
        Int32 agtusrcod { get; set; }
    }
    interface intagtrev
    {
        Int32 agtrevcod { get; set; }
        Int32 agtrevagtcod { get; set; }
        Int32 agtrevusrcod { get; set; }
        Int32 agtrevprpcod { get; set; }
        DateTime agtrevdat { get; set; }
        String agtrevtit { get; set; }
        String agtrevdsc { get; set; }
        Int32 agtrevscr { get; set; }
    }
    interface intapp
    {
        Int32 appcod { get; set; }
        Int32 appusrcod { get; set; }
        Int32 appprpcod { get; set; }
        DateTime appdat { get; set; }
        String appdsc { get; set; }
        String appphn { get; set; }
        Char appsts { get; set; }
    }
    interface intcity
    {
        Int32 ctycod { get; set; }
        String ctynam { get; set; }
    }
    interface intfav
    {
        Int32 favcod { get; set; }
        Int32 favusrcod { get; set; }
        Int32 favprpcod { get; set; }
        DateTime favdat { get; set; }
    }
    interface intfet
    {
        Int32 fetcod { get; set; }
        String fetdsc { get; set; }
    }
    interface intloc
    {
        Int32 loccod { get; set; }
        String locnam { get; set; }
        Int32 locctycod { get; set; }
        String loccrd { get; set; }
    }
    interface intprp
    {
        Int32 prpcod { get; set; }
        String prptit { get; set; }
        Int32 prpagtcod { get; set; }
        Int32 prpprptycod { get; set; }
        String prpadd { get; set; }
        String prpcrd { get; set; }
        Char prpsalsts { get; set; }
        String prpdsc { get; set; }
        Double prpprc { get; set; }
        DateTime prplstdat { get; set; }
        Int32 prpmanpiccod { get; set; }
        Char prpsts { get; set; }
       
    }
    interface intprpfet
    {
        Int32 prpfetcod { get; set; }
        Int32 prpfetprpcod { get; set; }
        Int32 prpfetfetcod { get; set; }
        String prpfetdsc { get; set; }
    }
    interface intprppic
    {
        Int32 prppiccod { get; set; }
        Int32 prppicprpcod { get; set; }
        String prppicfil { get; set; }
        String prppicdsc { get; set; }
        Char prppicsts { get; set; }
    }
    interface intprpty
    {
        Int32 prptycod { get; set; }
        String prptypnam { get; set; }
    }
    interface intusr
    {
        Int32 usrcod { get; set; }
        String usreml { get; set; }
        String usrpwd { get; set; }
        DateTime usrregdat { get; set; }
        Char usrrol { get; set; }
    }


    public abstract class clscon
    {
        protected SqlConnection con = new SqlConnection();
        public clscon()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        }
    }


    public class clsagtprp : intagt
    {
        private Int32 prvagtcod;
        private String prvagtnam;
        private Int32 prvagtloccod;
        private String prvagtpic;
        private String prvagtser;
        private String prvagtprf;
        private Int32 prvagtusrcod;

        public Int32 agtcod
        {
            get
            {
                return prvagtcod;
            }
            set
            {
                prvagtcod = value;
            }
        }
        public String agtnam
        {
            get
            {
                return prvagtnam;
            }
            set
            {
                prvagtnam = value;
            }
        }
        public Int32 agtloccod
        {
            get
            {
                return prvagtloccod;
            }
            set
            {
                prvagtloccod = value;
            }
        }
        public String agtpic
        {
            get
            {
                return prvagtpic;
            }
            set
            {
                prvagtpic = value;
            }
        }
        public String agtser
        {
            get
            {
                return prvagtser;
            }
            set
            {
                prvagtser = value;
            }
        }
        public String agtprf
        {
            get
            {
                return prvagtprf;
            }
            set
            {
                prvagtprf = value;
            }
        }
        public Int32 agtusrcod
        {
            get
            {
                return prvagtusrcod;
            }
            set
            {
                prvagtusrcod = value;
            }
        }
    }
    public class clsagtrevprp : intagtrev
    {
        private Int32 prvagtrevcod;
        private Int32 prvagtrevagtcod;
        private Int32 prvagtrevusrcod;
        private Int32 prvagtrevprpcod;
        private DateTime prvagtrevdat;
        private String prvagtrevtit;
        private String prvagtrevdsc;
        private Int32 prvagtrevscr;

        public Int32 agtrevcod
        {
            get
            {
                return prvagtrevcod;
            }
            set
            {
                prvagtrevcod = value;
            }
        }
        public Int32 agtrevagtcod
        {
            get
            {
                return prvagtrevagtcod;
            }
            set
            {
                prvagtrevagtcod = value;
            }
        }
        public Int32 agtrevusrcod
        {
            get
            {
                return prvagtrevusrcod;
            }
            set
            {
                prvagtrevusrcod = value;
            }
        }
        public Int32 agtrevprpcod
        {
            get
            {
                return prvagtrevprpcod;
            }
            set
            {
                prvagtrevprpcod = value;
            }
        }
        public DateTime agtrevdat
        {
            get
            {
                return prvagtrevdat;
            }
            set
            {
                prvagtrevdat = value;
            }
        }
        public String agtrevtit
        {
            get
            {
                return prvagtrevtit;
            }
            set
            {
                prvagtrevtit = value;
            }
        }
        public String agtrevdsc
        {
            get
            {
                return prvagtrevdsc;
            }
            set
            {
                prvagtrevdsc = value;
            }
        }
        public Int32 agtrevscr
        {
            get
            {
                return prvagtrevscr;
            }
            set
            {
                prvagtrevscr = value;
            }
        }
    }
    public class clsappprp : intapp
    {
        private Int32 prvappcod;
        private Int32 prvappusrcod;
        private Int32 prvappprpcod;
        private DateTime prvappdat;
        private String prvappdsc;
        private String prvappphn;
        private Char prvappsts;

        public Int32 appcod
        {
            get
            {
                return prvappcod;
            }
            set
            {
                prvappcod = value;
            }
        }
        public Int32 appusrcod
        {
            get
            {
                return prvappusrcod;
            }
            set
            {
                prvappusrcod = value;
            }
        }
        public Int32 appprpcod
        {
            get
            {
                return prvappprpcod;
            }
            set
            {
                prvappprpcod = value;
            }
        }
        public DateTime appdat
        {
            get
            {
                return prvappdat;
            }
            set
            {
                prvappdat = value;
            }
        }
        public String appdsc
        {
            get
            {
                return prvappdsc;
            }
            set
            {
                prvappdsc = value;
            }
        }
        public String appphn
        {
            get
            {
                return prvappphn;
            }
            set
            {
                prvappphn = value;
            }
        }
        public Char appsts
        {
            get
            {
                return prvappsts;
            }
            set
            {
                prvappsts = value;
            }
        }

    }
    public class clscityprp : intcity
    {
        private Int32 prvctycod;
        private String prvctynam;

        public Int32 ctycod
        {
            get
            {
                return prvctycod;
            }
            set
            {
                prvctycod = value;
            }
        }
        public String ctynam
        {
            get
            {
                return prvctynam;
            }
            set
            {
                prvctynam = value;
            }
        }
    }
    public class clsfavprp : intfav
    {
        private Int32 prvfavcod;
        private Int32 prvfavusrcod;
        private Int32 prvfavprpcod;
        private DateTime prvfavdat;

        public Int32 favcod
        {
            get
            {
                return prvfavcod;
            }
            set
            {
                prvfavcod = value;
            }
        }
        public Int32 favusrcod
        {
            get
            {
                return prvfavusrcod;
            }
            set
            {
                prvfavusrcod = value;
            }
        }
        public Int32 favprpcod
        {
            get
            {
                return prvfavprpcod;
            }
            set
            {
                prvfavprpcod = value;
            }
        }
        public DateTime favdat
        {
            get
            {
                return prvfavdat;
            }
            set
            {
                prvfavdat = value;
            }
        }

    }
    public class clsfetprp : intfet
    {
        private Int32 prvfetcod;
        private String prvfetdsc;

        public Int32 fetcod
        {
            get
            {
                return prvfetcod;
            }
            set
            {
                prvfetcod = value;
            }
        }
        public String fetdsc
        {
            get
            {
                return prvfetdsc;
            }
            set
            {
                prvfetdsc = value;
            }
        }
    }
    public class clslocprp : intloc
    {
        private Int32 prvloccod;
        private String prvlocnam;
        private Int32 prvlocctycod;
        private String prvloccrd;

        public Int32 loccod
        {
            get
            {
                return prvloccod;
            }
            set
            {
                prvloccod = value;
            }
        }
        public String locnam
        {
            get
            {
                return prvlocnam;
            }
            set
            {
                prvlocnam = value;
            }
        }
        public Int32 locctycod
        {
            get
            {
                return prvlocctycod;
            }
            set
            {
                prvlocctycod = value;
            }
        }
        public String loccrd
        {
            get
            {
                return prvloccrd;
            }
            set
            {
                prvloccrd = value;
            }
        }
    }
    public class clsprpprp : intprp
    {
        private Int32 prvprpcod;
        private String prvprptit;
        private Int32 prvprpagtcod;
        private Int32 prvprpprptycod;
        private String prvprpadd;
        private String prvprpcrd;
        private Char prvprpsalsts;
        private String prvprpdsc;
        private Double prvprpprc;
        private DateTime prvprplstdat;
        private Int32 prvprpmanpiccod;
        private Char prvprpsts;

        public Int32 prpcod
        {
            get
            {
                return prvprpcod;
            }
            set
            {
                prvprpcod = value;
            }
        }
        public String prptit
        {
            get
            {
                return prvprptit;
            }
            set
            {
                prvprptit = value;
            }
        }
        public Int32 prpagtcod
        {
            get
            {
                return prvprpagtcod;
            }
            set
            {
                prvprpagtcod = value;
            }
        }
        public Int32 prpprptycod
        {
            get
            {
                return prvprpprptycod;
            }
            set
            {
                prvprpprptycod = value;
            }
        }
        public String prpadd
        {
            get
            {
                return prvprpadd;
            }
            set
            {
                prvprpadd = value;
            }
        }
        public String prpcrd
        {
            get
            {
                return prvprpcrd;
            }
            set
            {
                prvprpcrd = value;
            }
        }
        public Char prpsalsts
        {
            get
            {
                return prvprpsalsts;
            }
            set
            {
                prvprpsalsts = value;
            }
        }
        public String prpdsc
        {
            get
            {
                return prvprpdsc;
            }
            set
            {
                prvprpdsc = value;
            }
        }
        public Double prpprc
        {
            get
            {
                return prvprpprc;
            }
            set
            {
                prvprpprc = value;
            }
        }
        public DateTime prplstdat
        {
            get
            {
                return prvprplstdat;
            }
            set
            {
                prvprplstdat = value;
            }
        }
        public Int32 prpmanpiccod
        {
            get
            {
                return prvprpmanpiccod;
            }
            set
            {
                prvprpmanpiccod = value;
            }
        }
        public Char prpsts
        {
            get
            {
                return prvprpsts;
            }
            set
            {
                prvprpsts = value;
            }
        }

    }
    public class clsprpfetprp : intprpfet
    {
        private Int32 prvprpfetcod;
        private Int32 prvprpfetprpcod;
        private Int32 prvprpfetfetcod;
        private String prvprpfetdsc;

        public Int32 prpfetcod
        {
            get
            {
                return prvprpfetcod;
            }
            set
            {
                prvprpfetcod = value;
            }
        }
        public Int32 prpfetprpcod
        {
            get
            {
                return prvprpfetprpcod;
            }
            set
            {
                prvprpfetprpcod = value;
            }
        }
        public Int32 prpfetfetcod
        {
            get
            {
                return prvprpfetfetcod;
            }
            set
            {
                prvprpfetfetcod = value;
            }
        }
        public String prpfetdsc
        {
            get
            {
                return prvprpfetdsc;
            }
            set
            {
                prvprpfetdsc = value;
            }
        }
    }
    public class clsprppicprp : intprppic
    {
        private Int32 prvprppiccod;
        private Int32 prvprppicprpcod;
        private String prvprppicfil;
        private String prvprppicdsc;
        private Char prvprppicsts;

        public Int32 prppiccod
        {
            get
            {
                return prvprppiccod;
            }
            set
            {
                prvprppiccod = value;
            }
        }
        public Int32 prppicprpcod
        {
            get
            {
                return prvprppicprpcod;
            }
            set
            {
                prvprppicprpcod = value;
            }
        }
        public String prppicfil
        {
            get
            {
                return prvprppicfil;
            }
            set
            {
                prvprppicfil = value;
            }
        }
        public String prppicdsc
        {
            get
            {
                return prvprppicdsc;
            }
            set
            {
                prvprppicdsc = value;
            }
        }
        public Char prppicsts
        {
            get
            {
                return prvprppicsts;
            }
            set
            {
                prvprppicsts = value;
            }
        }


    }
    public class clsprptyprp : intprpty
    {
        private Int32 prvprptycod;
        private String prvprptypnam;

        public Int32 prptycod
        {
            get
            {
                return prvprptycod;
            }
            set
            {
                prvprptycod = value;
            }
        }
        public String prptypnam
        {
            get
            {
                return prvprptypnam;
            }
            set
            {
                prvprptypnam = value;
            }
        }

    }
    public class clsusrprp : intusr
    {
        private Int32 prvusrcod;
        private String prvusreml;
        private String prvusrpwd;
        private DateTime prvusrregdat;
        private Char prvusrrol;

        public Int32 usrcod
        {
            get
            {
                return prvusrcod;
            }
            set
            {
                prvusrcod = value;
            }
        }
        public String usreml
        {
            get
            {
                return prvusreml;
            }
            set
            {
                prvusreml = value;
            }
        }
        public String usrpwd
        {
            get
            {
                return prvusrpwd;
            }
            set
            {
                prvusrpwd = value;
            }
        }
        public DateTime usrregdat
        {
            get
            {
                return prvusrregdat;
            }
            set
            {
                prvusrregdat = value;
            }
        }
        public Char usrrol
        {
            get
            {
                return prvusrrol;
            }
            set
            {
                prvusrrol = value;
            }
        }
    }


    public class clsagt : clscon
    {
        public DataSet dispagtprf(Int32 agtcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter adp = new SqlDataAdapter("dispagtprf",con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.Add("@agtcod", SqlDbType.Int).Value = agtcod;
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }
        public DataSet dispagtbyloc(Int32 loccod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter adp = new SqlDataAdapter("dispagtbyloc", con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.Add("loccod", SqlDbType.Int).Value = loccod;
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }
        public void Save_Rec(clsagtprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insagt", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@agtnam", SqlDbType.VarChar, 100).Value = p.agtnam;
            cmd.Parameters.Add("@agtloccod", SqlDbType.Int).Value = p.agtloccod;
            cmd.Parameters.Add("@agtpic", SqlDbType.VarChar, 50).Value = p.agtpic;
            cmd.Parameters.Add("@agtser", SqlDbType.VarChar, 100).Value = p.agtser;
            cmd.Parameters.Add("@agtprf", SqlDbType.NVarChar, 1000).Value = p.agtprf;
            cmd.Parameters.Add("@agtusrcod", SqlDbType.Int).Value = p.agtusrcod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Update_Rec(clsagtprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updagt", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@agtcod", SqlDbType.Int).Value = p.agtcod;
            cmd.Parameters.Add("@agtpic", SqlDbType.VarChar, 50).Value = p.agtpic;
            cmd.Parameters.Add("@agtser", SqlDbType.VarChar, 100).Value = p.agtser;
            cmd.Parameters.Add("@agtprf", SqlDbType.NVarChar, 1000).Value = p.agtprf;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(clsagtprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delagt", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@agtcod", SqlDbType.Int).Value = p.agtcod;
            cmd.Parameters.Add("@agtusrcod", SqlDbType.Int).Value = p.agtusrcod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clsagtprp> Display_Rec()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispagt", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsagtprp> obj = new List<clsagtprp>();

            while (dr.Read())
            {
                clsagtprp k = new clsagtprp();
                k.agtcod = Convert.ToInt32(dr[0]);
                k.agtnam = dr[1].ToString();
                k.agtloccod = Convert.ToInt32(dr[2]);
                k.agtpic = dr[3].ToString();
                k.agtser = dr[4].ToString();
                k.agtprf = dr[5].ToString();
                k.agtusrcod = Convert.ToInt32(dr[6]);
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clsagtprp> Find_Rec(Int32 agtcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findagt", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@agtcod", SqlDbType.Int).Value = agtcod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsagtprp> obj = new List<clsagtprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clsagtprp k = new clsagtprp();
                k.agtcod = Convert.ToInt32(dr[0]);
                k.agtnam = dr[1].ToString();
                k.agtloccod = Convert.ToInt32(dr[2]);
                k.agtpic = dr[3].ToString();
                k.agtser = dr[4].ToString();
                k.agtprf = dr[5].ToString();
                k.agtusrcod = Convert.ToInt32(dr[6]);
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clsagtrev : clscon
    { 
        public DataSet Disp_Rev_By_Agent(Int32 agtcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter adp = new SqlDataAdapter("disprevbyagt", con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.Add("@agtcod", SqlDbType.Int).Value = agtcod;

            DataSet ds = new DataSet();

            adp.Fill(ds);
            return ds;
        }
        public void Save_Rec(clsagtrevprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insagtrev", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@agtrevagtcod", SqlDbType.Int).Value = p.agtrevagtcod;
            cmd.Parameters.Add("@agtrevusrcod", SqlDbType.Int).Value = p.agtrevusrcod;
            cmd.Parameters.Add("@agtrevprpcod", SqlDbType.Int).Value = p.agtrevprpcod;
            cmd.Parameters.Add("@agtrevdat", SqlDbType.DateTime).Value = p.agtrevdat;
            cmd.Parameters.Add("@agtrevtit", SqlDbType.VarChar, 100).Value = p.agtrevtit;
            cmd.Parameters.Add("@agtrevdsc", SqlDbType.VarChar, 500).Value = p.agtrevdsc;
            cmd.Parameters.Add("@agtrevscr", SqlDbType.Int).Value = p.agtrevscr;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Update_Rec(clsagtrevprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updagtrev", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@agtrevcod", SqlDbType.Int).Value = p.agtrevcod;
            cmd.Parameters.Add("@agtrevagtcod", SqlDbType.Int).Value = p.agtrevagtcod;
            cmd.Parameters.Add("@agtrevusrcod", SqlDbType.Int).Value = p.agtrevusrcod;
            cmd.Parameters.Add("@agtrevprpcod", SqlDbType.Int).Value = p.agtrevprpcod;
            cmd.Parameters.Add("@agtrevdat", SqlDbType.DateTime).Value = p.agtrevdat;
            cmd.Parameters.Add("@agtrevtit", SqlDbType.VarChar, 100).Value = p.agtrevtit;
            cmd.Parameters.Add("@agtrevdsc", SqlDbType.VarChar, 500).Value = p.agtrevdsc;
            cmd.Parameters.Add("@agtrevscr", SqlDbType.Int).Value = p.agtrevscr;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(clsagtrevprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delagtrev", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@agtrevcod", SqlDbType.Int).Value = p.agtrevcod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clsagtrevprp> Display_Rec()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispagtrev", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsagtrevprp> obj = new List<clsagtrevprp>();

            while (dr.Read())
            {
                clsagtrevprp k = new clsagtrevprp();
                k.agtrevcod = Convert.ToInt32(dr[0]);
                k.agtrevagtcod = Convert.ToInt32(dr[1]);
                k.agtrevusrcod = Convert.ToInt32(dr[2]);
                k.agtrevprpcod = Convert.ToInt32(dr[3]);
                k.agtrevdat = Convert.ToDateTime(dr[4]);
                k.agtrevtit = dr[5].ToString();
                k.agtrevdsc = dr[6].ToString();
                k.agtrevscr = Convert.ToInt32(dr[7]);
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clsagtrevprp> Find_Rec(Int32 agtrevcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findagt", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@agtrevcod", SqlDbType.Int).Value = agtrevcod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsagtrevprp> obj = new List<clsagtrevprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clsagtrevprp k = new clsagtrevprp();
                k.agtrevcod = Convert.ToInt32(dr[0]);
                k.agtrevagtcod = Convert.ToInt32(dr[1]);
                k.agtrevusrcod = Convert.ToInt32(dr[2]);
                k.agtrevprpcod = Convert.ToInt32(dr[3]);
                k.agtrevdat = Convert.ToDateTime(dr[4]);
                k.agtrevtit = dr[5].ToString();
                k.agtrevdsc = dr[6].ToString();
                k.agtrevscr = Convert.ToInt32(dr[7]);
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clsapp : clscon
    {
        public DataSet Find_Rec_By_Agent(Int32 agtcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter adp = new SqlDataAdapter("findappbyagt", con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.Add("@agtcod", SqlDbType.Int).Value = agtcod;

            DataSet ds = new DataSet();

            adp.Fill(ds);
            return ds;
        }
        public DataSet Find_Rec_By_User(Int32 appusrcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter adp = new SqlDataAdapter("findappbyusr", con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.Add("@appusrcod", SqlDbType.Int).Value = appusrcod;

            DataSet ds = new DataSet();

            adp.Fill(ds);
            return ds;
            
        }
        public void Save_Rec(clsappprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insapp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@appusrcod", SqlDbType.Int).Value = p.appusrcod;
            cmd.Parameters.Add("@appprpcod", SqlDbType.Int).Value = p.appprpcod;
            cmd.Parameters.Add("@appdat", SqlDbType.DateTime).Value = p.appdat;
            cmd.Parameters.Add("@appdsc", SqlDbType.VarChar, 1000).Value = p.appdsc;
            cmd.Parameters.Add("@appphn", SqlDbType.VarChar, 1000).Value = p.appphn;
            cmd.Parameters.Add("@appsts", SqlDbType.Char).Value = p.appsts;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Update_Rec(clsappprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updapp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@appcod", SqlDbType.Int).Value = p.appcod;
            //cmd.Parameters.Add("@appusrcod", SqlDbType.Int).Value = p.appusrcod;
            //cmd.Parameters.Add("@appprpcod", SqlDbType.Int).Value = p.appprpcod;
            cmd.Parameters.Add("@appdat", SqlDbType.DateTime).Value = p.appdat;
            cmd.Parameters.Add("@appdsc", SqlDbType.VarChar, 1000).Value = p.appdsc;
            cmd.Parameters.Add("@appphn", SqlDbType.VarChar, 1000).Value = p.appphn;
            //cmd.Parameters.Add("@appsts", SqlDbType.Char).Value = p.appsts;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(clsappprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delapp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@appcod", SqlDbType.Int).Value = p.appcod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clsappprp> Display_Rec()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispapp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsappprp> obj = new List<clsappprp>();

            while (dr.Read())
            {
                clsappprp k = new clsappprp();
                k.appcod = Convert.ToInt32(dr[0]);
                k.appusrcod = Convert.ToInt32(dr[1]);
                k.appprpcod = Convert.ToInt32(dr[2]);
                k.appdat = Convert.ToDateTime(dr[3]);
                k.appdsc = dr[4].ToString();
                k.appphn = dr[5].ToString();
                k.appsts = Convert.ToChar(dr[6]);
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clsappprp> Find_Rec(Int32 appcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findapp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@appcod", SqlDbType.Int).Value = appcod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsappprp> obj = new List<clsappprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clsappprp k = new clsappprp();
                k.appcod = Convert.ToInt32(dr[0]);
                k.appusrcod = Convert.ToInt32(dr[1]);
                k.appprpcod = Convert.ToInt32(dr[2]);
                k.appdat = Convert.ToDateTime(dr[3]);
                k.appdsc = dr[4].ToString();
                k.appphn = dr[5].ToString();
                k.appsts = Convert.ToChar(dr[6]);
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clscity : clscon
    {
        public void Save_Rec(clscityprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("inscity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ctynam", SqlDbType.VarChar,100).Value = p.ctynam;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Update_Rec(clscityprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updcity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ctycod", SqlDbType.Int).Value = p.ctycod;
            cmd.Parameters.Add("@ctynam", SqlDbType.VarChar,100).Value = p.ctynam;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(clscityprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delcity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ctycod", SqlDbType.Int).Value = p.ctycod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clscityprp> Display_Rec()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispcity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clscityprp> obj = new List<clscityprp>();

            while (dr.Read())
            {
                clscityprp k = new clscityprp();
                k.ctycod = Convert.ToInt32(dr[0]);
                k.ctynam = dr[1].ToString();
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clscityprp> Find_Rec(Int32 ctycod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findcity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ctycod", SqlDbType.Int).Value = ctycod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clscityprp> obj = new List<clscityprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clscityprp k = new clscityprp();
                k.ctycod = Convert.ToInt32(dr[0]);
                k.ctynam = dr[1].ToString();
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clsfav : clscon
    {
        public DataSet findfavbyusr(Int32 usrcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter adp = new SqlDataAdapter("findfavbyusr", con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.Add("@usrcod", SqlDbType.Int).Value = usrcod;
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }
        public void Save_Rec(clsfavprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insfav", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@favusrcod", SqlDbType.Int).Value = p.favusrcod;
            cmd.Parameters.Add("@favprpcod", SqlDbType.Int).Value = p.favprpcod;
            cmd.Parameters.Add("@favdat", SqlDbType.DateTime).Value = p.favdat;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Update_Rec(clsfavprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updfav", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@favcod", SqlDbType.Int).Value = p.favcod;
            cmd.Parameters.Add("@favusrcod", SqlDbType.Int).Value = p.favusrcod;
            cmd.Parameters.Add("@favprpcod", SqlDbType.Int).Value = p.favprpcod;
            cmd.Parameters.Add("@favdat", SqlDbType.DateTime).Value = p.favdat;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(clsfavprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delfav", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@favcod", SqlDbType.Int).Value = p.favcod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clsfavprp> Display_Rec()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispfav", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsfavprp> obj = new List<clsfavprp>();

            while (dr.Read())
            {
                clsfavprp k = new clsfavprp();
                k.favcod = Convert.ToInt32(dr[0]);
                k.favusrcod = Convert.ToInt32(dr[1]);
                k.favprpcod = Convert.ToInt32(dr[2]);
                k.favdat = Convert.ToDateTime(dr[3]);
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clsfavprp> Find_Rec(Int32 favcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findfav", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@favcod", SqlDbType.Int).Value = favcod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsfavprp> obj = new List<clsfavprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clsfavprp k = new clsfavprp();
                k.favcod = Convert.ToInt32(dr[0]);
                k.favusrcod = Convert.ToInt32(dr[1]);
                k.favprpcod = Convert.ToInt32(dr[2]);
                k.favdat = Convert.ToDateTime(dr[3]);
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clsfet : clscon
    {
        public void Save_Rec(clsfetprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insfet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@fetdsc", SqlDbType.VarChar, 200).Value = p.fetdsc;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Update_Rec(clsfetprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updfet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@fetcod", SqlDbType.Int).Value = p.fetcod;
            cmd.Parameters.Add("@fetdsc", SqlDbType.VarChar, 200).Value = p.fetdsc;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(clsfetprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delfet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@fetcod", SqlDbType.Int).Value = p.fetcod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clsfetprp> Display_Rec()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispfet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsfetprp> obj = new List<clsfetprp>();

            while (dr.Read())
            {
                clsfetprp k = new clsfetprp();
                k.fetcod = Convert.ToInt32(dr[0]);
                k.fetdsc = dr[1].ToString();
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clsfetprp> Find_Rec(Int32 fetcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findfet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@fetcod", SqlDbType.Int).Value = fetcod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsfetprp> obj = new List<clsfetprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clsfetprp k = new clsfetprp();
                k.fetcod = Convert.ToInt32(dr[0]);
                k.fetdsc = dr[1].ToString();
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clsloc : clscon
    {
        public void Save_Rec(clslocprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insloc", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@locnam", SqlDbType.VarChar, 100).Value = p.locnam;
            cmd.Parameters.Add("@locctycod", SqlDbType.Int).Value = p.locctycod;
            cmd.Parameters.Add("@loccrd", SqlDbType.VarChar, 200).Value = p.loccrd;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Update_Rec(clslocprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updloc", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@loccod", SqlDbType.Int).Value = p.loccod;
            cmd.Parameters.Add("@locnam", SqlDbType.VarChar, 100).Value = p.locnam;
            cmd.Parameters.Add("@locctycod", SqlDbType.Int).Value = p.locctycod;
            cmd.Parameters.Add("@loccrd", SqlDbType.VarChar, 200).Value = p.loccrd;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(clslocprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delloc", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@loccod", SqlDbType.Int).Value = p.loccod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clslocprp> Display_Rec(Int32 ctycod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("disploc", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ctycod", SqlDbType.Int).Value = ctycod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clslocprp> obj = new List<clslocprp>();

            while (dr.Read())
            {
                clslocprp k = new clslocprp();
                k.loccod = Convert.ToInt32(dr[0]);
                k.locnam = dr[1].ToString();
                k.locctycod = Convert.ToInt32(dr[2]);
                k.loccrd = dr[3].ToString();
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clslocprp> Find_Rec(Int32 loccod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findloc", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@loccod", SqlDbType.Int).Value = loccod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clslocprp> obj = new List<clslocprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clslocprp k = new clslocprp();
                k.loccod = Convert.ToInt32(dr[0]);
                k.locnam = dr[1].ToString();
                k.locctycod = Convert.ToInt32(dr[2]);
                k.loccrd = dr[3].ToString();
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clsprp : clscon
    {
        public void setAsMainPic(Int32 prpcod, Int32 prppiccod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("setAsMainPic", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prpcod", SqlDbType.Int).Value = prpcod;
            cmd.Parameters.Add("@prppiccod", SqlDbType.Int).Value = prppiccod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public DataSet dispagtprp(Int32 agtcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter adp = new SqlDataAdapter("dispagtprp", con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.Add("@agtcod", SqlDbType.Int).Value = agtcod;
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }
        public DataSet dispprpdet(Int32 prpcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter adp = new SqlDataAdapter("dispprpdet", con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.Add("@prpcod", SqlDbType.Int).Value = prpcod;
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }
        public DataSet srcprp(Int32 loccod, Int32 prptycod, Char sts)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter adp = new SqlDataAdapter("srcprp", con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.Add("@loccod", SqlDbType.Int).Value = loccod;
            adp.SelectCommand.Parameters.Add("@prptycod", SqlDbType.Int).Value = prptycod;
            adp.SelectCommand.Parameters.Add("@sts", SqlDbType.Char,1).Value = sts;
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }
        public Int32 Save_Rec(clsprpprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insprp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prptit", SqlDbType.VarChar, 100).Value = p.prptit;
            cmd.Parameters.Add("@prpagtcod", SqlDbType.Int).Value = p.prpagtcod;
            cmd.Parameters.Add("@prpprptycod", SqlDbType.Int).Value = p.prpprptycod;
            cmd.Parameters.Add("@prpadd", SqlDbType.VarChar, 200).Value = p.prpadd;
            cmd.Parameters.Add("@prpcrd", SqlDbType.VarChar, 200).Value = p.prpcrd;
            cmd.Parameters.Add("@prpsalsts", SqlDbType.Char).Value = p.prpsalsts;
            cmd.Parameters.Add("@prpdsc", SqlDbType.NVarChar,2000).Value = p.prpdsc;
            cmd.Parameters.Add("@prpprc", SqlDbType.Float).Value = p.prpprc;
            cmd.Parameters.Add("@prplstdat", SqlDbType.DateTime).Value = p.prplstdat;
            cmd.Parameters.Add("@prpmanpiccod", SqlDbType.Int).Value = p.prpmanpiccod;
            cmd.Parameters.Add("@prpsts", SqlDbType.Char).Value = p.prpsts;
            cmd.Parameters.Add("@r", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
            cmd.ExecuteNonQuery();
            Int32 a = Convert.ToInt32(cmd.Parameters["@r"].Value);
            con.Close();
            cmd.Dispose();
            return a;
        }
        public void Update_Rec(clsprpprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updprp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prpcod", SqlDbType.Int).Value = p.prpcod;
            cmd.Parameters.Add("@prptit", SqlDbType.VarChar, 100).Value = p.prptit;
            cmd.Parameters.Add("@prpagtcod", SqlDbType.Int).Value = p.prpagtcod;
            cmd.Parameters.Add("@prpprptycod", SqlDbType.Int).Value = p.prpprptycod;
            cmd.Parameters.Add("@prpadd", SqlDbType.VarChar, 200).Value = p.prpadd;
            cmd.Parameters.Add("@prpcrd", SqlDbType.VarChar, 200).Value = p.prpcrd;
            cmd.Parameters.Add("@prpsalsts", SqlDbType.Char).Value = p.prpsalsts;
            cmd.Parameters.Add("@prpdsc", SqlDbType.NVarChar, 2000).Value = p.prpdsc;
            cmd.Parameters.Add("@prpprc", SqlDbType.Float).Value = p.prpprc;
            cmd.Parameters.Add("@prplstdat", SqlDbType.DateTime).Value = p.prplstdat;
            cmd.Parameters.Add("@prpmanpiccod", SqlDbType.Int).Value = p.prpmanpiccod;
            cmd.Parameters.Add("@prpsts", SqlDbType.Char).Value = p.prpsts;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(Int32 prpcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delprp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prpcod", SqlDbType.Int).Value = prpcod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clsprpprp> Display_Rec()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispprp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsprpprp> obj = new List<clsprpprp>();

            while (dr.Read())
            {
                clsprpprp k = new clsprpprp();
                k.prpcod = Convert.ToInt32(dr[0]);
                k.prptit = dr[1].ToString();
                k.prpagtcod = Convert.ToInt32(dr[2]);
                k.prpprptycod = Convert.ToInt32(dr[3]);
                k.prpadd = dr[4].ToString();
                k.prpcrd = dr[6].ToString();
                k.prpsalsts = Convert.ToChar(dr[7]);
                k.prpdsc = dr[8].ToString();
                k.prpprc = Convert.ToDouble(dr[9]);
                k.prplstdat = Convert.ToDateTime(dr[10]);
                k.prpmanpiccod = Convert.ToInt32(dr[11]);
                k.prpsts = Convert.ToChar(dr[12]); 
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clsprpprp> Find_Rec(Int32 prpcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findprp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prpcod", SqlDbType.Int).Value = prpcod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsprpprp> obj = new List<clsprpprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clsprpprp k = new clsprpprp();
                k.prpcod = Convert.ToInt32(dr[0]);
                k.prptit = dr[1].ToString();
                k.prpagtcod = Convert.ToInt32(dr[2]);
                k.prpprptycod = Convert.ToInt32(dr[3]);
                k.prpadd = dr[4].ToString();
                k.prpcrd = dr[6].ToString();
                k.prpsalsts = Convert.ToChar(dr[7]);
                k.prpdsc = dr[8].ToString();
                k.prpprc = Convert.ToDouble(dr[9]);
                k.prplstdat = Convert.ToDateTime(dr[10]);
                k.prpmanpiccod = Convert.ToInt32(dr[11]);
                k.prpsts = Convert.ToChar(dr[12]);
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clsprpfet : clscon
    {
        public DataSet dispprpfet(Int32 prpcod)
        {
            SqlDataAdapter adp = new SqlDataAdapter("dispprpfet",con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.Add("@prpcod", SqlDbType.Int).Value = prpcod;
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }
        public void Save_Rec(clsprpfetprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insprpfet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prpfetprpcod", SqlDbType.Int).Value = p.prpfetprpcod;
            cmd.Parameters.Add("@prpfetfetcod", SqlDbType.Int).Value = p.prpfetfetcod;
            cmd.Parameters.Add("@prpfetdsc", SqlDbType.VarChar, 1000).Value = p.prpfetdsc;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Update_Rec(clsprpfetprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updprpfet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prpfetcod", SqlDbType.Int).Value = p.prpfetcod;
            //cmd.Parameters.Add("@prpfetprpcod", SqlDbType.Int).Value = p.prpfetprpcod;
            cmd.Parameters.Add("@prpfetfetcod", SqlDbType.Int).Value = p.prpfetfetcod;
            cmd.Parameters.Add("@prpfetdsc", SqlDbType.VarChar, 1000).Value = p.prpfetdsc;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(clsprpfetprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delprpfet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prpfetcod", SqlDbType.Int).Value = p.prpfetcod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clsprpfetprp> Display_Rec() //This Method Should Be checked before using as dispprpfet is changed
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispprpfet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsprpfetprp> obj = new List<clsprpfetprp>();

            while (dr.Read())
            {
                clsprpfetprp k = new clsprpfetprp();
                k.prpfetcod = Convert.ToInt32(dr[0]);
                k.prpfetprpcod = Convert.ToInt32(dr[1]);
                k.prpfetfetcod = Convert.ToInt32(dr[2]);
                k.prpfetdsc = dr[4].ToString();
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        } 
        public List<clsprpfetprp> Find_Rec(Int32 prpfetcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findprpfet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prpfetcod", SqlDbType.Int).Value = prpfetcod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsprpfetprp> obj = new List<clsprpfetprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clsprpfetprp k = new clsprpfetprp();
                k.prpfetcod = Convert.ToInt32(dr[0]);
                k.prpfetprpcod = Convert.ToInt32(dr[1]);
                k.prpfetfetcod = Convert.ToInt32(dr[2]);
                k.prpfetdsc = dr[4].ToString();
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clsprppic : clscon
    {
        public Int32 Save_Rec(clsprppicprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insprppic", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prppicprpcod", SqlDbType.Int).Value = p.prppicprpcod;
            cmd.Parameters.Add("@prppicfil", SqlDbType.VarChar, 50).Value = p.prppicfil;
            cmd.Parameters.Add("@prppicdsc", SqlDbType.VarChar, 1000).Value = p.prppicdsc;
            cmd.Parameters.Add("@prppicsts", SqlDbType.Char).Value = p.prppicsts;
            cmd.Parameters.Add("@r", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
            cmd.ExecuteNonQuery();
            Int32 a = Convert.ToInt32(cmd.Parameters["@r"].Value);
            con.Close();
            cmd.Dispose();
            return a;
        }
        public void Update_Rec(clsprppicprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updprppic", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prppiccod", SqlDbType.Int).Value = p.prppiccod;
            cmd.Parameters.Add("@prppicdsc", SqlDbType.VarChar, 1000).Value = p.prppicdsc;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(Int32 prppiccod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delprppic", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prppiccod", SqlDbType.Int).Value = prppiccod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clsprppicprp> Display_Rec(Int32 prpcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispprppic", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prpcod", SqlDbType.Int).Value = prpcod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsprppicprp> obj = new List<clsprppicprp>();

            while (dr.Read())
            {
                clsprppicprp k = new clsprppicprp();
                k.prppiccod = Convert.ToInt32(dr[0]);
                k.prppicprpcod = Convert.ToInt32(dr[1]);
                k.prppicfil = dr[2].ToString();
                k.prppicdsc = dr[3].ToString();
                k.prppicsts = Convert.ToChar(dr[4]);
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clsprppicprp> Find_Rec(Int32 prppiccod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findprppic", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prppiccod", SqlDbType.Int).Value = prppiccod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsprppicprp> obj = new List<clsprppicprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clsprppicprp k = new clsprppicprp();
                k.prppiccod = Convert.ToInt32(dr[0]);
                k.prppicprpcod = Convert.ToInt32(dr[1]);
                k.prppicfil = dr[2].ToString();
                k.prppicdsc = dr[3].ToString();
                k.prppicsts = Convert.ToChar(dr[4]);
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clsprpty : clscon
    {
        public void Save_Rec(clsprptyprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insprpty", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prptypnam", SqlDbType.VarChar, 100).Value = p.prptypnam;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Update_Rec(clsprptyprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updprpty", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prptycod", SqlDbType.Int).Value = p.prptycod;
            cmd.Parameters.Add("@prptypnam", SqlDbType.VarChar, 100).Value = p.prptypnam;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(clsprptyprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delprpty", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prptycod", SqlDbType.Int).Value = p.prptycod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clsprptyprp> Display_Rec()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispprpty", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsprptyprp> obj = new List<clsprptyprp>();

            while (dr.Read())
            {
                clsprptyprp k = new clsprptyprp();
                k.prptycod = Convert.ToInt32(dr[0]);
                k.prptypnam = dr[1].ToString();
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clsprptyprp> Find_Rec(Int32 prptycod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findprpty", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@prptycod", SqlDbType.Int).Value = prptycod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsprptyprp> obj = new List<clsprptyprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clsprptyprp k = new clsprptyprp();
                k.prptycod = Convert.ToInt32(dr[0]);
                k.prptypnam = dr[1].ToString();
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }
    public class clsusr : clscon
    {
        public Int32 logincheck(String eml,String pwd, out Char rol)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("logincheck", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@eml", SqlDbType.VarChar, 100).Value = eml;
            cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 100).Value = pwd;
            cmd.Parameters.Add("@cod", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@rol", SqlDbType.Char, 1).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            Int32 cod = Convert.ToInt32(cmd.Parameters["@cod"].Value);
            rol = Convert.ToChar(cmd.Parameters["@rol"].Value);
            con.Close();
            cmd.Dispose();
            return cod;
        }
        public Int32 Save_Rec(clsusrprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("insusr", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@usreml", SqlDbType.VarChar, 100).Value = p.usreml;
            cmd.Parameters.Add("@usrpwd", SqlDbType.VarChar, 100).Value = p.usrpwd;
            cmd.Parameters.Add("@usrregdat", SqlDbType.DateTime).Value = p.usrregdat;
            cmd.Parameters.Add("@usrrol", SqlDbType.Char).Value = p.usrrol;
            cmd.Parameters.Add("@r", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
            cmd.ExecuteNonQuery();
            Int32 usrcod = Convert.ToInt32(cmd.Parameters["@r"].Value);
            con.Close();
            cmd.Dispose();
            return usrcod;
        }
        public void Update_Rec(clsusrprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updusr", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@usrcod", SqlDbType.Int).Value = p.usrcod;
            cmd.Parameters.Add("@usreml", SqlDbType.VarChar, 100).Value = p.usreml;
            cmd.Parameters.Add("@usrpwd", SqlDbType.VarChar, 100).Value = p.usrpwd;
            cmd.Parameters.Add("@usrregdat", SqlDbType.DateTime).Value = p.usrregdat;
            cmd.Parameters.Add("@usrrol", SqlDbType.Char).Value = p.usrrol;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public void Delete_Rec(clsusrprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("delusr", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@usrcod", SqlDbType.Int).Value = p.usrcod;
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }
        public List<clsusrprp> Display_Rec()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("dispusr", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsusrprp> obj = new List<clsusrprp>();

            while (dr.Read())
            {
                clsusrprp k = new clsusrprp();
                k.usrcod = Convert.ToInt32(dr[0]);
                k.usreml = dr[1].ToString();
                k.usrpwd = dr[2].ToString();
                k.usrregdat = Convert.ToDateTime(dr[3]);
                k.usrrol = Convert.ToChar(dr[4]);
                obj.Add(k);
            }

            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
        public List<clsusrprp> Find_Rec(Int32 usrcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("findusr", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@usrcod", SqlDbType.Int).Value = usrcod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsusrprp> obj = new List<clsusrprp>();

            if (dr.HasRows)
            {
                dr.Read();
                clsusrprp k = new clsusrprp();
                k.usrcod = Convert.ToInt32(dr[0]);
                k.usreml = dr[1].ToString();
                k.usrpwd = dr[2].ToString();
                k.usrregdat = Convert.ToDateTime(dr[3]);
                k.usrrol = Convert.ToChar(dr[4]);
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;
        }
    }

    public class misc
    {
        public static void showMessageAndRedirect(String MyMessage,String pageName)
        {
            //string MyMessage = "Redirecting you to the start page...";
            string ScriptString = "alert('" + MyMessage + ".');window.open('"+pageName+"','_self');";

            System.Web.UI.Page page = HttpContext.Current.Handler as System.Web.UI.Page;
            page.ClientScript.RegisterStartupScript(typeof(System.Web.UI.Page), "ClientScript", ScriptString, true);
        }
    }

}