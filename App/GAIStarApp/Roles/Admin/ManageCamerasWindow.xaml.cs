using System.Linq;
using System.Windows;
using System.Windows.Controls;
using GAIStarApp.DataAccess;
using GAIStarApp.Helpers;

namespace GAIStarApp.Roles.Admin
{
    public partial class ManageCamerasWindow : Window
    {
        public ManageCamerasWindow()
        {
            InitializeComponent();
            LoadCameras();
        }

        // Метод для загрузки списка камер из базы данных
        private void LoadCameras()
        {
            using (var context = new GAIContext())
            {
                var cameras = context.Cameras.ToList();
                CamerasDataGrid.ItemsSource = cameras;
            }
        }

        // Обработчик события для кнопки "Применить фильтр"
        private void Button_ApplyFilter_Click(object sender, RoutedEventArgs e)
        {
            // Получаем выбранный статус из ComboBox
            string selectedStatus = (StatusFilterComboBox.SelectedItem as ComboBoxItem)?.Content.ToString();

            using (var context = new GAIContext())
            {
                var cameras = context.Cameras.ToList();

                // Фильтруем камеры по выбранному статусу
                if (selectedStatus == "Online")
                {
                    cameras = cameras.Where(c => c.Status == "Online").ToList();
                }
                else if (selectedStatus == "Offline")
                {
                    cameras = cameras.Where(c => c.Status == "Offline").ToList();
                }

                // Обновляем источник данных для DataGrid
                CamerasDataGrid.ItemsSource = cameras;
            }
        }

        // Обработчик события для кнопки "Назад"
        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Возвращаемся на предыдущее окно (AdminWindow) и закрываем текущее окно
            WindowManager.ShowWindow<AdminWindow>();
            this.Close();
        }
    }
}