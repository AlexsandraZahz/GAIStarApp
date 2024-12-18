using System.Data.Entity;
using GAIStarApp.DataAccess.Models;

namespace GAIStarApp.DataAccess
{
    public class GAIContext : DbContext
    {
        public GAIContext() : base("GAI") // Указываем строку подключения к базе данных
        {
        }

        // DbSet для всех моделей
        public virtual DbSet<GAIEmployee> GAIEmployees { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Driver> Drivers { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Vehicle> Vehicles { get; set; }
        public virtual DbSet<Violation> Violations { get; set; }
        public virtual DbSet<Fine> Fines { get; set; }
        public virtual DbSet<Accident> Accidents { get; set; }
        public virtual DbSet<Report> Reports { get; set; }
        public virtual DbSet<Camera> Cameras { get; set; }
        public virtual DbSet<PaymentMethod> PaymentMethods { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // Настройка связи между Payment и Driver
            modelBuilder.Entity<Payment>()
                .HasRequired(p => p.Driver) // Payment требует Driver
                .WithMany() // У Driver может быть много Payments
                .HasForeignKey(p => p.DriverID) // Внешний ключ в Payment
                .WillCascadeOnDelete(false); // Отключаем каскадное удаление

            // Настройка связи между Payment и Fine
            modelBuilder.Entity<Payment>()
                .HasRequired(p => p.Fine)
                .WithMany()
                .HasForeignKey(p => p.FineID);

            // Настройка связи между Payment и PaymentMethod
            modelBuilder.Entity<Payment>()
                .HasRequired(p => p.PaymentMethod)
                .WithMany()
                .HasForeignKey(p => p.PaymentMethodID);

            // Остальные настройки
            modelBuilder.Entity<User>()
                .HasRequired(u => u.Role)
                .WithMany()
                .HasForeignKey(u => u.RoleID);

            modelBuilder.Entity<Driver>()
                .HasRequired(d => d.User)
                .WithMany()
                .HasForeignKey(d => d.UserID);

            modelBuilder.Entity<GAIEmployee>()
                .HasKey(e => e.EmployeeID);
            modelBuilder.Entity<GAIEmployee>()
                .Property(e => e.FullName)
                .IsRequired();
            modelBuilder.Entity<GAIEmployee>()
                .Property(e => e.Position)
                .IsRequired();

            modelBuilder.Entity<Fine>()
                .HasRequired(f => f.Driver)
                .WithMany()
                .HasForeignKey(f => f.DriverID);

            modelBuilder.Entity<Fine>()
                .HasRequired(f => f.Violation)
                .WithMany()
                .HasForeignKey(f => f.ViolationID);

            modelBuilder.Entity<Vehicle>()
                .HasRequired(v => v.Brand)
                .WithMany()
                .HasForeignKey(v => v.BrandID);

            modelBuilder.Entity<Vehicle>()
                .HasRequired(v => v.Driver)
                .WithMany()
                .HasForeignKey(v => v.OwnerID);

            base.OnModelCreating(modelBuilder);
        }
    }
}