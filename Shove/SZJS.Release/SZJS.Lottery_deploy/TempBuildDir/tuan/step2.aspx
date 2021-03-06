﻿<%@ page language="C#" autoeventwireup="true" inherits="tuan_step2, App_Web_tkuakaea" enableEventValidation="false" %>

<%@ Register Src="../UserControls/Head.ascx" TagName="Head" TagPrefix="uc1" %>
<%@ Register Src="../Home/Room/UserControls/WebFoot.ascx" TagName="WebFoot" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>
        <%=_Site.Name %>-彩票网 -- 优惠券兑换购彩体验金</title>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta name="Keywords" content=",彩票,彩票合买,足彩,足球彩票,体彩,体育彩票,福彩,双色球彩票,时时乐,时时彩,福利彩票,开奖信息,中奖查询,足球资讯,彩票软件,超级双色球,排列3,排列5,双色球,29选7,22选5,36选7,足彩胜负,足彩进球,足球单场,福彩3d,七乐彩,彩票论坛,即时比分,过关统计" />
    <meta name="Description" content="-彩票网（www.baixingcai.com）是一家服务于中国彩民的互联网彩票合买代购交易平台，是当前中国彩票互联网交易行业的领导者。-彩票网以服务中国彩民为己任，为彩民提供全国各大联销型彩票的在线合买、代购和彩票软件开发。覆盖了足球彩票，体育彩票，福利彩票等各类彩票." />
    <link href="../Home/Room/Style/common.css" rel="stylesheet" type="text/css" />
    <link href="../Home/Room/Style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../Home/Room/Style/tuangou.css" rel="stylesheet" type="text/css" />

    <script src="../JavaScript/jquery-1.6.2.min.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
    <uc1:Head ID="Head2" runat="server" />
    <div class="wrap">
        <div class="cenimg">
            <img src="images/cenlogo.jpg" />
        </div>
        <div class="tuangou">
            <div class="yuan">
                <div class="fooder">
                    <img src="images/t_03.gif" />
                </div>
            </div>
            <div class="yuancen">
                <p class="zhongjian">
                    成功激活彩票账户，<%=_User.Balance %>元购彩金已充入你账户</p>
                <p class="lie">
                    <span>用户名：</span><em><%=_User.Name %></em>
                </p>
                <br />
                <p class="lie" style="text-align: center">
                    <a href="../Index.aspx">点击进入百姓彩</a></p>
                <br />
                <p class="cen">
                    输入您获得的兑换码，就能获得价值9元的百姓彩账户充值券<br />
                    本次兑换完全免费，兑换码仅在活动期内有效！<br />
                    注：39元购彩金不能马上提款，奖金提款申请我们将在24小时内为您处理完结。谢谢！
                </p>
                <br />
                <br />
                <p class="botm">
                    <span>兑换码使用说明：</span><br />
                    1.本次活动仅针对通过本兑换页面提交个人信息并通过手机号新激活百姓彩账户的用户
                    <br />
                    2.每个用户、每个兑换码、每个手机号限兑换一次,已在百姓彩网站验证过的手机号不能重复使用<br />
                    3.本活动兑换的账户充值卷充值后仅用于用户购买彩票，有效为充值成功后15天，过期不用将回收<br />
                    4.本活动最终解释权归百姓彩及合作方共同所有
                </p>
            </div>
            <div class="yuanbottom">
            </div>
        </div>
    </div>
    <uc2:WebFoot ID="WebFoot1" runat="server" />
    </form>
</body>
</html>
