using GAIStarApp.Helpers;
using System.Windows;

namespace GAIStarApp.Roles.TrafficPoliceOfficer
{
    public partial class RegistrationTypeWindow : Window
    {
        public RegistrationTypeWindow()
        {
            InitializeComponent();
        }

        private void Button_Vehicle_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно регистрации транспортного средства
            WindowManager.ShowWindow<VehicleRegistrationWindow>();
        }

        private void Button_Driver_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно регистрации водителя
            WindowManager.ShowWindow<DriverRegistrationWindow>();
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Закрываем текущее окно
            this.Close();
        }
    }
}