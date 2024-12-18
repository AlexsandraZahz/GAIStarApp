using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Windows;
using GAIStarApp.DataAccess;
using GAIStarApp.Helpers;
using GAIStarApp.Roles.Admin;
using GAIStarApp.Roles.Driver;
using GAIStarApp.Roles.TrafficPoliceOfficer;

namespace GAIStarApp
{
    public partial class LoginWindow : Window
    {
        private MainWindow mainWindow;
        private GAIContext context;

        public LoginWindow(MainWindow mainWindow)
            : this(mainWindow, new GAIContext())
        {
        }

        public LoginWindow(MainWindow mainWindow, GAIContext context)
        {
            InitializeComponent();
            this.mainWindow = mainWindow;
            this.context = context;
        }

        public void SetLogin(string login)
        {
            LoginTextBox.Text = login;
        }

        public void SetPassword(string password)
        {
            PasswordBox.Password = password;
        }

        public void Button_Login_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginTextBox.Text;
            string password = PasswordBox.Password;

            // Проверка на инициализацию контекста базы данных
            if (context?.Users == null)
            {
                MessageBox.Show("Ошибка: контекст базы данных не инициализирован.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            string hashedPassword = HashPassword(password);

            // Поиск пользователя по логину и хешированному паролю
            var user = context.Users
                .FirstOrDefault(u => u.Username == login && u.PasswordHash == hashedPassword);

            if (user != null)
            {
                MessageBox.Show("Авторизация успешна!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);

                // Определение роли пользователя и открытие соответствующего окна
                switch (user.Role?.RoleName)
                {
                    case "Driver":
                        var driver = context.Drivers.FirstOrDefault(d => d.UserID == user.UserID);
                        if (driver != null)
                        {
                            WindowManager.ShowWindow<DriverWindow>(driver.DriverID);
                        }
                        else
                        {
                            MessageBox.Show("Данные водителя не найдены!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                        break;

                    case "Traffic Police Officer":
                        WindowManager.ShowWindow<TrafficPoliceWindow>();
                        break;

                    case "Admin":
                        WindowManager.ShowWindow<AdminWindow>();
                        break;

                    default:
                        MessageBox.Show("Неизвестная роль пользователя!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        break;
                }

                this.Close();
                mainWindow.Close();
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        // Хеширование пароля с использованием SHA256
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
}