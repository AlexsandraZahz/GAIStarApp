using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;
using GAIStarApp.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace GAIStarApp.Roles.TrafficPoliceOfficer
{
    public partial class ViolationRegistrationWindow : Window
    {
        public List<GAIStarApp.DataAccess.Models.Driver> _drivers;
        public List<Violation> _violations;

        public ViolationRegistrationWindow()
        {
            InitializeComponent();
            LoadDrivers();
            LoadViolations();

        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Закрываем текущее окно и возвращаемся на предыдущее
            this.Close();
            WindowManager.ShowWindow<ProtocolTypeWindow>();
        }

        public void Button_Register_Click(object sender, RoutedEventArgs e)
        {
            // Логика для регистрации нарушения
            if (!int.TryParse(DriverComboBox.SelectedValue?.ToString(), out int driverID))
            {
                MessageBox.Show("Пожалуйста, выберите водителя!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!int.TryParse(ViolationComboBox.SelectedValue?.ToString(), out int violationID))
            {
                MessageBox.Show("Пожалуйста, выберите тип нарушения!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            DateTime? violationDate = ViolationDatePicker.SelectedDate;
            decimal amount;

            if (!decimal.TryParse(AmountTextBox.Text, out amount))
            {
                MessageBox.Show("Неверный формат суммы штрафа!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            bool isPaid = IsPaidCheckBox.IsChecked ?? false;

            // Проверка на заполнение всех полей
            if (!violationDate.HasValue)
            {
                MessageBox.Show("Пожалуйста, укажите дату нарушения!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Сохраняем данные в базу данных
            using (var context = new GAIContext())
            {
                var fine = new Fine
                {
                    DriverID = driverID,
                    DateOfViolation = violationDate.Value,
                    ViolationID = violationID,
                    Amount = amount,
                    IsPaid = isPaid
                };

                context.Fines.Add(fine);
                context.SaveChanges();
            }

            MessageBox.Show($"Нарушение успешно зарегистрировано!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            this.Close(); // Закрываем окно после успешной регистрации
        }

        public void LoadDrivers()
        {
            // Загружаем водителей из базы данных
            using (var context = new GAIContext())
            {
                _drivers = context.Drivers.ToList();
                DriverComboBox.ItemsSource = _drivers;
                DriverComboBox.DisplayMemberPath = "FullName";
                DriverComboBox.SelectedValuePath = "DriverID";
            }
        }

        public void LoadViolations()
        {
            // Загружаем типы нарушений из базы данных
            using (var context = new GAIContext())
            {
                _violations = context.Violations.ToList();
                ViolationComboBox.ItemsSource = _violations;
                ViolationComboBox.DisplayMemberPath = "ViolationType";
                ViolationComboBox.SelectedValuePath = "ViolationID";
            }
        }

        // Обработчик для Суммы штрафа (только цифры и точка)
        private void AmountTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            // Регулярное выражение для проверки ввода (только цифры и одна точка)
            Regex regex = new Regex(@"^[0-9]*\.?[0-9]*$");
            if (!regex.IsMatch(AmountTextBox.Text + e.Text))
            {
                e.Handled = true; // Отклоняем ввод
            }
        }
    }
}