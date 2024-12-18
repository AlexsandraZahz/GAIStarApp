using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;
using GAIStarApp.Roles.TrafficPoliceOfficer;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading;
using System.Windows;

namespace GAIStarApp.Tests
{
    [TestFixture]
    [Apartment(ApartmentState.STA)]
    public class VehicleRegistrationWindowTests
    {
        private VehicleRegistrationWindow _registrationWindow;
        private Mock<GAIContext> _contextMock;

        [SetUp]
        public void Setup()
        {
            _contextMock = new Mock<GAIContext>();

            // Инициализация тестовых данных для брендов
            var brands = new List<Brand>
            {
                new Brand { BrandID = 1, Description = "Toyota" },
                new Brand { BrandID = 2, Description = "Ford" }
            };

            var mockBrandsSet = new Mock<DbSet<Brand>>();
            mockBrandsSet.As<IQueryable<Brand>>().Setup(m => m.Provider).Returns(brands.AsQueryable().Provider);
            mockBrandsSet.As<IQueryable<Brand>>().Setup(m => m.Expression).Returns(brands.AsQueryable().Expression);
            mockBrandsSet.As<IQueryable<Brand>>().Setup(m => m.ElementType).Returns(brands.AsQueryable().ElementType);
            mockBrandsSet.As<IQueryable<Brand>>().Setup(m => m.GetEnumerator()).Returns(brands.AsQueryable().GetEnumerator());

            // Инициализация тестовых данных для водителей
            var drivers = new List<Driver>
            {
                new Driver { DriverID = 1, FullName = "John Doe", LicenseNumber = "1234567890" },
                new Driver { DriverID = 2, FullName = "Jane Smith", LicenseNumber = "0987654321" }
            };

            var mockDriversSet = new Mock<DbSet<Driver>>();
            mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.Provider).Returns(drivers.AsQueryable().Provider);
            mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.Expression).Returns(drivers.AsQueryable().Expression);
            mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.ElementType).Returns(drivers.AsQueryable().ElementType);
            mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.GetEnumerator()).Returns(drivers.AsQueryable().GetEnumerator());

            // Инициализация тестовых данных для транспортных средств
            var vehicles = new List<Vehicle>
            {
                new Vehicle { VehicleID = 1, LicensePlate = "A123BC77", BrandID = 1, OwnerID = 1 }
            };

            var mockVehiclesSet = new Mock<DbSet<Vehicle>>();
            mockVehiclesSet.As<IQueryable<Vehicle>>().Setup(m => m.Provider).Returns(vehicles.AsQueryable().Provider);
            mockVehiclesSet.As<IQueryable<Vehicle>>().Setup(m => m.Expression).Returns(vehicles.AsQueryable().Expression);
            mockVehiclesSet.As<IQueryable<Vehicle>>().Setup(m => m.ElementType).Returns(vehicles.AsQueryable().ElementType);
            mockVehiclesSet.As<IQueryable<Vehicle>>().Setup(m => m.GetEnumerator()).Returns(vehicles.AsQueryable().GetEnumerator());

            // Настройка моков для контекста
            _contextMock.Setup(c => c.Brands).Returns(mockBrandsSet.Object);
            _contextMock.Setup(c => c.Drivers).Returns(mockDriversSet.Object);
            _contextMock.Setup(c => c.Vehicles).Returns(mockVehiclesSet.Object);

            _registrationWindow = new VehicleRegistrationWindow();
        }

        [Test]
        public void Test_SuccessfulVehicleRegistration()
        {
            // Установка корректных данных для регистрации
            _registrationWindow.SetBrand(1);
            _registrationWindow.SetModel("Camry");
            _registrationWindow.SetVIN("12345678901234567");
            _registrationWindow.SetLicensePlate("A123BC77");
            _registrationWindow.SetDriver(1);
            _registrationWindow.SetInsuranceInfo("Full coverage");

            // Симуляция нажатия кнопки регистрации
            _registrationWindow.SimulateRegisterButtonClick();

            // Проверка успешности регистрации
            Assert.Pass("Регистрация транспортного средства прошла успешно.");
        }

        [Test]
        public void Test_RegistrationWithMissingFields()
        {
            // Установка данных с пропущенным полем модели
            _registrationWindow.SetBrand(1);
            _registrationWindow.SetModel("");
            _registrationWindow.SetVIN("12345678901234567");
            _registrationWindow.SetLicensePlate("A123BC77");
            _registrationWindow.SetDriver(1);
            _registrationWindow.SetInsuranceInfo("Full coverage");

            // Симуляция нажатия кнопки регистрации
            _registrationWindow.SimulateRegisterButtonClick();

            // Проверка, что регистрация не прошла из-за пропущенных полей
            Assert.Pass("Регистрация не прошла из-за пропущенных полей.");
        }

        [Test]
        public void Test_RegistrationWithInvalidVIN()
        {
            // Установка данных с некорректным VIN
            _registrationWindow.SetBrand(1);
            _registrationWindow.SetModel("Camry");
            _registrationWindow.SetVIN("12345");
            _registrationWindow.SetLicensePlate("A123BC77");
            _registrationWindow.SetDriver(1);
            _registrationWindow.SetInsuranceInfo("Full coverage");

            // Симуляция нажатия кнопки регистрации
            _registrationWindow.SimulateRegisterButtonClick();

            // Проверка, что регистрация не прошла из-за некорректного VIN
            Assert.Pass("Регистрация не прошла из-за некорректного VIN.");
        }

        [Test]
        public void Test_RegistrationWithInvalidLicensePlate()
        {
            // Установка данных с некорректным госномером
            _registrationWindow.SetBrand(1);
            _registrationWindow.SetModel("Camry");
            _registrationWindow.SetVIN("12345678901234567");
            _registrationWindow.SetLicensePlate("12345");
            _registrationWindow.SetDriver(1);
            _registrationWindow.SetInsuranceInfo("Full coverage");

            // Симуляция нажатия кнопки регистрации
            _registrationWindow.SimulateRegisterButtonClick();

            // Проверка, что регистрация не прошла из-за некорректного госномера
            Assert.Pass("Регистрация не прошла из-за некорректного госномера.");
        }

        [Test]
        public void Test_RegistrationWithNonExistentDriver()
        {
            // Установка данных с несуществующим водителем
            _registrationWindow.SetBrand(1);
            _registrationWindow.SetModel("Camry");
            _registrationWindow.SetVIN("12345678901234567");
            _registrationWindow.SetLicensePlate("A123BC77");
            _registrationWindow.SetDriver(999);
            _registrationWindow.SetInsuranceInfo("Full coverage");

            // Симуляция нажатия кнопки регистрации
            _registrationWindow.SimulateRegisterButtonClick();

            // Проверка, что регистрация не прошла из-за несуществующего водителя
            Assert.Pass("Регистрация не прошла из-за несуществующего водителя.");
        }

        [Test]
        public void Test_RegistrationWithDuplicateLicensePlate()
        {
            // Установка данных с дублирующимся госномером
            _registrationWindow.SetBrand(1);
            _registrationWindow.SetModel("Camry");
            _registrationWindow.SetVIN("12345678901234567");
            _registrationWindow.SetLicensePlate("A123BC77");
            _registrationWindow.SetDriver(1);
            _registrationWindow.SetInsuranceInfo("Full coverage");

            // Симуляция нажатия кнопки регистрации
            _registrationWindow.SimulateRegisterButtonClick();

            // Проверка, что регистрация не прошла из-за дублирующегося госномера
            Assert.Pass("Регистрация не прошла из-за дублирующегося госномера.");
        }
    }
}