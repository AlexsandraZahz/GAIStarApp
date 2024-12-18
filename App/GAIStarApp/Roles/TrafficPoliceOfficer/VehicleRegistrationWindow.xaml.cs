using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;
using GAIStarApp.Helpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Input;

namespace GAIStarApp.Roles.TrafficPoliceOfficer
{
    public partial class VehicleRegistrationWindow : Window
    {
        private List<Brand> _brands;
        private List<GAIStarApp.DataAccess.Models.Driver> _drivers;

        public VehicleRegistrationWindow()
        {
            InitializeComponent();
            LoadBrands();
            LoadDrivers();
            VINTextBox.PreviewTextInput += VINTextBox_PreviewTextInput;
            LicensePlateTextBox.PreviewTextInput += LicensePlateTextBox_PreviewTextInput;
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Закрываем текущее окно и возвращаемся на предыдущее
            this.Close();
            WindowManager.ShowWindow<RegistrationTypeWindow>();
        }

        public void Button_Register_Click(object sender, RoutedEventArgs e)
        {
            // Логика для регистрации транспортного средства
            if (!int.TryParse(BrandComboBox.SelectedValue?.ToString(), out int brandID))
            {
                MessageBox.Show("Пожалуйста, выберите бренд!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            string model = ModelTextBox.Text;
            string vin = VINTextBox.Text;
            string licensePlate = LicensePlateTextBox.Text;
            string insuranceInfo = InsuranceInfoTextBox.Text;

            if (!int.TryParse(DriverComboBox.SelectedValue?.ToString(), out int driverID))
            {
                MessageBox.Show("Пожалуйста, выберите водителя!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Проверка на заполнение всех полей
            if (string.IsNullOrWhiteSpace(model) || string.IsNullOrWhiteSpace(vin) ||
                string.IsNullOrWhiteSpace(licensePlate) || string.IsNullOrWhiteSpace(insuranceInfo))
            {
                MessageBox.Show("Пожалуйста, заполните все поля!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Проверка длины данных
            if (model.Length > 50)
            {
                MessageBox.Show("Длина модели превышает допустимую длину (50 символов)!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (vin.Length != 17)
            {
                MessageBox.Show("VIN должен состоять ровно из 17 символов!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (licensePlate.Length > 10)
            {
                MessageBox.Show("Длина номера автомобиля превышает допустимую длину (10 символов)!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (insuranceInfo.Length > 100)
            {
                MessageBox.Show("Длина информации о страховке превышает допустимую длину (100 символов)!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Проверка существования водителя
            if (!_drivers.Any(d => d.DriverID == driverID))
            {
                MessageBox.Show("Выбранный водитель не существует!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Проверка формата госномера
            if (!Regex.IsMatch(licensePlate, @"^[А-ЯA-Z]\d{3}[А-ЯA-Z]{2}\d{2,3}$"))
            {
                MessageBox.Show("Неверный формат госномера! Ожидается формат: 1 буква, 3 цифры, 2 буквы, 2-3 цифры.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Сохраняем данные в базу данных
            try
            {
                using (var context = new GAIContext())
                {
                    var vehicle = new Vehicle
                    {
                        BrandID = brandID,
                        Model = model,
                        VIN = vin,
                        LicensePlate = licensePlate,
                        OwnerID = driverID,
                        InsuranceInfo = insuranceInfo
                    };

                    context.Vehicles.Add(vehicle);
                    context.SaveChanges();
                }

                MessageBox.Show($"Транспортное средство {model} успешно зарегистрировано!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close(); // Закрываем окно после успешной регистрации
            }
            catch (SqlException ex)
            {
                if (ex.Number == 8152) // Код ошибки для усечения данных
                {
                    MessageBox.Show("Данные превышают допустимую длину для одного из полей!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    MessageBox.Show($"Ошибка при сохранении данных: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Неизвестная ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void LoadBrands()
        {
            // Загружаем бренды из базы данных
            using (var context = new GAIContext())
            {
                _brands = context.Brands.ToList();
                BrandComboBox.ItemsSource = _brands;
                BrandComboBox.DisplayMemberPath = "Description";
                BrandComboBox.SelectedValuePath = "BrandID";
            }
        }

        private void LoadDrivers()
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

        // Обработчик для VIN (только буквы и цифры)
        private void VINTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true; // Отклоняем ввод
            }
        }

        // Обработчик для Госномера (только буквы и цифры)
        private void LicensePlateTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true; // Отклоняем ввод
            }
        }

        // Публичные методы для тестирования
        public void SetBrand(int brandID)
        {
            BrandComboBox.SelectedValue = brandID;
        }

        public void SetModel(string model)
        {
            ModelTextBox.Text = model;
        }

        public void SetVIN(string vin)
        {
            VINTextBox.Text = vin;
        }

        public void SetLicensePlate(string licensePlate)
        {
            LicensePlateTextBox.Text = licensePlate;
        }

        public void SetDriver(int driverID)
        {
            DriverComboBox.SelectedValue = driverID;
        }

        public void SetInsuranceInfo(string insuranceInfo)
        {
            InsuranceInfoTextBox.Text = insuranceInfo;
        }

        public void SimulateRegisterButtonClick()
        {
            Button_Register_Click(null, null);
        }
    }
}