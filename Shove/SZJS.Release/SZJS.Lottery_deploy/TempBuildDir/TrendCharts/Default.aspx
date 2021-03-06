﻿<%@ page language="C#" autoeventwireup="true" inherits="TrendCharts_Default, App_Web_9yevupwi" enableEventValidation="false" %>

<%@ Register Src="../Home/Room/UserControls/WebFoot.ascx" TagName="WebFoot" TagPrefix="uc2" %>
<%@ Register Src="../UserControls/Head.ascx" TagName="Head" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>彩票走势图-彩票走势图表和数据分析|福彩|体彩|高频彩|走势图表|图表分析[双色球，福彩3D，时时乐、时时彩、十一运夺金]－<%=_Site.Name %></title>
    <meta name="description" content=<%=_Site.Name %>,为广大彩民提供双色球，福彩3D，时时乐、时时彩、十一运夺金等彩票开奖号码预测分析。" />
    <meta name="keywords" content="彩票走势图,彩票走势图表,数据分析" />
    <link rel="shortcut icon" href="../favicon.ico" />
    <link href="../Home/Room/Style/common.css" rel="stylesheet" type="text/css" />
    <link href="../Home/Room/Style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../Home/Room/Style/zbuy.css" rel="stylesheet" type="text/css" />

    <script src="../JavaScript/jquery-1.4.js" type="text/javascript"></script>

    <style type="text/css">
        
        .allcai
        {
            background-image: url(    '../Home/Room/Images/allcaipao.jpg' );
            height: 30px;
            line-height: 28px;
            font-size: 14px;
            font-weight: bold;
            background-repeat: no-repeat;
            margin-top: 10px;
            padding-left: 10px;
            color: White;
        }
        .top_nav
        {
            background: url(../Home/Room/Images/top_nav_bg_34.gif) repeat-x;
            height: 34px;
            line-height: 34px;
            border: 1px #DBDBDB solid;
            padding-left: 10px;
            margin-top: 0px;
        }
        .top_nav .fc_list, .top_nav .tc_list
        {
            background: url(../Home/Room/Images/lottery_logo_bg.gif) 0 6px no-repeat;
            height: 34px;
            padding-left: 30px;
            float: left;
        }
        .top_nav .tc_list
        {
            background: url(../Home/Room/Images/lottery_logo_bg.gif) 0 -95px no-repeat;
            margin-left: 15px;
        }
        .top_nav li
        {
            float: left;
        }
        .top_nav li.on a
        {
            color: #FF0000;
        }
        .top_nav li a
        {
            color: #777777;
            margin-right: 7px;
        }
        .top_nav li a:hover
        {
            text-decoration: none;
        }
        .trend-box
        {
            width: 986px;
            margin: 10px auto 0;
        }
        .trend-box .trend-title
        {
            height: 35px;
            line-height: 35px;
            background: url(../Home/Room/Images/title_bg.gif) repeat-x;
            border: 1px #E8D199 solid;
            padding-left: 15px;
        }
        .trend-box .trend-title h1
        {
            padding-left: 42px;
            background: url(../Home/Room/Images/title_icon.gif) 0 3px no-repeat;
            font-size: 14px;
            font-weight: bold;
        }
        .trend-box .trend-main
        {
            border: 1px #E2DFDF solid;
            width: 984px;
        }
        .trend-box .trend-main .trend-lot-ul li
        {
            border-bottom: 1px #E2DFDF solid;
        }
        .trend-box .trend-main .trend-lot-ul li.last
        {
            border-bottom: none;
        }
        .trend-box .trend-main .lottery-logo
        {
            float: left;
            background: url(../Home/Room/Images/logo_bg.gif) no-repeat;
            width: 123px;
            height: 114px;
        }
        .trend-box .trend-main .lottery-logo-big
        {
            background: url(../Home/Room/Images/logo_bg1.gif) no-repeat;
            height: 177px;
        }
        .trend-box .trend-main .lottery-logo a
        {
            width: 77px;
            height: 77px;
            display: block;
            margin-top: 6px;
            margin-left: 22px;
        }
        .trend-box .trend-main .lottery-logo-big a
        {
            margin-top: 38px;
        }
        .trend-box .trend-main .lottery-logo img
        {
            margin: 0 auto;
            display: block;
        }
        .trend-box .trend-main .lottery-logo .lottery-title
        {
            height: 17px;
            padding-top: 12px;
            width: 114px;
        }
        .trend-box .trend-main .right-content
        {
            float: left;
            background: url(../Home/Room/Images/right_content_bg.gif) repeat-x;
            height: 99px;
            width: 860px;
            padding-top: 15px;
        }
        .trend-box .trend-main .right-content-big
        {
            background: url(../Home/Room/Images/right_content_bg1.gif) repeat-x;
            height: 161px;
        }
        .trend-box .trend-main .right-content .row-content
        {
            padding-left: 15px;
            width: 845px;
        }
        .trend-box .trend-main .right-content .row-content h2
        {
            float: left;
            background: url(../Home/Room/Images/content_title_bg.gif) 0px 10px no-repeat;
            padding-left: 15px;
            color: #585757;
            line-height: 30px;
            width: 65px;
        }
        .trend-box .trend-main .right-content .row-content .trend-content
        {
            float: left;
            padding-left: 10px;
            width: 755px;
        }
        .trend-box .trend-main .right-content .row-content .trend-content span
        {
            width: 104px;
            display: block;
            float: left;
            line-height: 25px;
        }
        .trend-box .trend-main .right-content .row-content .trend-content span a
        {
            color: #000000;
            position: relative;
            text-decoration: none;
            display: inline-block;
        }
        .trend-box .trend-main .right-content .row-content .trend-content span a:hover
        {
            color: #FF0000;
        }
        .trend-box .trend-main .right-content .row-content .trend-content span a s
        {
            background: url(../Home/Room/Images/hot.gif) no-repeat;
            width: 13px;
            height: 13px;
            position: absolute;
            top: -3px;
            right: -13px;
        }
        .imgs{ width:67px; height:67px; padding-top:7px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <uc1:Head ID="Head1" runat="server" />
    <div class="wrap">
        <div class="top_nav">
            <ul class="fc_list">
                <li id="ssq"><a href="../Lottery/BuySSQ.aspx">双色球 </a></li>
                <li id="fc3d"><a href="../Lottery/Buy3D.aspx">福彩3D</a></li>
                <li id="qlc"><a href="../Lottery/BuyQLC.aspx">七乐彩</a></li>
                <li id="f15x5"><a href="#">15选5</a></li>
                <li id="df6j1"><a href="#">东方6+1</a></li>
                <li id="ssl"><a href="../Lottery/BuySSL.aspx">时时乐</a></li>
                <li id="jxssc"><a href="../Lottery/BuySSC.aspx">江西时时彩</a></li>
                <li id="Li1"><a href="../Lottery/BuyCQSSC.aspx">重庆时时彩</a></li>
            </ul>
            <ul class="tc_list">
                <li id="dlt"><a href="../Lottery/BuyCJDLT.aspx">大乐透</a></li>
                <li id="pai3"><a href="../Lottery/BuyPL3.aspx">排列3</a></li>
                <li id="pai5"><a href="../Lottery/BuyPL5.aspx">排列5</a></li>
                <li id="qxc"><a href="../Lottery/BuyQXC.aspx">七星彩</a></li>
                <li id="t11x5"><a href="../Lottery/BuySYYDJ.aspx">十一运夺金</a></li>
                <li id="o11x5"><a href="../Lottery/BuyJX11x5.aspx">11选5</a></li>
                <li id="gd11x5"><a href="../Lottery/Buy31x7.aspx">31选7</a></li>
                <li id="tc22x5"><a href="../Lottery/Buy22x5.aspx">22选5</a></li>
            </ul>
            <div class="clear">
            </div>
        </div>
        <div class="allcai">
            福利彩票</div>
        <div class="trend-box">
            <div class="trend-main">
                <ul class="trend-lot-ul">
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/BuySSQ.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_ssq.gif" alt=""  class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/ssq_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="SSQ/SSQ_ZHFB.aspx" target="_blank">综合走势</a></span> <span><a href="SSQ/SSQ_CGXMB.aspx"
                                        target="_blank">常规项目</a></span> <span><a href="SSQ/SSQ_DX.aspx" target="_blank">大小走势</a></span>
                                    <span><a href="SSQ/SSQ_JO.aspx" target="_blank">奇偶走势<s></s></a></span> <span><a href="SSQ/SSQ_ZH.aspx"
                                        target="_blank">质合走势</a></span> <span><a href="SSQ/SSQ_HL.aspx" target="_blank">红蓝球走势</a></span>
                                    <span><a href="SSQ/SSQ_BQZST.aspx" target="_blank">蓝球走势</a></span> <span><a href="SSQ/SSQ_3FQ.aspx"
                                        target="_blank">红球三分区走势</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/Buy3D.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_6.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/fc3d_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="FC3D/FC3D_ZHXT.aspx" target="_blank">综合走势</a></span> <span><a href="FC3D/FC3D_DX_JO.aspx"
                                        target="_blank">大小走势</a></span> <span><a href="FC3D/FC3D_JO_DX.aspx" target="_blank">
                                            奇偶走势</a></span> <span><a href="FC3D/FC3D_ZHZST.aspx" target="_blank">质合走势<s></s></a></span>
                                    <span><a href="FC3D/FC3D_DZXZST.aspx" target="_blank">大中小走势</a></span> <span><a href="FC3D/FC3D_KDZST.aspx"
                                        target="_blank">跨度走势</a></span> <span><a href="FC3D/FC3D_XTZST.aspx" target="_blank">
                                            形态走势</a></span> <span><a href="FC3D/FC3D_HZZST.aspx" target="_blank">和值走势</a></span>
                                    <span><a href="FC3D/FC3D_2CHW.aspx" target="_blank">二次和尾差尾</a></span> <span><a href="FC3D/FC3D_C3YS.aspx"
                                        target="_blank">除3余数走势</a></span> <span><a href="FC3D/FC3D_C3YS_HTML.aspx" target="_blank">
                                            除3余数分区</a></span> <span><a href="FC3D/FC3D_DSHM.aspx" target="_blank">单双点分区</a></span>
                                    <span><a href="FC3D/FC3D_DTHM.aspx" target="_blank">胆托分区</a></span> <span><a href="FC3D/FC3D_HSWH.aspx"
                                        target="_blank">和数尾分区</a></span> <span><a href="FC3D/FC3D_HSZ.aspx" target="_blank">
                                            和数值分区</a></span> <span><a href="FC3D/FC3D_KDZH.aspx" target="_blank">首尾边距组合</a></span>
                                    <span><a href="FC3D/FC3D_LHZH.aspx" target="_blank">连号组合分区</a></span> <span><a href="FC3D/FC3D_ZS.aspx"
                                        target="_blank">质数分区号码组合</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/BuyQLC.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_13.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/qlc_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="QLC/7LC_ZHFB.aspx" target="_blank">综合走势</a></span> <span><a href="QLC/7LC_CGXMB.aspx"
                                        target="_blank">常规项目</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                  <%--  <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/Buy15x5.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_59.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/15x5_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="HD15X5/C15X5_ZHZST.aspx" target="_blank">综合走势</a></span> <span><a
                                        href="HD15X5/C15X5_CGXMB.aspx" target="_blank">常规项目</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/BuyDF6J1.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_58.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/df6j1_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="DF6J1/DF61_ZHFB.aspx" target="_blank">综合走势</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>--%>
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/BuySSL.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_29.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/ssl_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="SHSSL/SHSSL_ZHFB.aspx" target="_blank">综合走势</a></span> <span><a href="SHSSL/SHSSL_DX.aspx"
                                        target="_blank">大小走势</a></span> <span><a href="SHSSL/SHSSL_JO.aspx" target="_blank">
                                            奇偶走势</a></span> <span><a href="SHSSL/SHSSL_ZH.aspx" target="_blank">质合走势</a></span>
                                    <span><a href="SHSSL/SHSSL_HZ.aspx" target="_blank">和值走势</a></span> <span><a href="SHSSL/SHSSL_012.aspx"
                                        target="_blank">012路走势</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                    <li>
                        <div class="lottery-logo lottery-logo-big">
                            <a href="../Lottery/BuySSC.aspx" target="_blank">
                                <img src="../Home/Room/Images/cz_logo_ssc.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/jxssc_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content right-content-big">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="JXSSC/SSC_2X_ZHFBZST.aspx" target="_blank">二星综合</a></span> <span><a
                                        href="JXSSC/SSC_2X_DXDSZST.aspx" target="_blank">二星大小单双</a></span> <span><a href="JXSSC/SSC_2X_HZWZST.aspx"
                                            target="_blank">二星和值尾</a></span> <span><a href="JXSSC/SSC_2X_HZZST.aspx" target="_blank">
                                                二星和值</a></span> <span><a href="JXSSC/SSC_2X_KDZST.aspx" target="_blank">二星跨度</a></span>
                                    <span><a href="JXSSC/SSC_2X_MaxZST.aspx" target="_blank">二星最大值</a></span> <span><a
                                        href="JXSSC/SSC_2X_MinZST.aspx" target="_blank">二星最小值</a></span> <span><a href="JXSSC/SSC_2XPJZZST.aspx"
                                            target="_blank">二星均值</a></span> <span><a href="JXSSC/SSC_2X_012ZST.aspx" target="_blank">
                                                二星012路</a></span> <span><a href="JXSSC/SSC_3X_ZHZST.aspx" target="_blank">三星综合</a></span>
                                    <span><a href="JXSSC/SSC_3X_ZST.aspx" target="_blank">三星走势</a></span> <span><a href="JXSSC/SSC_3X_DXZST.aspx"
                                        target="_blank">三星大小</a></span> <span><a href="JXSSC/SSC_3X_HZWZST.aspx" target="_blank">
                                            三星和值尾</a></span> <span><a href="JXSSC/SSC_3X_HZZST.aspx" target="_blank">三星和值</a></span>
                                    <span><a href="JXSSC/SSC_3X_JOZST.aspx" target="_blank">三星奇偶</a></span> <span><a
                                        href="JXSSC/SSC_3X_KDZST.aspx" target="_blank">三星跨度</a></span> <span><a href="JXSSC/SSC_3X_DX_012_ZST.aspx"
                                            target="_blank">三星单选012路</a></span> <span><a href="JXSSC/SSC_3X_ZX_012_ZST.aspx"
                                                target="_blank">三星组选012路</a></span> <span><a href="JXSSC/SSC_4X_ZHFB.aspx" target="_blank">
                                                    四星综合</a></span> <span><a href="JXSSC/SSC_4X_ZST.aspx" target="_blank">四星走势</a></span>
                                    <span><a href="JXSSC/SSC_4X_DXZST.aspx" target="_blank">四星大小</a></span> <span><a
                                        href="JXSSC/SSC_4X_HZZST.aspx" target="_blank">四星和值</a></span> <span><a href="JXSSC/SSC_4X_JOZST.aspx"
                                            target="_blank">四星奇偶</a></span> <span><a href="JXSSC/SSC_4X_KDZST.aspx" target="_blank">
                                                四星跨度</a></span> <span><a href="JXSSC/SSC_4X_PJZZST.aspx" target="_blank">四星均值</a></span>
                                    <span><a href="JXSSC/SSC_4X_ZHZST.aspx" target="_blank">四星质合</a></span> <span><a
                                        href="JXSSC/SSC_5X_ZHFB.aspx" target="_blank">五星综合</a></span> <span><a href="JXSSC/SSC_5X_ZST.aspx"
                                            target="_blank">五星走势</a></span> <span><a href="JXSSC/SSC_5X_DXZST.aspx" target="_blank">
                                                五星大小</a></span> <span><a href="JXSSC/SSC_5X_HZZST.aspx" target="_blank">五星和值</a></span>
                                    <span><a href="JXSSC/SSC_5X_JOZST.aspx" target="_blank">五星奇偶</a></span> <span><a
                                        href="JXSSC/SSC_5X_KDZST.aspx" target="_blank">五星跨度</a></span> <span><a href="JXSSC/SSC_5X_PJZZST.aspx"
                                            target="_blank">五星均值</a></span> <span><a href="JXSSC/SSC_5X_ZHZST.aspx" target="_blank">
                                                五星质合</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="allcai">
            体育彩票</div>
        <div class="trend-box">
            <div class="trend-main">
                <ul class="trend-lot-ul">
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/BuyCJDLT.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_39.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/dlt_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content ">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="CJDLT/CJDLT_HMFB.aspx" target="_blank">综合走势</a></span> <span><a href="CJDLT/CJDLT_JO.aspx"
                                        target="_blank">奇偶走势</a></span> <span><a href="CJDLT/CJDLT_LH.aspx" target="_blank">
                                            连号走势</a></span> <span><a href="CJDLT/CJDLT_YS.aspx" target="_blank">余数走势</a></span>
                                    <span><a href="CJDLT/CJDLT_HZHeng.aspx" target="_blank">和值横向走势</a></span> <span><a
                                        href="CJDLT/CJDLT_HZZong.aspx" target="_blank">和值纵向走势</a></span> <span><a href="CJDLT/CJDLT_jima.aspx"
                                            target="_blank">前区号码走势</a></span> <span><a href="CJDLT/CJDLT_JimaLengRe.aspx" target="_blank">
                                                前区号码冷热</a></span> <span><a href="CJDLT/CJDLT_JiMaWeihao.aspx" target="_blank">前区尾号走势</a></span>
                                    <span><a href="CJDLT/CJDLT_TeMa.aspx" target="_blank">后区号码走势</a></span> <span><a
                                        href="CJDLT/CJDLT_TemaLengRe.aspx" target="_blank">后区号码冷热</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/BuyPL3.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_63.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/pl3_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="PL3/PL3_HMFB.aspx" target="_blank">综合走势</a></span> <span><a href="PL3/PL3_DX.aspx"
                                        target="_blank">大小走势</a></span> <span><a href="PL3/PL3_JO.aspx" target="_blank">奇偶走势</a></span>
                                    <span><a href="PL3/PL3_ZH.aspx" target="_blank">质合走势</a></span> <span><a href="PL3/PL3_CF.aspx"
                                        target="_blank">重复走势</a></span> <span><a href="PL3/PL3_012.aspx" target="_blank">012路走势</a></span>
                                    <span><a href="PL3/PL3_DZX.aspx" target="_blank">大中小走势</a></span> <span><a href="PL3/PL3_ZX.aspx"
                                        target="_blank">组选分布</a></span><span><a href="PL3/PL3_WH.aspx" target="_blank">位和走势</a></span>
                                    <span><a href="PL3/PL3_LH.aspx" target="_blank">连号走势</a></span> <span><a href="PL3/PL3_YS.aspx"
                                        target="_blank">余数走势</a></span> <span><a href="PL3/PL3_KD.aspx" target="_blank">跨度走势</a></span>
                                    <span><a href="PL3/PL3_HZ.aspx" target="_blank">和值走势</a></span><span><a href="PL3/PL3_GD.aspx"
                                        target="_blank">和值号码分布</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/BuyPL5.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_64.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/pl5_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="PL5/PL5_KJFB.aspx" target="_blank">综合走势</a></span> <span><a href="PL5/PL5_DX.aspx"
                                        target="_blank">大小走势</a></span> <span><a href="PL5/PL5_JO.aspx" target="_blank">奇偶走势</a></span>
                                    <span><a href="PL5/PL5_ZH.aspx" target="_blank">质合走势</a></span> <span><a href="PL5/PL5_CF.aspx"
                                        target="_blank">重复走势</a></span> <span><a href="PL5/PL5_012.aspx" target="_blank">012路走势</a></span>
                                    <span><a href="PL5/PL5_DZX.aspx" target="_blank">大中小走势</a></span> <span><a href="PL5/PL5_LH.aspx"
                                        target="_blank">连号走势</a></span> <span><a href="PL5/PL5_YS.aspx" target="_blank">余数走势</a></span>
                                    <span><a href="PL5/PL5_HZ.aspx" target="_blank">和值走势</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/BuyQXC.aspx" target="_blank">
                                <img src="../Home/Room/Images/qxc_logo.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/qxc_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="7Xing/7X_HMFB.aspx" target="_blank">综合走势</a></span> <span><a href="7Xing/7X_DX.aspx"
                                        target="_blank">大小走势<s></s></a></span> <span><a href="7Xing/7X_JO.aspx" target="_blank">
                                            奇偶走势</a></span> <span><a href="7Xing/7X_ZH.aspx" target="_blank">质合走势</a></span>
                                    <span><a href="7Xing/7X_CF.aspx" target="_blank">重复走势</a></span> <span><a href="7Xing/X7_012.aspx"
                                        target="_blank">012路走势</a></span> <span><a href="7Xing/X7_DZX.aspx" target="_blank">
                                            大中小走势</a></span> <span><a href="7Xing/7X_LH.aspx" target="_blank">连号走势</a></span>
                                    <span><a href="7Xing/7X_YS.aspx" target="_blank">余数走势</a></span> <span><a href="7Xing/7X_HZheng.aspx"
                                        target="_blank">和值横向走势</a></span> <span><a href="7Xing/7X_ZHZhong.aspx" target="_blank">
                                            和值纵向走势</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/BuySYYDJ.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_70.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/11ydj_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="SYYDJ/SYDJ_FBZS.aspx" target="_blank">分布走势</a></span> <span><a href="SYYDJ/SYDJ_DWZS.aspx"
                                        target="_blank">定位走势</a></span> <span><a href="SYYDJ/SYDJ_HZFB.aspx" target="_blank">
                                            和值分布走势</a></span> <span><a href="SYYDJ/SYDJ_Q2FBT.aspx" target="_blank">前二分布走势</a></span>
                                    <span><a href="SYYDJ/SYDJ_Q2HZ.aspx" target="_blank">前二和值走势</a></span> <span><a href="SYYDJ/SYDJ_Q2ZXDYB.aspx"
                                        target="_blank">前二组选走势</a></span> <span><a href="SYYDJ/SYDJ_Q3FBT.aspx" target="_blank">
                                            前三分布走势</a></span> <span><a href="SYYDJ/SYDJ_Q3FWT.aspx" target="_blank">前三分位走势</a></span>
                                    <span><a href="SYYDJ/SYDJ_Q3HZT.aspx" target="_blank">前三和值走势</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                    <li>
                        <div class="lottery-logo">
                            <a href="../Lottery/Buy22x5.aspx" target="_blank">
                                <img src="../Home/Room/Images/logo_9.gif" alt="" class="imgs"/></a>
                            <div class="lottery-title">
                                <img src="../Home/Room/Images/22x5_title.gif" alt="" /></div>
                        </div>
                        <div class="right-content">
                            <div class="row-content">
                                <h2>
                                    号码走势：</h2>
                                <div class="trend-content">
                                    <span><a href="TC22X5/22X5_HMFB.aspx" target="_blank">综合走势</a></span> <span><a href="TC22X5/22X5_JO.aspx"
                                        target="_blank">奇偶走势</a></span> <span><a href="TC22X5/22X5_WeiHao.aspx" target="_blank">
                                            尾号走势</a></span> <span><a href="TC22X5/22X5_WeiHaoCF.aspx" target="_blank">重复走势</a></span>
                                    <span><a href="TC22X5/22X5_LH.aspx" target="_blank">连号走势</a></span> <span><a href="TC22X5/22X5_YS.aspx"
                                        target="_blank">余数走势</a></span> <span><a href="TC22X5/22X5_HMLR.aspx" target="_blank">
                                            冷热分布</a></span> <span><a href="TC22X5/22X5_HZ_Heng.aspx" target="_blank">和值横向走势</a></span>
                                    <span><a href="TC22X5/22X5_HZ_Zong.aspx" target="_blank">和值纵向走势</a></span>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <uc2:WebFoot ID="WebFoot1" runat="server" />
    </form>
</body>
</html>
