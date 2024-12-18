using System;

namespace GAIStarApp.DataAccess.Models
{
    public class Report
    {
        public int ReportID { get; set; } 
        public string ReportType { get; set; } 
        public DateTime DateGenerated { get; set; } 
        public string Content { get; set; } 
    }
}