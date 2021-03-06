﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Discuz.Forum;
using Discuz.Entity;
using Discuz.Common;

public partial class News_News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int tid=DNTRequest.GetInt("tid", 0);

        if (tid > 0)
        {
            //ShowtopicPagePostInfo info = Posts.GetSinglePost(tid);
            PostInfo postInfo = Posts.GetPostInfo(tid, Posts.GetFirstPostId(tid));
            if (postInfo != null)
            {

                //处理帖子内容
                PostpramsInfo postpramsinfo = new PostpramsInfo();
                postpramsinfo.Smileyoff = postInfo.Smileyoff;
                postpramsinfo.Bbcodeoff = postInfo.Bbcodeoff;
                postpramsinfo.Parseurloff = postInfo.Parseurloff;
                postpramsinfo.Allowhtml = postInfo.Htmlon;
                postpramsinfo.Sdetail = postInfo.Message;
                postpramsinfo.Pid = postInfo.Pid;
                postpramsinfo.Showimages = 1;

                //Discuz.Web.News.News

                //显示内容
                lblTitle.Text = postInfo.Title;
                lblAuthor.Text = postInfo.Poster;
                lblDatetime.Text = postInfo.Postdatetime.ToString();
                content.InnerHtml = UBB.UBBToHTML(postpramsinfo);




            }
        }
    }
}
