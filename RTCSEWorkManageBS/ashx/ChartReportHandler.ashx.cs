﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace RTCSEWorkManageBS.ashx
{
    /// <summary>
    /// Summary description for ChartReportHandler
    /// </summary>
    public class ChartReportHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Request["mode"] != null)
            {
                string mode = context.Request["mode"].ToString();
                switch (mode)
                {
                    // Bar Chart
                    case "BarMonthTasknumber":
                        BarMonthTasknumber(context);
                        break;
                    case "BarTaskstyleCaseno":
                        BarTaskstyleCaseno(context);
                        break;

                    // Line Chart
                    case "LineMonthCasenoRelease":
                        LineMonthCasenoRelease(context);
                        break;
                    case "LineMonthBugnoRelease":
                        LineMonthBugnoRelease(context);
                        break;

                    // Pie Chart
                    case "PieReleaseCaseno":
                        PieReleaseCaseno(context);
                        break;
                    case "PieIssuetypeIssueno":
                        PieIssuetypeIssueno(context);
                        break;
                    case "PieFoundbyBugno":
                        PieFoundbyBugno(context);
                        break;
                    case "PieReleaseBugno":
                        PieReleaseBugno(context);
                        break;
                    case "PieTasktypeBugno":
                        PieTasktypeBugno(context);
                        break;
                    case "PiePriorityBugno":
                        PiePriorityBugno(context);
                        break;
                    case "PieResolutionBugno":
                        PieResolutionBugno(context);
                        break;

                    // Test Chart
                    case "TestQuery1":
                        TestQuery1(context);
                        break;
                }
            }
        }

        private void PieResolutionBugno(HttpContext context)
        {
            BLL.ChartReport bll = new BLL.ChartReport();
            string Year = context.Request["Year"];
            string Season = context.Request["Season"];
            string strDateTime = GetDateTimeWithYearSeasonNum(Year, Season);
            DataSet ds = bll.PieResolutionBugno(strDateTime);
            List<Model.ChartReport.LabelDataPercent> list = new List<Model.ChartReport.LabelDataPercent>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.LabelDataPercent()
                {
                    LabelName = dr["BI_Resolution"].ToString(),
                    iData = Convert.ToInt32(dr["BugNo"]),
                    Percent = Convert.ToInt32(dr["BugPercent"].ToString() == "" ? 0 : dr["BugPercent"]).ToString() + '%'
                });
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void PiePriorityBugno(HttpContext context)
        {
            BLL.ChartReport bll = new BLL.ChartReport();
            string Year = context.Request["Year"];
            string Season = context.Request["Season"];
            string strDateTime = GetDateTimeWithYearSeasonNum(Year, Season);
            DataSet ds = bll.PiePriorityBugno(strDateTime);
            List<Model.ChartReport.LabelDataPercent> list = new List<Model.ChartReport.LabelDataPercent>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.LabelDataPercent()
                {
                    LabelName = dr["BI_Priority"].ToString(),
                    iData = Convert.ToInt32(dr["BugNo"]),
                    Percent = Convert.ToInt32(dr["BugPercent"].ToString() == "" ? 0 : dr["BugPercent"]).ToString() + '%'
                });
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void PieTasktypeBugno(HttpContext context)
        {
            BLL.ChartReport bll = new BLL.ChartReport();
            string Year = context.Request["Year"];
            string Season = context.Request["Season"];
            string strDateTime = GetDateTimeWithYearSeasonNum(Year, Season);
            DataSet ds = bll.PieTasktypeBugno(strDateTime);
            List<Model.ChartReport.LabelDataPercent> list = new List<Model.ChartReport.LabelDataPercent>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.LabelDataPercent()
                {
                    LabelName = dr["TT_TaskType"].ToString(),
                    iData = Convert.ToInt32(dr["BugNo"]),
                    Percent = Convert.ToInt32(dr["BugPercent"].ToString() == "" ? 0 : dr["BugPercent"]).ToString() + '%'
                });
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void PieReleaseBugno(HttpContext context)
        {
            BLL.ChartReport bll = new BLL.ChartReport();
            string Year = context.Request["Year"];
            string Season = context.Request["Season"];
            string strDateTime = GetDateTimeWithYearSeasonNum(Year, Season);
            DataSet ds = bll.PieReleaseBugno(strDateTime);
            List<Model.ChartReport.LabelDataPercent> list = new List<Model.ChartReport.LabelDataPercent>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.LabelDataPercent()
                {
                    LabelName = dr["TT_Release"].ToString(),
                    iData = Convert.ToInt32(dr["BugNo"]),
                    Percent = Convert.ToInt32(dr["BugPercent"].ToString() == "" ? 0 : dr["BugPercent"]).ToString() + '%'
                });
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void PieFoundbyBugno(HttpContext context)
        {
            BLL.ChartReport bll = new BLL.ChartReport();
            string Year = context.Request["Year"];
            string Season = context.Request["Season"];
            string strDateTime = GetDateTimeWithYearSeasonNum(Year, Season);
            DataSet ds = bll.PieFoundbyBugno(strDateTime);
            List<Model.ChartReport.LabelDataPercent> list = new List<Model.ChartReport.LabelDataPercent>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.LabelDataPercent()
                {
                    LabelName = dr["FoundBy"].ToString(),
                    iData = Convert.ToInt32(dr["BugNo"]),
                    Percent = Convert.ToInt32(dr["BugPercent"].ToString() == "" ? 0 : dr["BugPercent"]).ToString() + '%'
                });
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void LineMonthBugnoRelease(HttpContext context)
        {
            BLL.ChartReport bll = new BLL.ChartReport();
            string Year = context.Request["Year"];
            if (string.IsNullOrEmpty(Year))
            {
                Year = DateTime.Now.Year.ToString();
            }
            DataSet ds = bll.LineMonthBugnoRelease(Year);
            List<Model.ChartReport.LabelReleaseData> list = new List<Model.ChartReport.LabelReleaseData>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.LabelReleaseData()
                {
                    LabelName = dr["MonthNum"].ToString(),
                    Release = dr["TT_Release"].ToString(),
                    iData = Convert.ToInt32(dr["IssueNo"])
                });
            }
            string[] arrRelease = { "W14", "W15", "W16", "LM" };
            Model.ChartReport.LabelReleaseData modelCheck;
            for (int i = 1; i <= 12; i++)
            {
                foreach (string Release in arrRelease)
                {
                    modelCheck = list.Find(delegate (Model.ChartReport.LabelReleaseData model)
                    {
                        return model.LabelName == i.ToString() && model.Release == Release;
                    });
                    if (modelCheck == null)
                    {
                        list.Add(new Model.ChartReport.LabelReleaseData()
                        {
                            LabelName = i.ToString(),//.Length == 1 ? '0' + i.ToString() : i.ToString()
                            Release = Release,
                            iData = 0
                        });
                    }
                }
            }

            list = list.OrderBy(o => o.LabelName.PadLeft(2, '0')).ThenBy(o => o.Release).ToList();
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void PieIssuetypeIssueno(HttpContext context)
        {
            string strYear = context.Request["Year"];
            string strSeason = context.Request["Season"];
            string strDateTime = GetDateTimeWithYearSeasonNum(strYear, strSeason);
            BLL.ChartReport bll = new BLL.ChartReport();
            DataSet ds = bll.PieIssuetypeIssueno(strDateTime);
            List<Model.ChartReport.LabelDataPercent> list = new List<Model.ChartReport.LabelDataPercent>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.LabelDataPercent()
                {
                    LabelName = dr["BI_Type"].ToString(),
                    iData = Convert.ToInt32(dr["IssueNo"]),
                    Percent = Convert.ToInt32(dr["IssuePercent"].ToString() == "" ? 0 : dr["IssuePercent"]).ToString() + '%'
                });
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void PieReleaseCaseno(HttpContext context)
        {
            string strYear = context.Request["Year"];
            string strSeason = context.Request["Season"];
            string strDateTime = GetDateTimeWithYearSeasonNum(strYear, strSeason);
            BLL.ChartReport bll = new BLL.ChartReport();
            DataSet ds = bll.PieReleaseCaseno(strDateTime);
            List<Model.ChartReport.LabelDataPercent> list = new List<Model.ChartReport.LabelDataPercent>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.LabelDataPercent()
                {
                    LabelName = dr["TT_Release"].ToString(),
                    iData = Convert.ToInt32(dr["CaseNo"]),
                    Percent = Convert.ToInt32(dr["CasePercent"].ToString() == "" ? 0 : dr["CasePercent"]).ToString() + '%'
                });
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void LineMonthCasenoRelease(HttpContext context)
        {
            BLL.ChartReport bll = new BLL.ChartReport();
            string Year = context.Request["Year"];
            if (string.IsNullOrEmpty(Year))
            {
                Year = DateTime.Now.Year.ToString();
            }
            DataSet ds = bll.LineMonthCasenoRelease(Year);
            List<Model.ChartReport.LabelReleaseData> list = new List<Model.ChartReport.LabelReleaseData>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.LabelReleaseData()
                {
                    LabelName = dr["MonthNum"].ToString(),
                    Release = dr["TT_Release"].ToString(),
                    iData = Convert.ToInt32(dr["CaseNo"])
                });
            }
            string[] arrRelease = { "W14", "W15", "W16", "LM" };
            Model.ChartReport.LabelReleaseData modelCheck;
            for (int i = 1; i <= 12; i++)
            {
                foreach (string Release in arrRelease)
                {
                    modelCheck = list.Find(delegate (Model.ChartReport.LabelReleaseData model)
                    {
                        return model.LabelName == i.ToString() && model.Release == Release;
                    });
                    if (modelCheck == null)
                    {
                        list.Add(new Model.ChartReport.LabelReleaseData()
                        {
                            LabelName = i.ToString(),
                            Release = Release,
                            iData = 0
                        });
                    }
                }
            }
            list = list.OrderBy(o => o.LabelName.PadLeft(2, '0')).ThenBy(o => o.Release).ToList();
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void BarTaskstyleCaseno(HttpContext context)
        {
            BLL.ChartReport bll = new BLL.ChartReport();
            string strYear = context.Request["Year"];
            string strSeason = context.Request["Season"];
            string strDateTime = GetDateTimeWithYearSeasonNum(strYear, strSeason);

            DataSet ds = bll.BarTaskstyleCaseno(strDateTime);
            List<Model.ChartReport.LabelData> list = new List<Model.ChartReport.LabelData>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.LabelData()
                {
                    LabelName = dr["TaskType"].ToString(),
                    iData = Convert.ToInt32(dr["CaseNo"])
                });
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void BarMonthTasknumber(HttpContext context)
        {
            BLL.ChartReport bll = new BLL.ChartReport();
            string strYear = context.Request["Year"];
            if (string.IsNullOrEmpty(strYear))
            {
                strYear = DateTime.Now.Year.ToString();
            }
            DataSet ds = bll.BarMonthTasknumber(strYear);
            List<Model.ChartReport.MonthData> list = new List<Model.ChartReport.MonthData>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(new Model.ChartReport.MonthData()
                {
                    Month = Convert.ToInt32(dr["CR_Month"]),
                    DataPreMonth = Convert.ToInt32(dr["CR_TaskNumber"])
                });
            }
            //for (int i = 0; i < 12; i++)
            //{
            //   Model.ChartReport list.Find()

            //}
            //list.Sort();
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string strJson = jss.Serialize(list);
            context.Response.Write(strJson);
        }

        private void TestQuery1(HttpContext context)
        {

        }

        private string GetDateTimeWithYearSeasonNum(string strYear, string strSeason)
        {
            string strDateTime;
            if (string.IsNullOrEmpty(strYear) && string.IsNullOrEmpty(strSeason))
            {
                strDateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            }
            else
            {
                if (strSeason == "1")
                {
                    strDateTime = strYear + "-02-01 00:00:00";
                }
                else if (strSeason == "2")
                {
                    strDateTime = strYear + "-04-01 00:00:00";
                }
                else if (strSeason == "3")
                {
                    strDateTime = strYear + "-07-01 00:00:00";
                }
                else if (strSeason == "4")
                {
                    strDateTime = strYear + "-11-01 00:00:00";
                }
                else
                {
                    strDateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                }
            }
            return strDateTime;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}