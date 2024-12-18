using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;
using GAIStarApp.Helpers;
using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Windows;
using System.Windows.Input;

namespace GAIStarApp.Roles.TrafficPoliceOfficer
{
    public partial class DriverRegistrationWindow : Window
    {
        public DriverRegistrationWindow()
        {
            InitializeComponent();

            FullNameTextBox.PreviewTextInput += FullNameTextBox_PreviewTextInput;
            LicenseNumberTextBox.PreviewTextInput += LicenseNumberTextBox_PreviewTextInput;
            UsernameTextBox.PreviewTextInput += UsernameTextBox_PreviewTextInput;
            PasswordTextBox.PreviewTextInput += PasswordTextBox_PreviewTextInput;
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Закрываем текущее окно и возвращаемся на предыдущее
            this.Close();
            WindowManager.ShowWindow<RegistrationTypeWindow>();
        }

        // Обработчик кнопки "Зарегистрировать"
        public void Button_Register_Click(object sender, RoutedEventArgs e)
        {
              string driverFullName = FullNameTextBox.Text; // Имя водителя
            DateTime? driverDateOfBirth = DateOfBirthDatePicker.SelectedDate; 

            if (!driverDateOfBirth.HasValue)
            {
                MessageBox.Show("Пожалуйста, выберите дату рождения!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            string driverLicenseNumber = LicenseNumberTextBox.Text; 
            string userUsername = UsernameTextBox.Text;
            string userPassword = PasswordTextBox.Text; 

            // Проверка на заполнение всех полей
            if (string.IsNullOrWhiteSpace(driverFullName) || string.IsNullOrWhiteSpace(driverLicenseNumber) ||
                string.IsNullOrWhiteSpace(userUsername) || string.IsNullOrWhiteSpace(userPassword))
            {
                MessageBox.Show("Пожалуйста, заполните все поля!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Проверка длины данных
            if (driverFullName.Length > 100) 
            {
                MessageBox.Show("Длина имени превышает допустимую длину (100 символов)!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (driverLicenseNumber.Length != 10) 
            {
                MessageBox.Show("Номер водительского удостоверения должен состоять ровно из 10 символов!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (userUsername.Length > 50) 
            {
                MessageBox.Show("Длина логина превышает допустимую длину (50 символов)!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (userPassword.Length > 50) 
            {
                MessageBox.Show("Длина пароля превышает допустимую длину (50 символов)!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Хэшируем пароль перед сохранением в базу данных
            string hashedPassword = HashPassword(userPassword);

            // Сохраняем данные в базу данных
            using (var context = new GAIContext())
            {
                if (context.Users.Any(u => u.Username == userUsername))
                {
                    MessageBox.Show("Пользователь с таким логином уже существует!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                var newUser = new User
                {
                    Username = userUsername,
                    PasswordHash = hashedPassword, 
                    RoleID = 1 
                };


                context.Users.Add(newUser);
                context.SaveChanges(); 

                // Создаём нового водителя
                var newDriver = new GAIStarApp.DataAccess.Models.Driver 
                {
                    FullName = driverFullName,
                    DateOfBirth = driverDateOfBirth.Value,
                    LicenseNumber = driverLicenseNumber,
                    UserID = newUser.UserID 
                };

                context.Drivers.Add(newDriver);
                context.SaveChanges();
            }

            MessageBox.Show($"Водитель {driverFullName} успешно зарегистрирован!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            this.Close();
        }

        // Метод для хэширования пароля
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

        // Обработчик ввода для FullNameTextBox
        private void FullNameTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsLetter(e.Text, e.Text.Length - 1) && e.Text != " ")
            {
                e.Handled = true;
            }
        }

        // Обработчик ввода для LicenseNumberTextBox
        private void LicenseNumberTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true;
            }
        }

        // Обработчик ввода для UsernameTextBox
        private void UsernameTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true;
            }
        }

        // Обработчик ввода для PasswordTextBox
        private void PasswordTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true;
            }
        }
    }
}