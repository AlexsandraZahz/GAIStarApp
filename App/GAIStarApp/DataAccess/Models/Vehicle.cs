namespace GAIStarApp.DataAccess.Models
{
    public class Vehicle
    {
        public int VehicleID { get; set; }
        public int BrandID { get; set; }
        public string Model { get; set; }
        public string VIN { get; set; }
        public string LicensePlate { get; set; }
        public int OwnerID { get; set; }
        public string InsuranceInfo { get; set; }

        public virtual Brand Brand { get; set; }
        public virtual Driver Driver { get; set; }
    }
}