using GAIStarApp.Helpers;
using System.Windows;

namespace GAIStarApp.Roles.TrafficPoliceOfficer
{
    public partial class ProtocolTypeWindow : Window
    {
        public ProtocolTypeWindow()
        {
            InitializeComponent();
        }

        private void Button_Accident_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно регистрации ДТП
            WindowManager.ShowWindow<AccidentRegistrationWindow>();
        }

        private void Button_Violation_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно регистрации нарушения
            WindowManager.ShowWindow<ViolationRegistrationWindow>();
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Закрываем текущее окно
            this.Close();
        }
    }
}