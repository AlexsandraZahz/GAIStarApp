using System.Windows;
using System.Linq;
using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;
using System.Collections.Generic;
using System.Windows.Controls;
using GAIStarApp.Helpers; 

namespace GAIStarApp.Roles.Driver
{
    public partial class FinesWindow : Window
    {
        private int driverID; 
        public List<Fine> Fines { get; set; } 

        public FinesWindow(int driverID)
        {
            InitializeComponent();
            this.driverID = driverID;
            LoadFines();
            DataContext = this; 
        }

        // Загружаем штрафы для текущего водителя
        private void LoadFines()
        {
            using (var context = new GAIContext())
            {
                Fines = context.Fines
                    .Where(f => f.DriverID == driverID)
                    .ToList();
            }
        }

        private void Button_Details_Click(object sender, RoutedEventArgs e)
        {
            // Получаем выбранный штраф
            var button = sender as Button;
            var fine = button?.DataContext as Fine;

            if (fine != null)
            {
                // Открываем окно с подробной информацией о штрафе через WindowManager
                WindowManager.ShowDialogWindow<FineDetailsWindow>(fine.FineID, driverID);
            }
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Возвращаемся на предыдущее окно (DriverWindow) через WindowManager
            WindowManager.ShowWindow<DriverWindow>(driverID);
            this.Close();
        }
    }
}