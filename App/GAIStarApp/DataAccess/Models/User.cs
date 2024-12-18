namespace GAIStarApp.DataAccess.Models
{
    public class User
    {
        public int UserID { get; set; } 
        public string Username { get; set; } 
        public string PasswordHash { get; set; } 
        public int RoleID { get; set; } 
        public virtual Role Role { get; set; } 
    }
}