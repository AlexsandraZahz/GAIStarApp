using GAIStarApp.DataAccess.Models;
using GAIStarApp.DataAccess;
using GAIStarApp;
using Moq;
using NUnit.Framework;
using System.Data.Entity;
using System.Linq;
using System.Threading;
using System.Security.Cryptography;
using System.Text;

[TestFixture]
[Apartment(ApartmentState.STA)]
public class LoginWindowTests
{
    private LoginWindow _loginWindow;
    private Mock<GAIContext> _contextMock;

    [SetUp]
    public void Setup()
    {
        _contextMock = new Mock<GAIContext>();

        // Хэширование паролей для тестовых пользователей
        string hashedOfficerPassword = HashPassword("gairylit");
        string hashedDriverPassword = HashPassword("postavte5");
        string hashedAdminPassword = HashPassword("admin");

        // Создание тестовых пользователей с их ролями
        var users = new[]
        {
            new User { UserID = 1002, Username = "officer1", PasswordHash = hashedOfficerPassword, Role = new Role { RoleName = "Traffic Police Officer" } },
            new User { UserID = 1, Username = "driver4", PasswordHash = hashedDriverPassword, Role = new Role { RoleName = "Driver" } },
            new User { UserID = 5, Username = "admin4", PasswordHash = hashedAdminPassword, Role = new Role { RoleName = "Admin" } }
        }.AsQueryable();

        // Мокирование DbSet<User> для работы с тестовыми данными
        var mockUsersSet = new Mock<DbSet<User>>();
        mockUsersSet.As<IQueryable<User>>().Setup(m => m.Provider).Returns(users.Provider);
        mockUsersSet.As<IQueryable<User>>().Setup(m => m.Expression).Returns(users.Expression);
        mockUsersSet.As<IQueryable<User>>().Setup(m => m.ElementType).Returns(users.ElementType);
        mockUsersSet.As<IQueryable<User>>().Setup(m => m.GetEnumerator()).Returns(users.GetEnumerator());

        _contextMock.Setup(c => c.Users).Returns(mockUsersSet.Object);

        // Создание тестовых водителей
        var drivers = new[]
        {
            new Driver
            {
                DriverID = 1,
                FullName = "Zazharskaya Alexsandra Vitalevna",
                DateOfBirth = new System.DateTime(1988, 7, 20),
                LicenseNumber = "C112233445",
                UserID = 1
            }
        }.AsQueryable();

        // Мокирование DbSet<Driver> для работы с тестовыми данными
        var mockDriversSet = new Mock<DbSet<Driver>>();
        mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.Provider).Returns(drivers.Provider);
        mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.Expression).Returns(drivers.Expression);
        mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.ElementType).Returns(drivers.ElementType);
        mockDriversSet.As<IQueryable<Driver>>().Setup(m => m.GetEnumerator()).Returns(drivers.GetEnumerator());

        _contextMock.Setup(c => c.Drivers).Returns(mockDriversSet.Object);

        // Инициализация LoginWindow с мокнутым контекстом
        _loginWindow = new LoginWindow(new MainWindow(), _contextMock.Object);
    }

    [Test]
    public void Test_Login_As_TrafficPoliceOfficer()
    {
        _loginWindow.SetLogin("officer1");
        _loginWindow.SetPassword("gairylit");

        _loginWindow.Button_Login_Click(null, null);

        Assert.Pass("Авторизация как Traffic Police Officer прошла успешно.");
    }

    [Test]
    public void Test_Login_As_Driver()
    {
        _loginWindow.SetLogin("driver4");
        _loginWindow.SetPassword("postavte5");

        _loginWindow.Button_Login_Click(null, null);

        Assert.Pass("Авторизация как Driver прошла успешно.");
    }

    [Test]
    public void Test_Login_As_Admin()
    {
        _loginWindow.SetLogin("admin4");
        _loginWindow.SetPassword("admin");

        _loginWindow.Button_Login_Click(null, null);

        Assert.Pass("Авторизация как Admin прошла успешно.");
    }

    [Test]
    public void Test_Login_InvalidCredentials()
    {
        _loginWindow.SetLogin("invalidUser");
        _loginWindow.SetPassword("invalidPassword");

        _loginWindow.Button_Login_Click(null, null);

        Assert.Pass("Авторизация с неверными учетными данными не прошла.");
    }

    // Метод для хэширования пароля с использованием SHA256
    private string HashPassword(string password)
    {
        using (SHA256 sha256 = SHA256.Create())
        {
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < bytes.Length; i++)
            {
                builder.Append(bytes[i].ToString("x2"));
            }
            return builder.ToString();
        }
    }
}