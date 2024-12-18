using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;
using GAIStarApp.Helpers;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace GAIStarApp.Roles.Admin
{
    public partial class ManageUsersWindow : Window
    {
        private GAIEmployee _selectedEmployee; // Выбранный сотрудник для редактирования

        public ManageUsersWindow()
        {
            InitializeComponent();
            LoadEmployees(); // Загружаем данные сотрудников при запуске

            // Добавляем обработчики событий для текстовых полей
            FullNameTextBox.PreviewTextInput += FullNameTextBox_PreviewTextInput;
            AddFullNameTextBox.PreviewTextInput += FullNameTextBox_PreviewTextInput;
        }

        // Метод для загрузки списка сотрудников из базы данных
        private void LoadEmployees()
        {
            using (var context = new GAIContext())
            {
                var employees = context.GAIEmployees.ToList();
                DataGrid.ItemsSource = employees;
                AddDataGrid.ItemsSource = employees;
                DeleteDataGrid.ItemsSource = employees;
            }
        }

        // Обработчик события для кнопки "Сохранить"
        private void Button_Save_Click(object sender, RoutedEventArgs e)
        {
            // Валидация данных
            if (string.IsNullOrWhiteSpace(FullNameTextBox.Text) || string.IsNullOrWhiteSpace(PositionTextBox.Text))
            {
                MessageBox.Show("Заполните все поля!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Обновляем данные сотрудника из текстовых полей
            if (_selectedEmployee == null)
            {
                MessageBox.Show("Выберите сотрудника для редактирования или добавьте нового.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            _selectedEmployee.FullName = FullNameTextBox.Text;
            _selectedEmployee.Position = PositionTextBox.Text;

            using (var context = new GAIContext())
            {
                try
                {
                    var existingEmployee = context.GAIEmployees.Find(_selectedEmployee.EmployeeID);
                    if (existingEmployee != null)
                    {
                        // Обновляем данные существующего сотрудника
                        context.Entry(existingEmployee).CurrentValues.SetValues(_selectedEmployee);
                    }
                    else
                    {
                        // Если сотрудник новый, добавляем его
                        context.GAIEmployees.Add(_selectedEmployee);
                    }

                    context.SaveChanges();
                    MessageBox.Show("Данные сохранены!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    LoadEmployees();
                    ClearFields();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при сохранении данных: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        // Обработчик события для кнопки "Удалить"
        private void Button_Delete_Click(object sender, RoutedEventArgs e)
        {
            if (_selectedEmployee == null)
            {
                MessageBox.Show("Выберите сотрудника для удаления.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var result = MessageBox.Show("Вы уверены, что хотите удалить выбранного сотрудника?", "Подтверждение", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.No)
            {
                return;
            }

            using (var context = new GAIContext())
            {
                try
                {
                    var employee = context.GAIEmployees.Find(_selectedEmployee.EmployeeID);
                    if (employee != null)
                    {
                        context.GAIEmployees.Remove(employee);
                        context.SaveChanges();
                        MessageBox.Show("Сотрудник удален!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                        LoadEmployees();
                        ClearFields();
                    }
                    else
                    {
                        MessageBox.Show("Сотрудник не найден в базе данных.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при удалении сотрудника: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        // Обработчик события для изменения выделения в DataGrid
        private void DataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (sender is DataGrid dataGrid)
            {
                _selectedEmployee = dataGrid.SelectedItem as GAIEmployee;
                if (_selectedEmployee != null)
                {
                    FullNameTextBox.Text = _selectedEmployee.FullName;
                    PositionTextBox.Text = _selectedEmployee.Position;
                }
            }
        }

        // Обработчик события для кнопки "Назад"
        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            WindowManager.ShowWindow<AdminWindow>();
            this.Close();
        }

        // Метод для очистки текстовых полей
        private void ClearFields()
        {
            FullNameTextBox.Text = string.Empty;
            PositionTextBox.Text = string.Empty;
            _selectedEmployee = null;
        }

        // Обработчик события для кнопки "Добавить"
        private void Button_Add_Click(object sender, RoutedEventArgs e)
        {
            // Валидация данных
            if (string.IsNullOrWhiteSpace(AddFullNameTextBox.Text) || string.IsNullOrWhiteSpace(AddPositionTextBox.Text))
            {
                MessageBox.Show("Заполните все поля!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var newEmployee = new GAIEmployee
            {
                FullName = AddFullNameTextBox.Text,
                Position = AddPositionTextBox.Text
            };

            using (var context = new GAIContext())
            {
                try
                {
                    context.GAIEmployees.Add(newEmployee);
                    context.SaveChanges();
                    MessageBox.Show("Сотрудник успешно добавлен!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);

                    // Очищаем поля ввода
                    AddFullNameTextBox.Text = string.Empty;
                    AddPositionTextBox.Text = string.Empty;

                    LoadEmployees();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при добавлении сотрудника: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        // Обработчик для ФИО (только буквы и пробелы)
        private void FullNameTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsLetter(e.Text, e.Text.Length - 1) && e.Text != " ")
            {
                e.Handled = true; // Отклоняем ввод
            }
        }
    }
}