﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SSQ_HL.aspx.cs" Inherits="Home_TrendCharts_SSQ_SSQ_HL" %>

<%@ Register Src="../../Home/Room/UserControls/WebFoot.ascx" TagName="WebFoot" TagPrefix="uc1" %>
<%@ Register Src="../../UserControls/Head.ascx" TagName="Head" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>红蓝球走势图-双色球走势图-彩票走势图表和数据分析－<%=_Site.Name %></title>
    <meta name="keywords" content="双色球  双色球走势图-双色球 红蓝球走势图" />
    <meta name="description" content="双色球  双色球走势图-双色球 红蓝球走势图、彩票走势图表和数据分析。" />
      <link href="../../Home/Room/Style/common.css" rel="stylesheet" type="text/css" />
    <link href="../../Home/Room/Style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../../Home/Room/Style/zbuy.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="../../favicon.ico" />
<link href="../../Home/Room/Style/zst.css" rel="stylesheet" type="text/css" />
    <script src="../../JavaScript/jquery-1.4.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
<!--
        function ShowImg(e) {
            if (e.innerHTML == "&nbsp;") {
                e.innerHTML = "<img src='../../Images/1[1].gif' />";
            }
            else {
                e.innerHTML = "&nbsp;";
            }
        }

        function ShowBlueImg(e) {
            if (e.innerHTML == "&nbsp;") {
                e.innerHTML = "<img src='../../Images/3[1].gif' />";
            }
            else {
                e.innerHTML = "&nbsp;";
            }
        }
//-->
    </script>

   
    <script language="javascript" type="text/javascript">
        function DrawLine(ojbCurrnetTd, ojbPrevTd, color) {
            var ax = getCPX(document.getElementById(ojbCurrnetTd));
            var ay = getCPY(document.getElementById(ojbCurrnetTd));
            var bx = getCPX(document.getElementById(ojbPrevTd));
            var by = getCPY(document.getElementById(ojbPrevTd));

//            var jgdiv1 = new jsGraphics("div2");

//            jgdiv1.setColor(color);
//            jgdiv1.setStroke(2);
//            jgdiv1.drawLine(ax, ay, bx, by);
//            jgdiv1.paint();
        }

        function getTop(obj) {
            var _offset = obj.offsetTop;
            if (obj.offsetParent != null) _offset += getTop(obj.offsetParent);
            return _offset;
        }

        function getLeft(obj) {
            var _offset = obj.offsetLeft;
            if (obj.offsetParent != null) _offset += getLeft(obj.offsetParent);
            return _offset;
        }

        function getCPX(obj) {
            return getLeft(obj) + obj.offsetWidth / 2;
        }

        function getCPY(obj) {
            return getTop(obj) + obj.offsetHeight / 2;
        }
        window.onresize = function RedrawLine() {
            //_removeDiv();

            DrawLines();
        }
    </script>

</head>

<body>
    <form id="form1" runat="server">
      <uc2:Head ID="Head2" runat="server" />
<div class="wrap">
<div class="zst_top">
<h1>红蓝球走势图</h1>
<ul>
<li> <span>起始期数：</span>
<asp:TextBox ID="tb1" runat="server" CssClass="input" ></asp:TextBox>
<span>至</span>
<asp:TextBox ID="tb2" runat="server" CssClass="input" ></asp:TextBox>
<asp:Button ID="Button1" runat="server" Text="搜索" OnClick="btnSearch_Click" CssClass="zst_btn" />
<asp:Button ID="Button2" runat="server" Text="显示30期" OnClick="btnTop30_Click" CssClass="zst_btn"/>
<asp:Button ID="Button3" runat="server" Text="显示50期" OnClick="btnTop50_Click" CssClass="zst_btn"/>
<asp:Button ID="Button4" runat="server" Text="显示100期" OnClick="btnTop100_Click" CssClass="zst_btn"/>
</li>
<div class="clear"></div>
<li>

<asp:Label ID="lbAd" runat="server"></asp:Label> <asp:Label ID="lbAd1" runat="server"></asp:Label> <asp:Label ID="lbAd2" runat="server"></asp:Label>
</li>
</ul>
</div> 
</div>
    <div class="wrap">
        <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false"
            FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" align="center"
            bordercolorlight="#808080" bordercolordark="#ffe8eb" RowStyle-HorizontalAlign="Center"
            CellPadding="0" ShowHeader="true" OnRowCreated="GridView1_RowCreated" ShowFooter="true">
            <Columns>
                <asp:BoundField DataField="Isuse" HeaderText="期号">
                    <ItemStyle CssClass="Isuse" />
                </asp:BoundField>
                <asp:BoundField DataField="B_1" HeaderText="01">
                    <ItemStyle CssClass="itemstyle1" Height="35px" />
                </asp:BoundField>
                <asp:BoundField DataField="B_2" HeaderText="02">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_3" HeaderText="03">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_4" HeaderText="04">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_5" HeaderText="05">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_6" HeaderText="06">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_7" HeaderText="07">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_8" HeaderText="08">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_9" HeaderText="09">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_10" HeaderText="10">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_11" HeaderText="11">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_12" HeaderText="12">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_13" HeaderText="13">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_14" HeaderText="14">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_15" HeaderText="15">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_16" HeaderText="16">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_17" HeaderText="17">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_18" HeaderText="18">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_19" HeaderText="19">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_20" HeaderText="20">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_21" HeaderText="21">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_22" HeaderText="22">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_23" HeaderText="23">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_24" HeaderText="24">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_25" HeaderText="25">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_26" HeaderText="26">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_27" HeaderText="27">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_28" HeaderText="28">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_29" HeaderText="29">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_30" HeaderText="30">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_31" HeaderText="31">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_32" HeaderText="32">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="B_33" HeaderText="33">
                    <ItemStyle CssClass="itemstyle1" />
                </asp:BoundField>
                <asp:BoundField DataField="L_1" HeaderText="01">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_2" HeaderText="02">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_3" HeaderText="03">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_4" HeaderText="04">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_5" HeaderText="05">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_6" HeaderText="06">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_7" HeaderText="07">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_8" HeaderText="08">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_9" HeaderText="09">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_10" HeaderText="10">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_11" HeaderText="11">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_12" HeaderText="12">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_13" HeaderText="13">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_14" HeaderText="14">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_15" HeaderText="15">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
                <asp:BoundField DataField="L_16" HeaderText="16">
                    <ItemStyle CssClass="itemstyle2" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lbline" runat="server"></asp:Label>
        <script type="text/javascript">
            DrawLines();
        </script>
    </div>
    <div class="wrap">
<p>
                        <a href='SSQ_CGXMB.aspx' target='mainFrame'>常规项目表走势图</a>
                        | <a href='SSQ_ZHFB.aspx' target='mainFrame'>综合分布图走势图</a> | <a href='SSQ_3FQ.aspx' target='mainFrame'>
                            3分区分布图走势图</a> | <a href='SSQ_DX.aspx' target='mainFrame'>大小分析走势图</a> | <a href='SSQ_JO.aspx'
                                target='mainFrame'>奇偶分析走势图</a> | <a href='SSQ_ZH.aspx' target='mainFrame'>质合分析走势图</a>
                        | <a href='SSQ_HL.aspx' target='mainFrame'>红蓝球走势图</a> | <a href='SSQ_BQZST.aspx'
                            target='mainFrame'>蓝球综合走势图</a>
                       </p>
            </div>
   <uc1:WebFoot ID="WebFoot1" runat="server" />
    </form>
  
</body>
</html>
