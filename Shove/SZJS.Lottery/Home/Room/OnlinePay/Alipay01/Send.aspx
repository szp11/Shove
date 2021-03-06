﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Send.aspx.cs" Inherits="Home_Room_OnlinePay_Alipay01_Send" %>

<%@ Register Assembly="Shove.Web.UI.4 For.NET 3.5" Namespace="Shove.Web.UI" TagPrefix="ShoveWebUI" %>
<%@ Register Src="../../../../UserControls/Head.ascx" TagName="Head" TagPrefix="uc1" %>
<%@ Register Src="../../UserControls/UserMyIcaile.ascx" TagName="UserMyIcaile" TagPrefix="uc2" %>
<%@ Register Src="../../UserControls/WebFoot.ascx" TagName="WebFoot" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>网上支付，手机卡充值-<%=_Site.Name %>-买彩票，就上<%=_Site.Name %>！</title>
    <meta name="description" content="<%=_Site.Name %>彩票网是一家服务于中国彩民的互联网彩票合买代购交易平台，涉及中国彩票彩种最全的网站，包含双色球、时时乐、时时彩、足彩等众多彩种的实时开奖信息、图表走势、分析预测等。" />
    <meta name="keywords" content="<%=_Site.Name %>提供网银充值，卡密充值，支付宝支付，财付通支付" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="../../Style/common.css" rel="stylesheet" type="text/css" />
    <link href="../../Style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../../Style/home.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="../../../../favicon.ico" />

    <script src="../../../../JavaScript/jquery-1.4.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">
        function Choose(obj) {
                document.getElementById("tdmeshwork").style.backgroundImage = "url('../../Images/admin_qh_100_1.jpg')";
                document.getElementById("divrad007Ka").style.display = "none";
                document.getElementById("tbrow1").style.display = "block";
                document.getElementById("divbank").style.display = "block"
                document.getElementById("tdtell").style.display = "none";
                document.getElementById("tdname").style.display = "block";
                document.getElementById("radZFB").checked = true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hdBankCode" runat="server" />
    <uc1:Head ID="Head2" runat="server" />
    <div class="wrap">
        <uc2:UserMyIcaile ID="UserMyIcaile1" runat="server" />
        <div class="rights">
        <div class="jilua padd">
<div id="con">
<ul id="tags">
  <li class="selectTag"><a onclick="selectTag('tagContent0',this)" 
  href="#">网上支付</a></li>
  </ul>             
<div id="tagContent">
<div class="tagContent selectTag" id="tagContent0">
<table>
 <tr><td height="30" colspan="2" bgcolor="#ffede3" style="padding-left: 20px; text-align:left">
                            您好，<span style="font-weight: bold; color: Red"><%=UserName%></span>！您当前帐户余额为：￥<span
                                style="font-weight: bold; color: Red"><%= Balance%>
                            </span>元
                        </td>
                    </tr>
</table>
<asp:Panel ID="pnlFirst" runat="server" Visible="true">
<table>

                        <tr id="tdname">
                            <td >
                                <span style="color: Red">*</span>充值金额：
                            </td>
                            <td width="88%" align="left" bgcolor="#FFFFFF" style="padding-left: 10px;">
                                <table width="100%" id="nottd">
                                    <tr>
                                        <td width="23%" >
                                            <label>
                                                <asp:TextBox ID="PayMoney" runat="server" MaxLength="8" CssClass="input_txt" onblur="CheckMultiple(this);"
                                                    Text="5"></asp:TextBox>
                                            </label>
                                        </td>
                                        <td width="77%"  style="text-align:left">
                                            元，（<span>网上充值免手续费</span>，存入金额最少5元）
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="right" valign="top" bgcolor="#FFFFFF" style="padding-top: 10px;">
                                <span style="color: Red">*</span>充值方式：
                            </td>
                            <td height="30" align="left" valign="top" bgcolor="#FFFFFF" style="padding: 10px 0px 10px 10px;" >
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tbrow1">
                                    <tr>
                                        
                                        <td>
                                            <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="26">
                                                        <label>
                                                            <asp:RadioButton ID="radZFB" Checked="true" GroupName="payWay" runat="server" />
                                                        </label>
                                                    </td>
                                                    <td width="124" height="28">
                                                        <img src="images/bank_logo/logo_zfb.gif" width="121" height="27" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="26">
                                                        <label>
                                                            <asp:RadioButton ID="radyeepay"  GroupName="payWay" runat="server" />
                                                        </label>
                                                    </td>
                                                    <td width="124" height="28">
                                                        <img src="images/bank_logo/logo_yeepay.gif" width="121" height="27" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="26">
                                                        <label>
                                                            <asp:RadioButton ID="rad99Bill" Enabled="false"  GroupName="payWay" runat="server" />
                                                        </label>
                                                    </td>
                                                    <td width="124" height="28">
                                                        <img src="images/bank_logo/logo_99Bill.gif" width="121" height="27" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="26">
                                                        <label>
                                                            <asp:RadioButton ID="radCCB" GroupName="payWay" runat="server" />
                                                        </label>
                                                    </td>
                                                    <td width="124" height="28">
                                                        <img src="images/bank_logo/logo_jsyh.gif" width="121" height="27" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <div id="divbank">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radICBCB2C" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_hsyh.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td height="40">
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radCMB" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_zsyhj.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radBOCB2C" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_zgyh.gif" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radABC" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_nyyh.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="40">
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radCOMM" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_jtyh.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radSPDB" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_shpd.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radGDB" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_gdfzyh.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radGDYH" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_gdyh.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="40">
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radCIB" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_xyyh.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radSDB" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_szfzyh.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radCMBC" runat="server" GroupName="PayWay" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_zgms.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="25%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="26">
                                                            <label>
                                                                <asp:RadioButton ID="radBCCBEB" GroupName="payWay" runat="server" />
                                                            </label>
                                                        </td>
                                                        <td width="124" height="28">
                                                            <img src="images/bank_logo/logo_bjyh.gif" width="121" height="27" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 15px;" id="nottd">
                                    <tr>
                                        <td>
                                            <ShoveWebUI:ShoveConfirmButton ID="btnNext" Style="cursor: pointer;" runat="server"
                                                Width="109px" Height="33px" CausesValidation="False" BackgroupImage="images/bt_next.jpg"
                                                BorderStyle="None" OnClick="btnNext_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlSecond" runat="server" Visible="false">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C0DBF9" style="margin-top: 15px;">
                        <tr>
                            <td height="10" colspan="2" align="right" bgcolor="#FFFFFF" >
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td width="12%" height="30" align="right" bgcolor="#FFFFFF" >
                                <span">*</span>您的充值金额：
                            </td><td width="70%" align="left" bgcolor="#FFFFFF"  style="padding-left: 10px;">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="nottd">
                                    <tr>
                                        <td style="text-align:left; font-size:14px; font-weight:bold">
                                            <span >
                                                <asp:Label ID="lbPayMoney" runat="server"></asp:Label></span>元
                                        </td>
                                        <td width="77%" align="left" bgcolor="#FFFFFF" >
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="right" valign="top" bgcolor="#FFFFFF"  style="padding-top: 10px;">
                                <span class="red12">*</span>选择支付方式：
                            </td>
                            <td height="30" align="left" valign="top" bgcolor="#FFFFFF" style="padding: 10px 0px 10px 10px;">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="nottd">
                                    <tr>
                                        <td style="text-align:left">
                                            <img id="BankImg" src="Images/bank_logo/logo_<%= BankName%>.gif" width="121" height="27" />
                                        </td>
                                        <td width="76%">
                                            <asp:LinkButton ID="lbReturn" runat="server" Text="返回重新选择支付方式" OnClick="lbReturn_Click"></asp:LinkButton></td></tr></table><table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 15px;" id="nottd">
                                    <tr >
                                        <td style="text-align:left" >
                                            <asp:HyperLink ID="hlOK" runat="server" Target="_blank"><img src="images/bt_wy.jpg" border="0" /></asp:HyperLink></td><td  style="text-align:left">将会在新窗口中打开支付页面。</td></tr><tr>
                                        <td colspan="2" style="color:Red">
                                            <span style="color: #000000;font-size:13px; font-weight: normal">注：为了及时到帐，充值完成后【</span>请不要关闭网银或支付窗口<span
                                                style="color: #000000;font-size:13px; font-weight: normal">】 ，系统会自动跳转回本网站！</span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>              
</div>
</div></div>

  <script type="text/javascript">
      function selectTag(showContent, selfObj) {
          // 操作标签
          var tag = document.getElementById("tags").getElementsByTagName("li");
          var taglength = tag.length;
          for (i = 0; i < taglength; i++) {
              tag[i].className = "";
          }
          selfObj.parentNode.className = "selectTag";
          // 操作内容
          for (i = 0; j = document.getElementById("tagContent" + i); i++) {
              j.style.display = "none";
          }
          document.getElementById(showContent).style.display = "block";


      }
</script>

</div>
        
        </div>
    </div>
    <uc3:WebFoot ID="WebFoot1" runat="server" />
    </form>
</body>
</html>

<script type="text/javascript">
		<!--
    function CheckMultiple(sender) {
        var money = StrToFloat(sender.value);
        sender.value = money;

        if (money < 5) {
            if (window.location.href.indexOf(".wzwbw.") > 0)//测试:可以冲小于2元
            {
                return;
            }

            if (confirm("充值金额不正确，按“确定”重新输入，按“取消”自动更正为 5 元，请选择。")) {
                sender.focus();
                return;
            }
            else {
                sender.value = 5;
            }
        }
    }

    function StrToFloat(str) {
        var NewStr = "";
        for (var i = 0; i < str.length; i++) {
            if (str.charAt(i) != "," && str.charAt(i) != " ")
                NewStr += str.charAt(i);
        }

        if (NewStr == "")
            return 0;

        var f = parseFloat(NewStr);
        if (isNaN(f))
            return 0;

        return f;
    }
		-->
</script>

