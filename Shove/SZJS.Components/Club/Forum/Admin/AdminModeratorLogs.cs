using System;
using System.Data;
using System.Data.Common;

using Discuz.Config;
using Discuz.Data;
using Discuz.Entity;

namespace Discuz.Forum
{
	/// <summary>
	/// AdminModeratorManageLogFactory ��ժҪ˵����
	/// ǰ̨������־����������
	/// </summary>
	public class AdminModeratorLogs
	{
		public AdminModeratorLogs()
		{
		}

		/// <summary>
		/// �������������־��¼
		/// </summary>
		/// <param name="moderatorname">������</param>
		/// <param name="grouptitle">�������ID</param>
		/// <param name="ip">�ͻ��˵�IP</param>
		/// <param name="fname">��������</param>
		/// <param name="title">���������</param>
		/// <param name="actions">����</param>
		/// <param name="reason">ԭ��</param>
		/// <returns></returns>
		public static bool InsertLog(string moderatoruid, string moderatorname, string groupid, string grouptitle, string ip, string postdatetime, string fid, string fname, string tid, string title, string actions, string reason)
		{
            return DatabaseProvider.GetInstance().InsertModeratorLog(moderatoruid, moderatorname, groupid, grouptitle, ip, postdatetime, fid, fname, tid, title, actions, reason);
		}


		/// <summary>
		/// ��ָ������ɾ����־
		/// </summary>
		/// <param name="condition">��ѯ����</param>
		/// <returns></returns>
		public static bool DeleteLog(string condition)
		{
            return DatabaseProvider.GetInstance().DeleteModeratorLog(condition);
		}


		/// <summary>
		/// �õ���ǰָ��ҳ����ǰ̨������־��¼(��)
		/// </summary>
		/// <param name="pagesize">��ǰ��ҳ�ĳߴ��С</param>
		/// <param name="currentpage">��ǰҳ��</param>
		/// <returns></returns>
		public static DataTable LogList(int pagesize, int currentpage)
		{
			return LogList(pagesize, currentpage, "");
		}


		/// <summary>
		/// �õ���ǰָ��������ҳ����ǰ̨������־��¼(��)
		/// </summary>
		/// <param name="pagesize">��ǰ��ҳ�ĳߴ��С</param>
		/// <param name="currentpage">��ǰҳ��</param>
		/// <param name="condition">��ѯ����</param>
		/// <returns></returns>
		public static DataTable LogList(int pagesize, int currentpage, string condition)
		{
            DataTable dt = DatabaseProvider.GetInstance().GetModeratorLogList(pagesize, currentpage, condition);

            GeneralConfigInfo config = GeneralConfigs.GetConfig();
			foreach (DataRow dr in dt.Rows)
			{
				if (dr["title"].ToString().Trim() != "")
				{
					try
					{
						if (dr["actions"].ToString().Trim() == "rate")
						{
							dr["title"] = "<a href=../../showtree.aspx?postid=" + dr["tid"] + ">" + dr["title"] + "</a>";
							dr["actions"] = "����";
						}
						else if (dr["actions"].ToString().Trim() == "delposts")
						{
                            if (config.Aspxrewrite == 1)
                            {
                                dr["title"] = "<a href='../../showtopic-" + dr["tid"] + ".aspx' title='����ժҪ:" + dr["title"].ToString().Split('|')[1] + "\r\n����鿴��������'>" + dr["title"].ToString().Split('|')[0] + "</a>";
                            }
                            else
                            {
                                dr["title"] = "<a href='../../showtopic.aspx?topicid=" + dr["tid"] + "' title='����ժҪ:" + dr["title"].ToString().Split('|')[1] + "\r\n����鿴��������'>" + dr["title"].ToString().Split('|')[0] + "</a>";
                            }
							dr["actions"] = "����ɾ��";
						}
						else
						{
                            if (config.Aspxrewrite == 1)
                            {
                                dr["title"] = "<a href='../../showtopic-" + dr["tid"] + ".aspx'>" + dr["title"] + "</a>";
                            }
                            else
                            {
                                dr["title"] = "<a href='../../showtopic.aspx?topicid=" + dr["tid"] + "'>" + dr["title"] + "</a>";
                            }
						}
					}
					catch
					{
						dr["title"] = "����";
					}
				}
			}
			return dt;
		}


		/// <summary>
		/// �õ�ǰ̨������־��¼��
		/// </summary>
		/// <returns></returns>
		public static int RecordCount()
		{
            return DatabaseProvider.GetInstance().GetModeratorLogListCount();
		}


		/// <summary>
		/// �õ�ָ����ѯ�����µ�ǰ̨������־��
		/// </summary>
		/// <param name="condition">��ѯ����</param>
		/// <returns></returns>
		public static int RecordCount(string condition)
		{
            return DatabaseProvider.GetInstance().GetModeratorLogListCount(condition);	
        }
	}
}