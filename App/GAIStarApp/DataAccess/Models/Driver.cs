using System;

namespace GAIStarApp.DataAccess.Models
{
    public class Driver
    {
        public int DriverID { get; set; } 
        public string FullName { get; set; } 
        public DateTime? DateOfBirth { get; set; } 
        public string LicenseNumber { get; set; } 
        public int UserID { get; set; } 
        public virtual User User { get; set; } 
    }
}