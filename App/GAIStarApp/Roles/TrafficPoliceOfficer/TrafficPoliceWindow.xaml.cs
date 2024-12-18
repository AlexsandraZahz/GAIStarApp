using GAIStarApp.Helpers;
using System.Windows;

namespace GAIStarApp.Roles.TrafficPoliceOfficer
{
    public partial class TrafficPoliceWindow : Window
    {
        public TrafficPoliceWindow()
        {
            InitializeComponent();
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

        private void Button_Register_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно выбора типа регистрации
            WindowManager.ShowWindow<RegistrationTypeWindow>();
        }

        private void Button_Protocols_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно выбора типа протокола (ДТП или Нарушение)
            WindowManager.ShowWindow<ProtocolTypeWindow>();
        }

        private void Button_Statistics_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно со статистикой (отчеты)
            WindowManager.ShowWindow<ReportsWindow>();
        }
    }
}