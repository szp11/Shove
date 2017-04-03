﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;

public partial class Lottery_BuyLCBQC : SitePageBase
{
    public int LotteryID;
    public string LotteryName;
    public int Number = 3;
    public string RepWinNumber;
    public string DZ = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        AjaxPro.Utility.RegisterTypeForAjax(typeof(Lottery_BuyLCBQC), this.Page);
        LotteryID = 15;
        if (!IsPostBack)
        {
            RepNewt.DataSource = GetNews("足彩资讯");
            RepNewt.DataBind();
            RepWinNumber = GetWinNumber(LotteryID);

            RepWin.DataSource = DataCache.GetWinInfo(LotteryID);
            RepWin.DataBind();
            hlAgreement.NavigateUrl = "../Home/Room/BuyProtocol.aspx?LotteryID=" + LotteryID;
            DZ = Shove._Security.Encrypt.UnEncryptString(PF.GetCallCert(), Shove._Web.Utility.GetRequest("DZ"));
        }

    }

    /// <summary>
    /// 获取彩票新闻
    /// </summary>
    /// <returns></returns>
    private DataTable GetNews(string TypeName)
    {
        string sql = @"select top 10 ID,Title,Content,TypeName from V_News where isShow = 1  and [TypeName] = '" + TypeName + "'order by isCommend,ID desc";
        DataTable dt = Shove.Database.MSSQL.Select(sql);
        return dt;
    }

    /// <summary>
    /// 每个彩种的开奖号码
    /// </summary>
    /// <param name="lotteryID"></param>
    /// <returns></returns>
    public string GetWinNumber(int lotteryID)
    {
        DataTable dtIsuses = DataCache.GetWinNumber(lotteryID);

        StringBuilder sb = new StringBuilder();
        if (dtIsuses != null && dtIsuses.Rows.Count > 0)
        {
            foreach (DataRow dr in dtIsuses.Rows)
            {
                sb.AppendLine("<tr>")
               .AppendLine("<td>")
               .AppendLine(dr["Name"].ToString())
               .AppendLine("</td>");

                sb.AppendLine("<td class=\"red\">")
                .AppendLine(dr["WinLotteryNumber"].ToString())
                .AppendLine("</td>")
                .AppendLine("</tr>");
            }
        }
        else
        {
            sb.AppendLine("<tr>")
                 .AppendLine("<td colspan=\"2\" class=\"red\">没有数据显示！")
                 .AppendLine("</td>")
            .AppendLine("</tr>");
        }
        return sb.ToString();
    }



    /// <summary>
    /// 格式化开奖号码
    /// </summary>
    /// <param name="LotteryID"></param>
    /// <param name="winNumber"></param>
    /// <returns></returns>
    private string FormatWinNumber(string winNumber)
    {
        StringBuilder sb = new StringBuilder();

        if (winNumber.Length > 0)
        {
            for (int i = 0; i < winNumber.Length ; i++)
            {
                sb.Append("<span>").Append(winNumber[i]).Append("</span>");
            }
        }

        return sb.ToString();
    }

    /// <summary>
    /// 获取服务器时间
    /// </summary>
    /// <returns></returns>
    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.None)]
    public string GetSysTime()
    {
        DateTime now = Shove._Convert.StrToDateTime(new DAL.Views.V_GetDate().Open("", "", "").Rows[0]["Now"].ToString(), DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));

        return now.ToString("yyyy/MM/dd HH:mm:ss");
    }

    /// <summary>
    /// 获取期信息
    /// </summary>
    /// <param name="LotteryID"></param>
    /// <returns></returns>
    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.None)]
    public string GetIsuseInfo(int LotteryID)
    {
        try
        {
            DataTable dt = DataCache.GetIsusesInfo(LotteryID);
            string strNow = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            //本期期信息
            DataRow[] drCurrIsuse = dt.Select("'" + strNow + "' > StartTime and '" + strNow + "' < EndTime", "EndTime desc");
            //上期期信息（已开奖）
            DataRow[] drPreIsuse = dt.Select("EndTime < '" + strNow + "' and WinLotteryNumber<>''", "EndTime desc");

            if (drCurrIsuse.Length == 0 && drPreIsuse.Length == 0)
            {
                return "";
            }

            if (drCurrIsuse.Length == 0)
            {
                drCurrIsuse = dt.Select("EndTime < '" + strNow + "'", "EndTime desc");
            }

            if (drPreIsuse.Length == 0)
            {
                drPreIsuse = drCurrIsuse;
            }

            //本期
            int IsuseID = Shove._Convert.StrToInt(drCurrIsuse[0]["ID"].ToString(), -1);
            string IsuseName = drCurrIsuse[0]["Name"].ToString();

            int SystemEndAheadMinute = DataCache.LotteryEndAheadMinute[LotteryID];
            DateTime EndTime = Convert.ToDateTime(drCurrIsuse[0]["EndTime"]);
            DateTime SystemEndTime = EndTime.AddMinutes(SystemEndAheadMinute * -1);

            string IsuseEndTime = SystemEndTime.ToString("yyyy/MM/dd HH:mm:ss");
            //END

            //上期
            string LastIsuseName = drPreIsuse[0]["Name"].ToString();
            string LastWinNumber = drPreIsuse[0]["WinLotteryNumber"].ToString().Trim();

            LastWinNumber = FormatWinNumber(LastWinNumber);

            StringBuilder sb = new StringBuilder();

            sb.Append(IsuseID.ToString())
                .Append(",")
                .Append(IsuseName)
                .Append(",")
                .Append(IsuseEndTime)
                .Append("|")
                .Append(LastIsuseName)
                .Append("|")
                .Append(LastWinNumber);

            return sb.ToString();
        }
        catch (Exception e)
        {
            new Log("TWZT").Write(this.GetType() + e.Message);

            return e.Message;
        }
    }

    private string BindWinList(DataTable dt)
    {
        StringBuilder sb = new StringBuilder();

        sb.Append("<tr>")
            .Append("<td width='8%' height='25' bgcolor='#E8E8E8'>")
            .Append("</td>")
            .Append("<td width='31%' bgcolor='#E8E8E8'>")
            .Append("用户名")
            .Append("</td>")
            .Append("<td width='30%' bgcolor='#E8E8E8'>")
            .Append("奖金")
            .Append("</td>")
            .Append("<td width='13%' bgcolor='#E8E8E8'>")
            .Append("跟单")
            .Append("</td>")
            .Append("</tr>");

        int i = 0;

        foreach (DataRow dr in dt.Rows)
        {
            i++;
            string Name = dr["InitiateName"].ToString();
            Name = Name.Length > 5 ? (Name.Substring(0, 4) + "*") : Name;
            sb.Append("<tr><td height='25'><img src='../Home/Room/Images/num_").Append(i.ToString()).Append(".gif'/></td><td class='black12' title='" + dr["InitiateName"].ToString() + "'>")
                .Append("<a href='../Home/Room/Score.aspx?id=" + dr["InitiateUserID"].ToString() + "&LotteryID=" + LotteryID + "'target='_blank'>")
                .Append(Name)
                .Append("</a>")
                .Append("</td><td class='black12'>")
                .Append(Shove._Convert.StrToDouble(dr["Win"].ToString(), 0).ToString("N0"))
        .Append("</td><td class='red12_2'><a href='javascript:;' onclick=\"if(CreateLogin()){followScheme(" + LotteryID + ");$Id('iframeFollowScheme').src='")
                .Append("../Home/Room/FollowFriendSchemeAdd.aspx?LotteryID=")
                .Append(LotteryID.ToString()).Append("&FollowUserID=")
                .Append(dr["InitiateUserID"].ToString()).Append("&FollowUserName=")
               .Append(HttpUtility.UrlEncode(dr["InitiateName"].ToString())).Append("'}\">定制</a></td></tr>");
        }

        return sb.ToString();
    }

    /// <summary>
    /// 购买彩票
    /// </summary>
    /// <param name="_User"></param>
    private void Buy(Users _User)
    {
        string HidIsuseID = Shove._Web.Utility.GetRequest("HidIsuseID");
        string HidIsuseEndTime = Shove._Web.Utility.GetRequest("HidIsuseEndTime");
        string playType = Shove._Web.Utility.GetRequest("playType");
        string CoBuy = Shove._Web.Utility.GetRequest("CoBuy");
        string tb_Share = Shove._Web.Utility.GetRequest("tb_Share");
        string tb_BuyShare = Shove._Web.Utility.GetRequest("tb_BuyShare");
        string tb_AssureShare = Shove._Web.Utility.GetRequest("tb_AssureShare");
        string tb_OpenUserList = Shove._Web.Utility.GetRequest("tb_OpenUserList");
        string tb_Title = Shove._Web.Utility.GetRequest("tb_Title");
        string tb_Description = Shove._Web.Utility.GetRequest("tb_Description");
        string tbSecrecyLevel = Shove._Web.Utility.GetRequest("SecrecyLevel");
        string tb_LotteryNumber = Shove._Web.Utility.FilteSqlInfusion(Request["tb_LotteryNumber"]);
        string tb_hide_SumMoney = Shove._Web.Utility.GetRequest("tb_hide_SumMoney");
        string tb_hide_AssureMoney = Shove._Web.Utility.GetRequest("tb_hide_AssureMoney");
        string tb_hide_SumNum = Shove._Web.Utility.GetRequest("tb_hide_SumNum");
        string HidLotteryID = Shove._Web.Utility.GetRequest("HidLotteryID");
        string tb_Multiple = Shove._Web.Utility.GetRequest("tb_Multiple");
        string tb_SchemeBonusScale = Shove._Web.Utility.GetRequest("tb_SchemeBonusScale");
        string playTypeID = Shove._Web.Utility.GetRequest("tbPlayTypeID");
        string tb_SumMoney = Shove._Web.Utility.GetRequest("tb_SchemeMoney");

        int Price = 2;

        if (tb_Multiple == "")
        {
            tb_Multiple = "1";
        }

        double SumMoney = 0;
        int Share = 0;
        int BuyShare = 0;
        double AssureMoney = 0;
        int Multiple = 0;
        int SumNum = 0;
        short SecrecyLevel = 0;
        int PlayTypeID = 0;
        int LotteryID = 0;
        long IsuseID = 0;
        double SchemeBonusScale = 0;

        try
        {
            SumMoney = double.Parse(tb_hide_SumMoney);
            Share = int.Parse(tb_Share);
            BuyShare = int.Parse(tb_BuyShare);
            AssureMoney = double.Parse(tb_hide_AssureMoney);
            Multiple = int.Parse(tb_Multiple);
            SumNum = int.Parse(tb_hide_SumNum);
            SecrecyLevel = short.Parse(tbSecrecyLevel);
            PlayTypeID = int.Parse(playTypeID);
            LotteryID = int.Parse(HidLotteryID);
            IsuseID = long.Parse(HidIsuseID);
            SchemeBonusScale = double.Parse(tb_SchemeBonusScale);
        }
        catch
        {
            Shove._Web.JavaScript.Alert(this.Page, "输入有错误，请仔细检查。");

            return;
        }

        if (playTypeID != playType)
        {
            SumMoney = double.Parse(tb_SumMoney);
        }

        if ((SumMoney <= 0) || (SumNum < 1 && playTypeID == playType))
        {
            Shove._Web.JavaScript.Alert(this.Page, "输入有错误，请仔细检查。");

            return;
        }

        if (AssureMoney < 0)
        {
            Shove._Web.JavaScript.Alert(this.Page, "输入有错误，请仔细检查。");

            return;
        }

        if (Share < 1)
        {
            Shove._Web.JavaScript.Alert(this.Page, "输入有错误，请仔细检查。");

            return;
        }

        if ((BuyShare == Share) && (AssureMoney == 0))
        {
            Share = 1;
            BuyShare = 1;
        }

        if ((SumMoney / Share) < 1)
        {
            Shove._Web.JavaScript.Alert(this.Page, "每份金额最低不能少于 1 元。");

            return;
        }

        double BuyMoney = BuyShare * (SumMoney / Share) + AssureMoney;

        if (BuyMoney > _User.Balance)
        {
            SaveDataForAliBuy();

            return;
        }

        if (BuyMoney > PF.SchemeMaxBettingMoney)
        {
            Shove._Web.JavaScript.Alert(this.Page, "投注金额不能大于" + PF.SchemeMaxBettingMoney.ToString() + "，谢谢。");

            return;
        }

        if (Multiple > 999)
        {
            Shove._Web.JavaScript.Alert(this.Page, "投注倍数不能大于 999 倍，谢谢。");

            return;
        }
        //佣金比例的计算

        if (!(SchemeBonusScale >= 0 || SchemeBonusScale <= 10))
        {
            Shove._Web.JavaScript.Alert(this.Page, "佣金比例只能在0~10之间");

            return;
        }

        if (SchemeBonusScale.ToString().IndexOf("-") > -1 || SchemeBonusScale.ToString().IndexOf(".") > -1)
        {
            Shove._Web.JavaScript.Alert(this.Page, "佣金比例输入有误");

            return;
        }

        SchemeBonusScale = SchemeBonusScale / 100;

        string LotteryNumber = tb_LotteryNumber;

        if (playTypeID == playType)
        {
            if (LotteryNumber[LotteryNumber.Length - 1] == '\n')
            {
                LotteryNumber = LotteryNumber.Substring(0, LotteryNumber.Length - 1);
            }

            #region 对彩票号码进行分析，判断注数

            SZJS.Lottery slsLottery = new SZJS.Lottery();
            string[] t_lotterys = SplitLotteryNumber(LotteryNumber);

            if ((t_lotterys == null) || (t_lotterys.Length < 1))
            {
                Shove._Web.JavaScript.Alert(this.Page, "选号发生异常，请重新选择号码投注，谢谢。(-694)");

                return;
            }

            int ValidNum = 0;

            foreach (string str in t_lotterys)
            {
                string Number = slsLottery[LotteryID].AnalyseScheme(str, PlayTypeID);

                if (string.IsNullOrEmpty(Number))
                {
                    continue;
                }

                string[] str_s = Number.Split('|');

                if (str_s == null || str_s.Length < 1)
                {
                    continue;
                }

                ValidNum += Shove._Convert.StrToInt(str_s[str_s.Length - 1], 0);
            }

            if (ValidNum != SumNum)
            {
                Shove._Web.JavaScript.Alert(this.Page, "选号发生异常，请重新选择号码投注，谢谢。");

                return;
            }

            #endregion
        }

        string ReturnDescription = "";

        if (DateTime.Now >= Shove._Convert.StrToDateTime(HidIsuseEndTime.Replace("/", "-"), DateTime.Now.AddDays(-1).ToString()))
        {
            Shove._Web.JavaScript.Alert(this.Page, "本期投注已截止，谢谢。");

            return;
        }

        if (playType == playTypeID && Price * SumNum * Multiple != SumMoney)
        {
            Shove._Web.JavaScript.Alert(this.Page, "输入有错误，请仔细检查。");

            return;
        }

        long SchemeID = _User.InitiateScheme(IsuseID, PlayTypeID, tb_Title.Trim() == "" ? "(无标题)" : tb_Title.Trim(), tb_Description.Trim(), LotteryNumber, "", Multiple, SumMoney, AssureMoney, Share, BuyShare, tb_OpenUserList.Trim(), short.Parse(SecrecyLevel.ToString()), SchemeBonusScale, ref ReturnDescription);
        if (SchemeID < 0)
        {
            PF.GoError(ErrorNumber.Unknow, ReturnDescription, this.GetType().FullName + "(-755)");

            return;
        }

        Shove._Web.Cache.ClearCache("Home_Room_CoBuy_BindDataForType" + IsuseID.ToString());
        Shove._Web.Cache.ClearCache("Home_Room_SchemeAll_BindData" + IsuseID.ToString());

        if (SumMoney > 50 && Share > 1)
        {
            Shove._Web.Cache.ClearCache("Home_Room_JoinAllBuy_BindData");
        }

        Response.Redirect("../Home/Room/UserBuySuccess.aspx?LotteryID=" + LotteryID.ToString() + "&&Money=" + BuyMoney.ToString() + "&SchemeID=" + SchemeID.ToString() + "");

        return;
    }

    /// <summary>
    ///合买热单推荐
    /// </summary>
    /// <param name="_User"></param>
    /// 
    private string GetWinListHM(int LotteryID, int Number)
    {
        string Key = "Home_Room_Buy_ZC_GetWinListHM_" + LotteryID.ToString() + Number.ToString();
        DataTable dt = Shove._Web.Cache.GetCacheAsDataTable(Key);
        dt = null;

        if (dt == null)
        {
            string sql = "";

            if (LotteryID == 1)
            {
                if (Number == 1)
                {
                    sql = "select top 8 b.ID,IsuseID,LotteryID ,InitiateUserID ,InitiateName, Money ,Schedule from T_SchemeSupperCobuy a inner join V_Schemes b on a.SchemeID = b.ID and TypeState = 2 and IsuseID=(select top 1 ID from T_Isuses where LotteryID =" + LotteryID.ToString() + " and GETDATE() between StartTime and EndTime and Schedule<100 order by IsuseID desc) and (PlayTypeID = 103 or  PlayTypeID = 104) and QuashStatus = 0 order by AtTopStatus desc,Money desc";
                }
                else
                {
                    sql = "select top 8 b.ID,IsuseID,LotteryID ,InitiateUserID ,InitiateName, Money ,Schedule from T_SchemeSupperCobuy a inner join V_Schemes b on a.SchemeID = b.ID and TypeState = 2 and IsuseID=(select top 1 ID from T_Isuses where LotteryID =" + LotteryID.ToString() + " and GETDATE() between StartTime and EndTime and Schedule<100 order by IsuseID desc) and (PlayTypeID = 101 or  PlayTypeID = 102) and QuashStatus = 0 order by AtTopStatus desc,Money desc";
                }
            }
            else
            {
                sql = "select top 8 b.ID,IsuseID,LotteryID ,InitiateUserID ,InitiateName, Money ,Schedule from T_SchemeSupperCobuy a inner join V_Schemes b on a.SchemeID = b.ID and TypeState = 2 and IsuseID=(select top 1 ID from T_Isuses where LotteryID =" + LotteryID.ToString() + " and GETDATE() between StartTime and EndTime and Schedule<100 order by IsuseID desc) and QuashStatus = 0 order by AtTopStatus desc,Money desc";
            }

            dt = Shove.Database.MSSQL.Select(sql);

            if (dt == null)
            {
                new Log("SLSJX").Write("GetWinListHM方法出错!");

                return "";
            }

            Shove._Web.Cache.SetCache(Key, dt, 600);
        }

        StringBuilder sb = new StringBuilder();
        string Name;
        foreach (DataRow dr in dt.Rows)
        {
            Name = dr["InitiateName"].ToString();
            Name = Name.Length > 5 ? (Name.Substring(0, 4) + "*") : Name;
            sb.Append("<tr><td class='black12' title='" + dr["InitiateName"].ToString() + "'>")
                .Append("<a href='../Home/Room/Score.aspx?id=" + dr["InitiateUserID"].ToString() + "&LotteryID=" + LotteryID + "'target='_blank'>")
                .Append(Name)
                .Append("</a>")
                .Append("</td><td class='black12'>")
                .Append(Shove._Convert.StrToDouble(dr["Money"].ToString(), 0).ToString("N0"))
                .Append("</td><td class='black12'>")
                .Append(Shove._Convert.StrToDouble(dr["Schedule"].ToString(), 0))
                .Append("%")
        .Append("</td><td class='red12_2'><a target='_blank' href='")
                .Append("../Home/Room/Scheme.aspx?LotteryID=")
                .Append(LotteryID.ToString()).Append("&ID=")
                .Append(dr["ID"].ToString())
               .Append("'}\">入伙</a></td></tr>");
        }

        return sb.ToString();
    }

    /// <summary>
    /// 分析方案
    /// </summary>
    /// <param name="Content"></param>
    /// <param name="LotteryID"></param>
    /// <param name="PlayTypeID"></param>
    /// <returns></returns>
    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public string AnalyseScheme(string Content, string LotteryID, int PlayTypeID)
    {
        string Result = new SZJS.Lottery()[Shove._Convert.StrToInt(LotteryID, 0)].AnalyseScheme(Content, PlayTypeID);

        return Result.Trim();
    }

    /// <summary>
    /// 余额不足时，保存数据
    /// </summary>
    private void SaveDataForAliBuy()
    {
        string HidIsuseID = Shove._Web.Utility.GetRequest("HidIsuseID");
        string HidIsuseEndTime = Shove._Web.Utility.GetRequest("HidIsuseEndTime");
        string playType = Shove._Web.Utility.GetRequest("playType");
        string Cobuy = Shove._Web.Utility.GetRequest("Cobuy");
        string tb_Share = Shove._Web.Utility.GetRequest("tb_Share");
        string tb_BuyShare = Shove._Web.Utility.GetRequest("tb_BuyShare");
        string tb_AssureShare = Shove._Web.Utility.GetRequest("tb_AssureShare");
        string tb_OpenUserList = Shove._Web.Utility.GetRequest("tb_OpenUserList");
        string tb_Title = Shove._Web.Utility.GetRequest("tb_Title");
        string tb_Description = Shove._Web.Utility.GetRequest("tb_Description");
        string tbSecrecyLevel = Shove._Web.Utility.GetRequest("SecrecyLevel");
        string tb_LotteryNumber = Shove._Web.Utility.FilteSqlInfusion(Request["tb_LotteryNumber"]);
        string tb_hide_SumMoney = Shove._Web.Utility.GetRequest("tb_hide_SumMoney");
        string tb_hide_AssureMoney = Shove._Web.Utility.GetRequest("tb_hide_AssureMoney");
        string tb_hide_SumNum = Shove._Web.Utility.GetRequest("tb_hide_SumNum");
        string HidLotteryID = Shove._Web.Utility.GetRequest("HidLotteryID");
        string tb_Multiple = Shove._Web.Utility.GetRequest("tb_Multiple");
        string playTypeID = Shove._Web.Utility.GetRequest("tbPlayTypeID");
        string tb_SumMoney = Shove._Web.Utility.GetRequest("tb_SchemeMoney");

        if (tb_Multiple == "")
        {
            tb_Multiple = "1";
        }

        DAL.Tables.T_AlipayBuyTemp tbp = new DAL.Tables.T_AlipayBuyTemp();

        tbp.SiteID.Value = 1;
        tbp.UserID.Value = -1;
        if (playTypeID == playType)
        {
            tbp.Money.Value = tb_hide_SumMoney;
        }
        else
        {
            tbp.Money.Value = tb_SumMoney;
        }

        tbp.HandleResult.Value = 0;
        tbp.IsCoBuy.Value = Cobuy == "2";
        tbp.LotteryID.Value = HidLotteryID;
        tbp.IsuseID.Value = HidIsuseID;
        tbp.PlayTypeID.Value = playType;
        tbp.Title.Value = tb_Title;
        tbp.Description.Value = tb_Description;
        tbp.LotteryNumber.Value = tb_LotteryNumber;
        tbp.UpdateloadFileContent.Value = "";
        tbp.Multiple.Value = tb_Multiple;
        tbp.BuyMoney.Value = tb_BuyShare;
        tbp.SumMoney.Value = tb_hide_SumMoney;
        tbp.AssureMoney.Value = tb_hide_AssureMoney;
        tbp.Share.Value = tb_Share;
        tbp.BuyShare.Value = tb_BuyShare;
        tbp.AssureShare.Value = tb_AssureShare;
        tbp.OpenUsers.Value = tb_OpenUserList;
        tbp.SecrecyLevel.Value = tbSecrecyLevel;
        tbp.Number.Value = Number;

        long Result = tbp.Insert();

        if (Result < 0)
        {
            new Log("System").Write("T_AlipayBuyTemp 数据库读写错误。");
        }

        Shove._Web.JavaScript.Alert(this.Page, "您的账户余额不足，请先充值，谢谢。", "../Home/Room/OnlinePay/Default.aspx?BuyID=" + Result.ToString());
    }


    /// <summary>
    /// 获取球赛信息
    /// </summary>
    /// <param name="LotteryID"></param>
    /// <param name="IsuseID"></param>
    /// <returns></returns>
    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.None)]
    public string GetAddone(int LotteryID, string IsuseID)
    {
        string t_str = "";

        DataTable dt = Shove._Web.Cache.GetCacheAsDataTable("DataCache_LCBQC");

        if (dt == null || dt.Rows.Count == 0)
        {
            dt = new DAL.Tables.T_IsuseForLCBQC().Open(" top 6 * ", "IsuseID = " + IsuseID, "[No]");

            if ((dt == null) || (dt.Rows.Count != 6))
            {
                return "";
            }

            Shove._Web.Cache.SetCache("DataCache_LCBQC", dt, 300);
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            t_str += dt.Rows[i]["HostTeam"].ToString().Trim() + "," + dt.Rows[i]["QuestTeam"].ToString().Trim() + "," + dt.Rows[i]["DateTime"].ToString();
            if (i < dt.Rows.Count - 1)
                t_str += ";";
        }

        return t_str;
    }

    private string[] SplitLotteryNumber(string Number)
    {
        string[] s = Number.Split('\n');
        if (s.Length == 0)
            return null;
        for (int i = 0; i < s.Length; i++)
            s[i] = s[i].Trim();
        return s;
    }

  

    /// <summary>
    /// 获得佣金比例
    /// </summary>
    /// <returns>返回佣金比例</returns>
    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
    public string GetSchemeBonusScalec(int lotteryId)
    {
        string bScalec;
        //获得站点选项中的佣金比率
        DataTable dt = new DAL.Tables.T_Sites().Open("Opt_InitiateSchemeBonusScale,Opt_InitiateSchemeLimitLowerScaleMoney,Opt_InitiateSchemeLimitLowerScale,Opt_InitiateSchemeLimitUpperScaleMoney,Opt_InitiateSchemeLimitUpperScale", "", "");
        //把佣金比率换成整数
        bScalec = (Shove._Convert.StrToDouble(dt.Rows[0]["Opt_InitiateSchemeBonusScale"].ToString(), 0) * 100).ToString();

        //发起方案条件
        string Opt_InitiateSchemeLimitLowerScaleMoney = (Shove._Convert.StrToDouble(dt.Rows[0]["Opt_InitiateSchemeLimitLowerScaleMoney"].ToString(), 100)).ToString();
        string Opt_InitiateSchemeLimitLowerScale = (Shove._Convert.StrToDouble(dt.Rows[0]["Opt_InitiateSchemeLimitLowerScale"].ToString(), 0.2)).ToString();
        string Opt_InitiateSchemeLimitUpperScaleMoney = (Shove._Convert.StrToDouble(dt.Rows[0]["Opt_InitiateSchemeLimitUpperScaleMoney"].ToString(), 10000)).ToString();
        string Opt_InitiateSchemeLimitUpperScale = (Shove._Convert.StrToDouble(dt.Rows[0]["Opt_InitiateSchemeLimitUpperScale"].ToString(), 0.05)).ToString();

        string lotteryName = DataCache.Lotteries[lotteryId];
        int number = 0;

        return bScalec + "|" + Opt_InitiateSchemeLimitLowerScaleMoney + "|" + Opt_InitiateSchemeLimitLowerScale + "|" + Opt_InitiateSchemeLimitUpperScaleMoney + "|" + Opt_InitiateSchemeLimitUpperScale + "|" + lotteryId.ToString() + "|" + lotteryName + "|" + number.ToString();


    }

    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.None)]
    public string GetZCExpertList(int lotteryID)
    {
        DataTable dtExpert = DataCache.GetZCExpertList(lotteryID);

        StringBuilder sb = new StringBuilder();

        if (dtExpert != null && dtExpert.Rows.Count > 0)
        {
            int i = 1;
            foreach (DataRow dr in dtExpert.Rows)
            {
                string Name = dr["UserName"].ToString();
                Name = Name.Length > 6 ? (Name.Substring(0, 5) + "*") : Name;
                sb.AppendLine("<tr align=\"center\">")
                .AppendLine("<td  height=\"22\"  bgcolor=\"#FFFFFF\" class=\"black12\"  title='" + dr["UserName"].ToString() + "'>")
                .Append("<a href='../Home/Room/Score.aspx?id=")
                .Append(dr["UserID"].ToString())
                .Append("&LotteryID=")
                .Append(lotteryID + "' target='_blank'>")
                .AppendLine(Name)
                .Append("</a>")
                .AppendLine("</td>")
                .AppendLine("<td  align=\"center\" bgcolor=\"#FFFFFF\" class=\"black12\">")
                .AppendLine(dr["LotteryName"].ToString())
                .Append("</td>")
                .Append("<td bgcolor=\"#FFFFFF\" class='red12_2'><a href='javascript:;' onclick=\"if(CreateLogin()){followScheme(" + LotteryID + ");$Id('iframeFollowScheme').src='")
                .Append("../Home/Room/FollowFriendSchemeAdd.aspx?LotteryID=")
                .Append(lotteryID).Append("&FollowUserID=")
                .Append(dr["UserID"]).Append("&FollowUserName=")
                .Append(dr["UserName"].ToString()).Append("'}\">定制</a></td></tr>");

                if (i % 10 == 0 && i != dtExpert.Rows.Count)
                {
                    sb.Append("|");
                }

                i++;

            }

        }
        else
        {
            sb.AppendLine("<tr>")
             .AppendLine("<td colspan=\"3\" height=\"22\" align=\"center\" bgcolor=\"#FFFFFF\" class=\"blue12\">")
             .AppendLine("<span style=\"color:red;\">暂无数据</span>")
             .AppendLine("</td>");
        }

        return sb.ToString();
    }

    /// <summary>
    /// 获取资讯信息
    /// </summary>
    /// <param name="LotteryID"></param>
    /// <returns></returns>
    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.None)]
    public string GetNewsInfo(int LotteryID)
    {
        return DataCache.GetLotteryNews(LotteryID);
    }
    protected void btn_OK_Click(object sender, EventArgs e)
    {
        if (!PF.IsSystemRegister())
        {
            PF.GoError(ErrorNumber.DataReadWrite, "请联系网站管理员输入软件序列号", this.GetType().BaseType.FullName);
            return;
        }
        Buy(_User);
    }
}
