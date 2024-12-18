using System.Windows;
using System.Linq;
using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;
using System.Collections.Generic;
using System.Windows.Controls;
using GAIStarApp.Helpers;

namespace GAIStarApp.Roles.TrafficPoliceOfficer
{
    public partial class ReportsWindow : Window
    {
        public List<Report> Reports { get; set; } 

        public ReportsWindow()
        {
            InitializeComponent();
            LoadReports();
            DataContext = this; 
        }

        private void LoadReports()
        {
            using (var context = new GAIContext())
            {
                // Загружаем все отчеты из базы данных
                Reports = context.Reports.ToList();
            }

            // Убедимся, что ReportsListView инициализирован
            if (ReportsListView != null)
            {
                ReportsListView.ItemsSource = Reports;
            }
        }

        private void FilterComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // Применяем фильтр
            var selectedFilter = (FilterComboBox.SelectedItem as ComboBoxItem)?.Content.ToString();
            ApplyFilter(selectedFilter);
        }

        private void ApplyFilter(string filter)
        {
            using (var context = new GAIContext())
            {
                if (filter == "Все")
                {
                    Reports = context.Reports.ToList();
                }
                else if (filter == "Нарушение")
                {
                    Reports = context.Reports.Where(r => r.ReportType == "Violation").ToList();
                }
                else if (filter == "ДТП")
                {
                    Reports = context.Reports.Where(r => r.ReportType == "Accident").ToList();
                }
            }

            // Обновляем ListView, если он инициализирован
            if (ReportsListView != null)
            {
                ReportsListView.ItemsSource = Reports;
            }
        }

        private void Button_Details_Click(object sender, RoutedEventArgs e)
        {
            // Получаем выбранный отчет
            var button = sender as Button;
            var report = button?.DataContext as Report;

            if (report != null)
            {
                // Открываем окно с подробной информацией об отчете через WindowManager
                WindowManager.ShowDialogWindow<ReportDetailsWindow>(report.ReportID);
            }
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Возвращаемся на предыдущее окно (TrafficPoliceWindow) через WindowManager
            WindowManager.ShowWindow<TrafficPoliceWindow>();
            this.Close();
        }
    }
}