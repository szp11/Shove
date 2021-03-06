﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CJDLT_TemaLengRe.aspx.cs"
    Inherits="CJDLT_CJDLT_TemaLengRe" %>

<%@ Register Src="../../Home/Room/UserControls/WebFoot.ascx" TagName="WebFoot" TagPrefix="uc1" %>
<%@ Register Src="../../UserControls/Head.ascx" TagName="Head" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>超级大乐透后区全部号码全历史冷热图</title>
    <link href="../../Home/Room/Style/common.css" rel="stylesheet" type="text/css" />
    <link href="../../Home/Room/Style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../../Home/Room/Style/zbuy.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="../../favicon.ico" />
<link href="../../Home/Room/Style/zst.css" rel="stylesheet" type="text/css" />
    <script src="../../JavaScript/jquery-1.4.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">
<!--
var jsstr = ""
+ "<img src=\"about:blank\" id=\"leftright\" style=\"width:expression(document.body.clientWidth);height:1px;position:absolute;left:0;top:0;background-color:#6699cc;z-index:100;\" \/>\n"
+ "<img src=\"about:blank\" id=\"topdown\" style=\"height:expression(document.body.clientHeight);width:1px;position:absolute;left:0;top:0;background-color:#6699cc;z-index:100;\" \/>\n"
document.writeln(jsstr);

function followmouse(){
	leftright.style.top = window.event.y-1+document.body.scrollTop
	topdown.style.left = window.event.x-1+document.body.scrollLeft
	topdown.style.height= document.getElementById("div_end").offsetTop;// + 800;
	leftright.style.width=document.body.clientWidth
}
document.onmousemove=followmouse

function Style(obj,statcolor,color)
{

 if(obj.style.backgroundColor=="")
 {
	obj.style.backgroundColor=statcolor;
	obj.style.color="#FFFFFF";
  }
	else
	{
	obj.style.backgroundColor="";
	obj.style.color=color;
	}
}
//-->
    </script>      

</head>
<body>
    <form id="form1" runat="server">
    <uc2:Head ID="Head2" runat="server" />
    <div class="wrap">
        <div class="zst_top">
            <h1>后区全部号码全历史冷热图</h1>
            <ul>
                <li><span>起始期数：</span>
                        <asp:RadioButton ID="RadioButton1" runat="server" Text="100期" AutoPostBack="True"
                            GroupName="group" OnCheckedChanged="RadioButton1_CheckedChanged1" />
                        <asp:RadioButton ID="RadioButton2" runat="server" Text="50期" AutoPostBack="True"
                            OnCheckedChanged="RadioButton2_CheckedChanged" GroupName="group" />
                        <asp:RadioButton ID="RadioButton3" runat="server" Text="30期" AutoPostBack="True"
                            Checked="true" OnCheckedChanged="RadioButton3_CheckedChanged" GroupName="group" />
                        <asp:RadioButton ID="RadioButton4" runat="server" Text="20期" AutoPostBack="True"
                            GroupName="group" OnCheckedChanged="RadioButton4_CheckedChanged1" />
                        <asp:RadioButton ID="RadioButton5" runat="server" Text="10期" AutoPostBack="True"
                            GroupName="group" OnCheckedChanged="RadioButton5_CheckedChanged1" />
                </li>
            </ul>
        </div>
    </div>
    <div class="wrap">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" UseAccessibleHeader="False"
                        OnRowCreated="GridView1_RowCreated" ShowFooter="True" Width="100%" 
                        FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ShowHeader="false"
                      align="center" CellPadding="0" Font-Size="12px">
                        <RowStyle HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="LotteryNumber" HeaderText="出现次数" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle BackColor="#F7F7F7" Width='78px' />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_1" HeaderText="B_1" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_2" HeaderText="B_2" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_3" HeaderText="B_3" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_4" HeaderText="B_4" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_5" HeaderText="B_5" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_6" HeaderText="B_6" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_7" HeaderText="B_7" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_8" HeaderText="B_8" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_9" HeaderText="B_9" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_10" HeaderText="B_10" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_11" HeaderText="B_11" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="B_12" HeaderText="B_12" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Width="28px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
               
                    <asp:GridView ID="GridView2" runat="server" ShowHeader="false" OnRowCreated="GridView2_RowCreate"
                         align="center" CellPadding="0" 
                        CellSpacing="0" AutoGenerateColumns="False" Font-Size="12px" Width="100%">
                        <Columns>
                            <asp:BoundField>
                                <ItemStyle Height="0px" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle Height="0px" Width="0px" />
                    </asp:GridView>
                    </div>
                    <div class="wrap">
                <p>
                                <font color="#FF0000">说明：</font>超级大乐透后区开奖号码冷热图是反映往期开奖号码01-12间每位号码出现次数展现图。从图表可以直观看出那些号码和一定期数内出现频率，依据此图可以大略估算那些号码为热码那些为冷码，对于长期投注的彩民可以考虑选择热码和冷码。<br>
                                本图上面部分显示以开奖号为序排列的，底图是以出现次数进行排列的。
                   </p>       
        <div id="div_end">
        </div>
    </div>
    <uc1:WebFoot ID="WebFoot1" runat="server" />
    </form>
</body>
</html>
