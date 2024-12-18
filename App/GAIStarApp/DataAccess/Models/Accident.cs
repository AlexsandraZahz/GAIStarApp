using System;

namespace GAIStarApp.DataAccess.Models
{
    public class Accident
    {
        public int AccidentID { get; set; } 
        public DateTime Date { get; set; } 
        public TimeSpan Time { get; set; } 
        public string Location { get; set; } 
        public string Description { get; set; } 
        public decimal DamageAmount { get; set; } 
        public int VehicleID { get; set; } 
        public virtual Vehicle Vehicle { get; set; } 
    }
}