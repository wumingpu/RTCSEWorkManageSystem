﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RTCSEWorkManageBS.BugIssue
{
    public partial class BugList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentEncoding = Encoding.GetEncoding("gb2312");
        }
    }
}