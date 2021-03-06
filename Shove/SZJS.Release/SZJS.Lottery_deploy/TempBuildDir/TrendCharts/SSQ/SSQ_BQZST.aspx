﻿<%@ page language="C#" autoeventwireup="true" inherits="Home_TrendCharts_SSQ_SSQ_BQZST, App_Web_j8uyfmgt" enableEventValidation="false" %>
<%@ Register Src="../../Home/Room/UserControls/WebFoot.ascx" TagName="WebFoot" TagPrefix="uc1" %>
<%@ Register Src="../../UserControls/Head.ascx" TagName="Head" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>双色球蓝球走势图-双色球走势图-彩票走势图表和数据分析－<%=_Site.Name %></title>
<meta name="keywords" content="双色球走势图-双色球蓝球走势图" />
<meta name="description" content="双色球走势图-双色球蓝球走势图、彩票走势图表和数据分析。" />
     <link href="../../Home/Room/Style/common.css" rel="stylesheet" type="text/css" />
    <link href="../../Home/Room/Style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../../Home/Room/Style/zbuy.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="../../favicon.ico" />
<link href="../../Home/Room/Style/zst.css" rel="stylesheet" type="text/css" />
    <script src="../../JavaScript/jquery-1.4.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">
<!--
        function Style(obj, statcolor, color) {

            if (obj.style.backgroundColor == "") {
                obj.style.backgroundColor = "#FFFFFF";
                obj.style.color = statcolor;
            }
            else {
                obj.style.backgroundColor = "";
                obj.style.color = color;
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
//            jgdiv1.setStroke(1);
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
           // _removeDiv();

            DrawLines();
        }
    </script>
     <link rel="shortcut icon" href="../../favicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
    <uc2:Head ID="Head2" runat="server" />
<div class="wrap">
<div class="zst_top">
<h1>双色球&nbsp;&nbsp;蓝球走势图</h1>
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
                        bordercolorlight="#808080" bordercolordark="#FFFFFF" RowStyle-HorizontalAlign="Center"
                        CellPadding="0" ShowHeader="true" OnRowCreated="GridView1_RowCreated" ShowFooter="true">
                        <Columns>
                            <asp:BoundField DataField="Isuse" HeaderText="期号">
                                <ItemStyle CssClass="Isuse" />
                            </asp:BoundField>
                            <asp:BoundField DataField="R_Q" HeaderText="红球">
                                <ItemStyle Width="120" ForeColor="#FF0000" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_Q" HeaderText="蓝球">
                                <ItemStyle Width="40" ForeColor="#0000FF" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_1" HeaderText="01">
                                <ItemStyle CssClass="itemstyle1" Height="18px" />
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
                                <ItemStyle CssClass="itemstyle1" Height='20px' />
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
                            <asp:BoundField DataField="J" HeaderText="16">
                                <ItemStyle Width="20" />
                            </asp:BoundField>
                            <asp:BoundField DataField="O" HeaderText="16">
                                <ItemStyle CssClass="itemstyle3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Z" HeaderText="16">
                                <ItemStyle Width="20" BackColor="#f7f7f7" />
                            </asp:BoundField>
                            <asp:BoundField DataField="H" HeaderText="16">
                                <ItemStyle Width="20" ForeColor="#FF0000" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q_0" HeaderText="16">
                                <ItemStyle Width="20" BackColor="#ffe8eb" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q_1" HeaderText="16">
                                <ItemStyle CssClass="itemstyle3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q_2" HeaderText="16">
                                <ItemStyle CssClass="itemstyle4" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q1_1" HeaderText="16">
                                <ItemStyle CssClass="itemstyle2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q1_2" HeaderText="16">
                                <ItemStyle CssClass="itemstyle2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q1_3" HeaderText="16">
                                <ItemStyle CssClass="itemstyle2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Q1_4" HeaderText="16">
                                <ItemStyle CssClass="itemstyle2" Width="36px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_J" HeaderText="16">
                                <ItemStyle CssClass="itemstyle1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_M" HeaderText="16">
                                <ItemStyle CssClass="itemstyle1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_S" HeaderText="16">
                                <ItemStyle CssClass="itemstyle1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_H" HeaderText="16">
                                <ItemStyle CssClass="itemstyle1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_T" HeaderText="16">
                                <ItemStyle CssClass="itemstyle1" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
    </div>
         <asp:Label ID="lbline" runat="server"></asp:Label>
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
