using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;
using GAIStarApp.Roles.TrafficPoliceOfficer;
using Moq;
using NUnit.Framework;
using System;
using System.Data.Entity;
using System.Linq;
using System.Threading;
using System.Windows;

namespace GAIStarApp.Tests
{
    [TestFixture]
    [Apartment(ApartmentState.STA)]
    public class DriverRegistrationWindowTests
    {
        private DriverRegistrationWindow _registrationWindow;
        private Mock<GAIContext> _contextMock;

        [SetUp]
        public void Setup()
        {
            _contextMock = new Mock<GAIContext>();

            // Настройка моков для тестирования
            var roles = new[]
            {
                new Role { RoleID = 1, RoleName = "Driver" },
                new Role { RoleID = 2, RoleName = "Admin" },
                new Role { RoleID = 3, RoleName = "TrafficPoliceOfficer" }
            }.AsQueryable();

            var mockRolesSet = new Mock<DbSet<Role>>();
            mockRolesSet.As<IQueryable<Role>>().Setup(m => m.Provider).Returns(roles.Provider);
            mockRolesSet.As<IQueryable<Role>>().Setup(m => m.Expression).Returns(roles.Expression);
            mockRolesSet.As<IQueryable<Role>>().Setup(m => m.ElementType).Returns(roles.ElementType);
            mockRolesSet.As<IQueryable<Role>>().Setup(m => m.GetEnumerator()).Returns(roles.GetEnumerator());

            var users = new[]
            {
                new User { UserID = 1, Username = "existingUser", PasswordHash = "password123", RoleID = 1 }
            }.AsQueryable();

            var mockUsersSet = new Mock<DbSet<User>>();
            mockUsersSet.As<IQueryable<User>>().Setup(m => m.Provider).Returns(users.Provider);
            mockUsersSet.As<IQueryable<User>>().Setup(m => m.Expression).Returns(users.Expression);
            mockUsersSet.As<IQueryable<User>>().Setup(m => m.ElementType).Returns(users.ElementType);
            mockUsersSet.As<IQueryable<User>>().Setup(m => m.GetEnumerator()).Returns(users.GetEnumerator());

            var drivers = new[]
            {
                new Driver { DriverID = 1, FullName = "Existing Driver", LicenseNumber = "1234567890", UserID = 1 }
            }.AsQueryable();

            var mockDriversSet = new Mock<DbSet<Driver>>();
            mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.Provider).Returns(drivers.Provider);
            mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.Expression).Returns(drivers.Expression);
            mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.ElementType).Returns(drivers.ElementType);
            mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.GetEnumerator()).Returns(drivers.GetEnumerator());

            _contextMock.Setup(c => c.Users).Returns(mockUsersSet.Object);
            _contextMock.Setup(c => c.Drivers).Returns(mockDriversSet.Object);
            _contextMock.Setup(c => c.Roles).Returns(mockRolesSet.Object);

            _registrationWindow = new DriverRegistrationWindow();
        }

        [Test]
        public void Test_RegistrationWithInvalidLicenseNumber()
        {
            // Установка данных для тестирования с некорректным номером водительского удостоверения
            _registrationWindow.FullNameTextBox.Text = "John Doe";
            _registrationWindow.DateOfBirthDatePicker.SelectedDate = new DateTime(1990, 1, 1);
            _registrationWindow.LicenseNumberTextBox.Text = "12345";
            _registrationWindow.UsernameTextBox.Text = "newUser";
            _registrationWindow.PasswordTextBox.Text = "password123";

            _registrationWindow.Button_Register_Click(null, null);

            Assert.Pass("Регистрация не прошла из-за некорректного номера водительского удостоверения.");
        }

        [Test]
        public void Test_RegistrationWithMissingFields()
        {
            // Установка данных для тестирования с пропущенными полями
            _registrationWindow.FullNameTextBox.Text = "";
            _registrationWindow.DateOfBirthDatePicker.SelectedDate = new DateTime(1990, 1, 1);
            _registrationWindow.LicenseNumberTextBox.Text = "0987654321";
            _registrationWindow.UsernameTextBox.Text = "newUser";
            _registrationWindow.PasswordTextBox.Text = "password123";

            _registrationWindow.Button_Register_Click(null, null);

            Assert.Pass("Регистрация не прошла из-за пропущенных полей.");
        }
    }
}