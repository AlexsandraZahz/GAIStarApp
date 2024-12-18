using System.Windows;
using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;

namespace GAIStarApp.Roles.TrafficPoliceOfficer
{
    public partial class ReportDetailsWindow : Window
    {
        public Report Report { get; set; }

        public ReportDetailsWindow(int reportID)
        {
            InitializeComponent();
            LoadReportDetails(reportID); // Загружаем данные отчета
            DataContext = Report; 
        }

        // Метод для загрузки подробностей отчета по его ID
        private void LoadReportDetails(int reportID)
        {
            using (var context = new GAIContext())
            {
                // Ищем отчет в базе данных по его ID
                Report = context.Reports.Find(reportID);
            }
        }

        // Обработчик события для кнопки "Назад"
        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            this.Close(); // Закрываем текущее окно
        }
    }
}