using System;
using System.Data;
using System.Data.Common;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Collections;
using System.IO;

using Discuz.Common;
using Discuz.Data;
using Discuz.Forum;
using Button = Discuz.Control.Button;
using DataGrid = Discuz.Control.DataGrid;
using Discuz.Config;
using Discuz.Cache;


namespace Discuz.Web.Admin
{
    /// <summary>
    /// �����б�
    /// </summary>

#if NET1
    public class smilegrid : AdminPage
#else
    public partial class smilegrid : AdminPage
#endif
    {

#if NET1
        #region �ؼ�����
        protected Discuz.Control.Button DelRec;
        protected Discuz.Control.DataGrid smilesgrid;
        protected Discuz.Control.Button EditSmile;
        protected System.Web.UI.WebControls.Literal fileinfoList;
        protected Discuz.Control.Button SubmitButton;
        #endregion
#endif

        private ArrayList fileList = new ArrayList();

        private void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
            BindFilesList();
        }

        public void BindData()
        {
            smilesgrid.AllowCustomPaging = false;
            smilesgrid.TableHeaderName = "��̳�����б�";
            smilesgrid.BindData(DatabaseProvider.GetInstance().GetSmilieByType(DNTRequest.GetInt("typeid", 0)));
        }

        protected void Sort_Grid(Object sender, DataGridSortCommandEventArgs e)
        {
            smilesgrid.Sort = e.SortExpression.ToString();
        }

        protected void DataGrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            smilesgrid.LoadCurrentPageIndex(e.NewPageIndex);
        }

        private void DataGrid_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            #region ���ݰ���ʾ���ȿ���

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                TextBox t = (TextBox)e.Item.Cells[3].Controls[0];
                t.Attributes.Add("maxlength", "25");

                t = (TextBox)e.Item.Cells[4].Controls[0];
                t.Attributes.Add("maxlength", "4");

                t = (TextBox)e.Item.Cells[5].Controls[0];
                t.Attributes.Add("maxlength", "30");
                t.ReadOnly = true;
            }

            #endregion
        }


        private void DelRec_Click(object sender, EventArgs e)
        {
            #region ɾ��ָ���ı����¼

            if (this.CheckCookie())
            {
                if (DNTRequest.GetString("id") != "")
                {
                    string idlist = DNTRequest.GetString("id");
                    DatabaseProvider.GetInstance().DeleteSmilies(idlist);

                    UpdateSmiliesCache();
                    Caches.GetSmiliesCache();
                    AdminVistLogs.InsertLog(this.userid, this.username, this.usergroupid, this.grouptitle, this.ip, "�����ļ�ɾ��", "ID:" + idlist);

                    Response.Redirect("forum_smilegrid.aspx?typeid=" + DNTRequest.GetInt("typeid", 0));
                }
                else
                {
                    base.RegisterStartupScript( "", "<script>alert('��δѡ���κ�ѡ��');window.location.href='forum_smilegrid.aspx?typeid=" + DNTRequest.GetInt("typeid", 0) + "';</script>");
                }
            }

            #endregion
        }

        private void UpdateSmiliesCache()
        {
            #region ���±��黺��
            DNTCache.GetCacheService().RemoveObject("/Forum/UI/SmiliesList");
            DNTCache.GetCacheService().RemoveObject("/Forum/UI/SmiliesListFirstPage");
            DNTCache.GetCacheService().RemoveObject("/Forum/UI/SmiliesListWithInfo");
            #endregion
        }


        private void EditSmile_Click(object sender, EventArgs e)
        {
            #region �༭�����޸�
            int row = 0;
            bool isError = false;
            foreach (object o in smilesgrid.GetKeyIDArray())
            {
                if (!Utils.IsNumeric(smilesgrid.GetControlValue(row, "displayorder")))
                {
                    isError = true;
                    continue;
                }
                else
                {
                    DatabaseProvider.GetInstance().UpdateSmilies(int.Parse(o.ToString()), int.Parse(smilesgrid.GetControlValue(row, "displayorder")), 
                    DNTRequest.GetInt("typeid", 0), smilesgrid.GetControlValue(row, "code"), smilesgrid.GetControlValue(row, "url"));
                }
                row++;
            }
            if (isError)
            {
                base.RegisterStartupScript("", "<script>alert('�������³����������ĳЩ��¼δ�ܸ���');window.location.href='forum_smilegrid.aspx?typeid=" + DNTRequest.GetInt("typeid", 0) + "';</script>");
            }
            else
            {
                UpdateSmiliesCache();
                base.RegisterStartupScript("", "<script>window.location.href='forum_smilegrid.aspx?typeid=" + DNTRequest.GetInt("typeid", 0) + "';</script>");
            }
            #endregion
        }

        public string PicStr(string filename)
        {
            return "<img src=../../editor/images/smilies/" + filename + " height=20px width=20px border=0 />";
        }

        private ArrayList GetSmilesFileList(string smilesPath)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + "editor/images/smilies/" + smilesPath;
            DirectoryInfo dir = new DirectoryInfo(path);
            if (!dir.Exists)
            {
                throw new IOException("�����ļ��в�����!");
            }
            FileInfo[] files = dir.GetFiles();
            ArrayList temp = new ArrayList();
            foreach (FileInfo file in files)
            {
                temp.Add(file.Name);
            }
            return temp;
        }

        private void BindFilesList()
        {
            try
            {
                fileinfoList.Text = "";
                DataRow dr = Smilies.GetSmilieTypeById(DNTRequest.GetInt("typeid", 0).ToString());
                if (dr == null) return;
                fileList = GetSmilesFileList(dr["url"].ToString());
                string dir = dr["url"].ToString();
                DataTable dt = DatabaseProvider.GetInstance().GetSmiliesInfoByType(DNTRequest.GetInt("typeid", 0));
                foreach (DataRow smile in dt.Rows)
                {
                    ViewState["code"] += smile["code"] + ",";
                    fileList.Remove(smile["url"].ToString().Replace(dir + "/", ""));
                }
                fileList.Remove("Thumbs.db");
                int i = 1;
                foreach (string file in fileList)
                {
                    fileinfoList.Text += "<tr class='mouseoutstyle' onmouseover='this.className=\"mouseoverstyle\"' onmouseout='this.className=\"mouseoutstyle\"'>\n";
                    fileinfoList.Text += "<td nowrap='nowrap' style='border-color:#EAE9E1;border-width:1px;border-style:solid;'><input type='checkbox' id='id" + i + "' name='id" + i + "' value='" + i + "'/></td>\n";
                    fileinfoList.Text += "<td nowrap='nowrap' style='border-color:#EAE9E1;border-width:1px;border-style:solid;'><input type='text' id='code" + i + "' name='code" + i + "' value=':" + dir + (dt.Rows.Count + i) + ":' class=\"FormBase\" onfocus=\"this.className='FormFocus';\" onblur=\"this.className='FormBase';\" /></td>\n";
                    fileinfoList.Text += "<td nowrap='nowrap' style='border-color:#EAE9E1;border-width:1px;border-style:solid;'><input type='text' id='order" + i + "' name='order" + i + "' value='" + i + "' class=\"FormBase\" onfocus=\"this.className='FormFocus';\" onblur=\"this.className='FormBase';\" size='4' /></td>\n";
                    fileinfoList.Text += "<td nowrap='nowrap' style='border-color:#EAE9E1;border-width:1px;border-style:solid;'><input type='hidden' name='url" + i + "' value='" + dir + "/" + file + "' />" + dir + "/" + file + "</td>\n";
                    fileinfoList.Text += "<td nowrap='nowrap' style='border-color:#EAE9E1;border-width:1px;border-style:solid;'>" + PicStr(dr["url"] + "/" + file) + "</td>\n";
                    fileinfoList.Text += "</tr>\n";
                    i++;
                }
                if (fileList.Count == 0)
                    SubmitButton.Visible = false;
            }
            catch (IOException err)
            {
                base.RegisterStartupScript( "", "<script>alert('" + err.Message + "');window.location.href='forum_smiliemanage.aspx';</script>");
            }
        }

        public void SubmitButton_Click(object sender, EventArgs e)
        {
            bool err = false;
            for (int i = 1; i <= fileList.Count; i++)
            {
                if (DNTRequest.GetFormString("id" + i) != "")
                {
                    try
                    {
                        if(!Utils.IsNumeric(DNTRequest.GetInt("typeid", 0)))
                        {
                            err = true;
                            continue;
                        }
                        DatabaseProvider.GetInstance().AddSmiles(DatabaseProvider.GetInstance().GetMaxSmiliesId(),DNTRequest.GetFormInt("order" + i,0),DNTRequest.GetInt("typeid", 0),DNTRequest.GetFormString("code" + i), DNTRequest.GetFormString("url" + i));
                    }
                    catch
                    {
                        base.RegisterStartupScript( "", "<script>alert('���ִ��󣬿����ļ��������ȣ�');window.location.href='forum_smilegrid.aspx?typeid=" + DNTRequest.GetInt("typeid", 0) + "';</script>");
                    }
                }
            }
            UpdateSmiliesCache();
            base.RegisterStartupScript("", "<script>" + (err ? "alert('���ӵļ�¼��ĳ����ʾ˳���Ƿ�����,�ü�¼δ������!');" : "") + "window.location.href='forum_smilegrid.aspx?typeid=" + DNTRequest.GetInt("typeid", 0) + "';</script>");
        }

        #region Web Form Designer generated code

        protected override void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.DelRec.Click += new EventHandler(this.DelRec_Click);
            this.smilesgrid.ItemDataBound += new DataGridItemEventHandler(this.DataGrid_ItemDataBound);
            this.EditSmile.Click += new EventHandler(this.EditSmile_Click);
            this.SubmitButton.Click += new EventHandler(this.SubmitButton_Click);
            this.SubmitButton.Attributes.Add("onclick", "return validate()");;
            smilesgrid.ColumnSpan = 7;
        }

        #endregion


    }
}