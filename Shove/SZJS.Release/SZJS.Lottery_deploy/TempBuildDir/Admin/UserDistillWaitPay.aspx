﻿<%@ page language="C#" autoeventwireup="true" inherits="Admin_UserDistillWaitPay, App_Web_mq7qcqnw" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Shove.Web.UI.4 For.NET 3.5" Namespace="Shove.Web.UI" TagPrefix="ShoveWebUI" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="style/style01.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript" src="../Components/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hfCurPayType" runat="server" Value="银行" />
    <div style="border: 1px solid #BCD2E9; width: 100%; margin-top: 0px; margin-bottom: 8px;
        background-color: #F4F9FC; height: 60px; vertical-align: middle;">
        <div class="title" style="text-align: center">
            待付款用户一览表
        </div>
        <div style="border-color: #BCD2E9; width: 100%; margin-top: 2px; margin-bottom: 8px;
            background-color: #F4F9FC; height: 30px; vertical-align: middle; border-top-style: solid;
            border-top-width: 1px;" align="left">
            <table cellspacing="0" cellpadding="0" width="100%" border="0" class="baseTab">
                <tr>
                    <td style="height: 30px">
                        &nbsp;开始日期
                        <asp:TextBox runat="server" ID="tbBeginTime" Width="100px" onblur="if(this.value=='') this.value=document.getElementById('hBeginTime').value"
                            name="tbBeginTime" onFocus="WdatePicker({el:'tbBeginTime',dateFmt:'yyyy-MM-dd', maxDate:'%y-%M-%d'})"
                            Height="15px" />
                        &nbsp;结束日期
                        <asp:TextBox runat="server" ID="tbEndTime" Width="100px" name="tbEndTime" onblur="if(this.value=='') this.value=document.getElementById('hEndTime').value"
                            onFocus="WdatePicker({el:'tbEndTime',dateFmt:'yyyy-MM-dd', maxDate:'%y-%M-%d'})"
                            Height="15px" />
                        &nbsp;&nbsp;&nbsp;用户名称
                        <asp:TextBox runat="server" ID="tbUserName" Width="100px" Height="15px" />
                        &nbsp;<span style="color: #ff0000"><asp:Button ID="btnSearch" runat="server" Text="搜索"
                            Height="22px" Width="40px" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"
                            OnClick="btnSearch_Click" />
                        </span>&nbsp;&nbsp;&nbsp; 账户 <span style="color: #ff0000">
                            <asp:DropDownList ID="ddlAccountType" runat="server" Width="109px" AutoPostBack="True"
                                OnSelectedIndexChanged="ddlAccountType_SelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;</span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="baseTab">
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="6px" height="29" align="left">
                            &nbsp;
                        </td>
                        <td id="PayByAlipay" runat="server" width="100px" align="center">
                            <asp:LinkButton runat="server" ID="lbtnPayByAlipay" OnClientClick="return true;"
                                OnClick="lbtnPayByAlipay_Click">提款到支付宝</asp:LinkButton>
                        </td>
                        <td width="6px">
                            &nbsp;
                        </td>
                        <td id="PayByBank" runat="server" width="100px" align="center">
                            <asp:LinkButton runat="server" ID="lbtnPayByBank" OnClientClick="return true;" OnClick="lbtnPayByBank_Click">提款到银行卡</asp:LinkButton>
                        </td>
                        <td width="6px">
                            &nbsp;
                        </td>
                        <td id="AllPay" runat="server" width="100px" align="center">
                            <asp:LinkButton runat="server" ID="lbtnAllPay" OnClientClick="return true;" OnClick="lbtnAllPay_Click">所有待付款用户</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table id="myIcaileTab" runat="server" width="100%" border="0" cellpadding="0" cellspacing="0"
        class="baseTab">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DDDDDD">
                    <tr>
                        <td height="30" align="center" bgcolor="#FFFFFF">
                            <asp:DataGrid ID="g" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="0"
                                BackColor="White" BorderWidth="2px" BorderStyle="None" BorderColor="#E0E0E0"
                                Font-Names="宋体" PageSize="20" AllowPaging="True" OnItemCommand="g_ItemCommand"
                                DataKeyField="ID" OnItemDataBound="g_ItemDataBound">
                                <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
                                <SelectedItemStyle Font-Bold="True" ForeColor="#663399"></SelectedItemStyle>
                                <HeaderStyle HorizontalAlign="Center" ForeColor="RoyalBlue" VerticalAlign="Middle"
                                    BackColor="#E7F1FA"></HeaderStyle>
                                <Columns>
                                    <asp:BoundColumn Visible="False" DataField="ID"></asp:BoundColumn>
                                    <asp:BoundColumn Visible="False" DataField="UserID"></asp:BoundColumn>
                                    <asp:BoundColumn Visible="False" DataField="SiteID"></asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="选择">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="序号">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemTemplate>
                                            <%# Container.ItemIndex + 1%>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="ID" HeaderText="流水号" SortExpression="ID">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Name" HeaderText="用户名" SortExpression="Name">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="RealityName" HeaderText="真实姓名" SortExpression="RealityName">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Money" HeaderText="提取金额" DataFormatString="{0:N2}" SortExpression="Money">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Right" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                            Font-Strikeout="False" Font-Underline="False" ForeColor="#0000ff"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="FormalitiesFees" HeaderText="手续费" DataFormatString="{0:N2}"
                                        SortExpression="FormalitiesFees">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="应付金额">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Right" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                            Font-Strikeout="False" Font-Underline="False" ForeColor="#FF0000"></ItemStyle>
                                        <ItemTemplate>
                                            <%#Convert.ToDouble(DataBinder.Eval(Container.DataItem, "Money")) - Convert.ToDouble(DataBinder.Eval(Container.DataItem, "FormalitiesFees"))%>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="DateTime" HeaderText="申请时间" SortExpression="DateTime">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="状态">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "Result").ToString()=="10"?"接受提款(待付款)":"出错"%>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="AlipayName" HeaderText="支付宝账号" SortExpression="AlipayName">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="BankCardNumber" HeaderText="提款银行卡帐号" SortExpression="BankCardNumber">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="BankTypeName" HeaderText="开户银行" SortExpression="BankTypeName">
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="BankName" HeaderText="支行名称" SortExpression="BankName">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="BankInProvince" HeaderText="所在省"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="BankInCity" HeaderText="所在市"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="BankUserName" HeaderText="持卡人姓名" SortExpression="BankUserName">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="操作">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Button ID="btnPay" runat="server" CommandName="Pay" Height="22px" Width="75"
                                                Text="已线下付款" OnClientClick="return confirm('您确认已线下付款了吗?');" />
                                            <asp:Button ID="btnNoAccept" runat="server" CommandName="DistillNoAccept" Height="22px"
                                                Width="75" Text="拒绝提款" OnClientClick="return confirm('您确认拒绝提款吗? 此操作将会返还会员提款的金额!');" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="备注">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="tbMemo" runat="server" MaxLength="50" Height="16px" Width="80" />
                                            <asp:Button ID="btnMemo" runat="server" CommandName="EditMemo" Height="22px" Width="40"
                                                Text="修改" OnClientClick="return confirm('您确认要修改吗?');" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                                <PagerStyle Visible="False" HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC">
                                </PagerStyle>
                            </asp:DataGrid>
                            <ShoveWebUI:ShoveGridPager ID="gPager" runat="server" Width="100%" ShowSelectColumn="False"
                                DataGrid="g" AllowShorting="False" AlternatingRowColor="#F7FEFA" GridColor="#E0E0E0"
                                HotColor="MistyRose" Visible="False" OnPageWillChange="gPager_PageWillChange" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <ShoveWebUI:ShoveConfirmButton ID="btnAlipayToAlipayAdd" runat="server" Width="129px"
        Height="28px" Text="批量派发至支付宝" AlertText="确信输入无误，并立即派发用户的支付宝账号吗？" OnClick="btnAlipayToAlipayAdd_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <ShoveWebUI:ShoveConfirmButton ID="btnAlipayToBank" runat="server" Width="129px"
        Height="28px" Text="批量派发至银行卡" AlertText="确信输入无误，并立即派发用户的银行卡吗？" OnClick="btnAlipayToBank_Click" />
    </form>
</body>
</html>
