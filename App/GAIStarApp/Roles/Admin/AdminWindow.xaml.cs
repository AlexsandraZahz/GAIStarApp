using GAIStarApp.Helpers;
using System.Windows;

namespace GAIStarApp.Roles.Admin
{
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();
        }

        // Обработчик события для кнопки "Выход"
        private void Button_Exit_Click(object sender, RoutedEventArgs e)
        {
            // Показываем диалоговое окно для подтверждения выхода
            MessageBoxResult result = MessageBox.Show(
                "Вы уверены, что хотите выйти?",
                "Подтверждение выхода",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question);

            // Если пользователь подтвердил выход, возвращаемся на главную страницу и закрываем текущее окно
            if (result == MessageBoxResult.Yes)
            {
                WindowManager.ShowWindow<MainWindow>();
                this.Close();
            }
        }

        // Обработчик события для кнопки "Управление камерами"
        private void Button_ManageCameras_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно для управления камерами
            WindowManager.ShowWindow<ManageCamerasWindow>();
        }

        // Обработчик события для кнопки "Управление пользователями"
        private void Button_ManageUsers_Click(object sender, RoutedEventArgs e)
        {
            // Открываем окно для управления пользователями
            WindowManager.ShowWindow<ManageUsersWindow>();
        }
    }
}