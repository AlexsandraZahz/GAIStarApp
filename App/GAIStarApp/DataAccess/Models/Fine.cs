using System;

namespace GAIStarApp.DataAccess.Models
{

    public class Fine
    {
        public int FineID { get; set; } 
        public int DriverID { get; set; } 
        public DateTime DateOfViolation { get; set; } 
        public int ViolationID { get; set; } 
        public decimal Amount { get; set; } 
        public bool IsPaid { get; set; } 
        public virtual Driver Driver { get; set; } 
        public virtual Violation Violation { get; set; }
    }
}