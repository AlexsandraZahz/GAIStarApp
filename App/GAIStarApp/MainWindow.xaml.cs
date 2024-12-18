using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Media.Animation;
using System.Windows.Threading;
using GAIStarApp.Helpers;

namespace GAIStarApp
{
    public partial class MainWindow : Window
    {
        private List<string> slogans = new List<string>
        {
            "Безопасность на дорогах — наша цель!",
            "Следим за вашей безопасностью!",
            "С нами дорога становится безопаснее!",
            "Ваша безопасность — наша работа!",
            "ГАИ Star — безопасность на дорогах, сияющая как звезда!"
        };

        private int currentSloganIndex = 0;
        private DispatcherTimer sloganChangeTimer;

        public MainWindow()
        {
            InitializeComponent();

            SloganTextBlock.Text = slogans[currentSloganIndex];

            // Настройка таймера для смены слоганов
            sloganChangeTimer = new DispatcherTimer();
            sloganChangeTimer.Interval = TimeSpan.FromSeconds(2);
            sloganChangeTimer.Tick += SloganChangeTimer_Tick;
            sloganChangeTimer.Start();
        }

        private void SloganChangeTimer_Tick(object sender, EventArgs e)
        {
            // Смена слогана и запуск анимации
            currentSloganIndex = (currentSloganIndex + 1) % slogans.Count;
            SloganTextBlock.Text = slogans[currentSloganIndex];

            var storyboard = (Storyboard)FindResource("ShadowAnimation");
            storyboard.Begin();
        }

        private void Button_Authorize_Click(object sender, RoutedEventArgs e)
        {
            WindowManager.ShowDialogWindow<LoginWindow>(this);
        }
    }
}