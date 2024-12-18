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
    public partial class AccidentRegistrationWindow : Window
    {
        public List<GAIStarApp.DataAccess.Models.Driver> _drivers;
        public List<Vehicle> _vehicles;

        public AccidentRegistrationWindow()
        {
            InitializeComponent();
            LoadDrivers();

            AccidentTimeTextBox.PreviewTextInput += AccidentTimeTextBox_PreviewTextInput;
            DamageAmountTextBox.PreviewTextInput += DamageAmountTextBox_PreviewTextInput;
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Закрываем текущее окно и возвращаемся на предыдущее
            this.Close();
            WindowManager.ShowWindow<ProtocolTypeWindow>();
        }

        public void Button_Register_Click(object sender, RoutedEventArgs e)
        {
            // Логика для регистрации ДТП
            if (!int.TryParse(DriverComboBox.SelectedValue?.ToString(), out int driverID))
            {
                MessageBox.Show("Пожалуйста, выберите водителя!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!int.TryParse(VehicleComboBox.SelectedValue?.ToString(), out int vehicleID))
            {
                MessageBox.Show("Пожалуйста, выберите транспортное средство!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            DateTime? accidentDate = AccidentDatePicker.SelectedDate;
            string accidentTimeString = AccidentTimeTextBox.Text; // Строка времени
            TimeSpan accidentTime;

            // Проверяем, что время введено корректно
            if (!TimeSpan.TryParse(accidentTimeString, out accidentTime))
            {
                MessageBox.Show("Неверный формат времени!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            string location = LocationTextBox.Text;
            string description = DescriptionTextBox.Text;
            decimal damageAmount;

            if (!decimal.TryParse(DamageAmountTextBox.Text, out damageAmount))
            {
                MessageBox.Show("Неверный формат суммы ущерба!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Проверка на заполнение всех полей
            if (!accidentDate.HasValue || string.IsNullOrWhiteSpace(location) || string.IsNullOrWhiteSpace(description))
            {
                MessageBox.Show("Пожалуйста, заполните все поля!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Сохраняем данные в базу данных
            using (var context = new GAIContext())
            {
                var accident = new Accident
                {
                    Date = accidentDate.Value,
                    Time = accidentTime,
                    Location = location,
                    Description = description,
                    DamageAmount = damageAmount,
                    VehicleID = vehicleID
                };

                context.Accidents.Add(accident);
                context.SaveChanges();
            }

            MessageBox.Show($"ДТП успешно зарегистрировано!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            this.Close();
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

        private void DriverComboBox_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            if (DriverComboBox.SelectedItem is GAIStarApp.DataAccess.Models.Driver selectedDriver)
            {
                LoadVehiclesForDriver(selectedDriver.DriverID);
            }
        }

        public void LoadVehiclesForDriver(int driverID)
        {
            // Загружаем транспортные средства для выбранного водителя
            using (var context = new GAIContext())
            {
                _vehicles = context.Vehicles.Where(v => v.OwnerID == driverID).ToList();
                VehicleComboBox.ItemsSource = _vehicles;
                VehicleComboBox.DisplayMemberPath = "LicensePlate";
                VehicleComboBox.SelectedValuePath = "VehicleID";
            }
        }

        // Обработчик для Времени ДТП (только цифры и двоеточие)
        private void AccidentTimeTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, e.Text.Length - 1) && e.Text != ":")
            {
                e.Handled = true; // Отклоняем ввод
            }
        }

        // Обработчик для Суммы ущерба (только цифры и точка)
        private void DamageAmountTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            // Регулярное выражение для проверки ввода (только цифры и одна точка)
            Regex regex = new Regex(@"^[0-9]*\.?[0-9]*$");
            if (!regex.IsMatch(DamageAmountTextBox.Text + e.Text))
            {
                e.Handled = true; // Отклоняем ввод
            }
        }
    }
}