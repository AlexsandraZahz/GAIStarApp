using System.Windows;
using GAIStarApp.Helpers;

namespace GAIStarApp.Roles.Driver
{
    public partial class DriverWindow : Window
    {
        private int driverID; // ID водителя

        public DriverWindow(int driverID)
        {
            InitializeComponent();
            this.driverID = driverID;
        }

        private void Button_Exit_Click(object sender, RoutedEventArgs e)
        {
            // Показываем предупреждение с вопросом
            MessageBoxResult result = MessageBox.Show(
                "Вы уверены, что хотите выйти?",
                "Подтверждение выхода",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question);

            // Если пользователь нажал "Да"
            if (result == MessageBoxResult.Yes)
            {
                // Закрываем текущее окно и возвращаемся в MainWindow
                WindowManager.ShowWindow<MainWindow>();
                this.Close();
            }
        }

        private void Button_ViewVehicle_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно с информацией о транспортном средстве
            WindowManager.ShowDialogWindow<VehicleInfoWindow>(driverID);
        }

        private void Button_Fines_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно со списком штрафов
            WindowManager.ShowWindow<FinesWindow>(driverID);
        }

        private void Button_PaymentHistory_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно с историей платежей
            WindowManager.ShowWindow<PaymentHistoryWindow>(driverID);
        }
    }
}