using System;

namespace GAIStarApp.DataAccess.Models
{
    public class Payment
    {
        public int PaymentID { get; set; }
        public int FineID { get; set; }
        public int DriverID { get; set; } 
        public DateTime PaymentDate { get; set; }
        public decimal PaymentAmount { get; set; }
        public int PaymentMethodID { get; set; }

        // Навигационные свойства
        public virtual Fine Fine { get; set; }
        public virtual Driver Driver { get; set; } 
        public virtual PaymentMethod PaymentMethod { get; set; }
    }
}