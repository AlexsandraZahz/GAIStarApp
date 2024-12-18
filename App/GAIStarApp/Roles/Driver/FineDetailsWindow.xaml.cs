using System.Windows;
using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;
using System.Linq;
using System.Data.Entity;
using GAIStarApp.Helpers;

namespace GAIStarApp.Roles.Driver
{
    public partial class FineDetailsWindow : Window
    {
        private int fineID; 
        private int driverID; 

        // Конструктор с двумя параметрами
        public FineDetailsWindow(int fineID, int driverID)
        {
            InitializeComponent();
            this.fineID = fineID;
            this.driverID = driverID;
            LoadFineDetails();
        }

        private void LoadFineDetails()
        {
            using (var context = new GAIContext())
            {
                // Загружаем информацию о штрафе
                var fine = context.Fines
                    .Include(f => f.Violation) // Загружаем связанный тип нарушения
                    .FirstOrDefault(f => f.FineID == fineID);

                if (fine != null)
                {
                    // Отображаем информацию о штрафе
                    FineIDTextBlock.Text = $"Штраф #{fine.FineID}";
                    DateOfViolationTextBlock.Text = $"Дата: {fine.DateOfViolation.ToShortDateString()}";
                    ViolationTypeTextBlock.Text = $"Тип нарушения: {fine.Violation?.ViolationType ?? "Нет данных"}";
                    AmountTextBlock.Text = $"Сумма штрафа: {fine.Amount:C}";

                    // Устанавливаем текст кнопки в зависимости от состояния оплаты
                    PaymentButton.Content = fine.IsPaid ? "Оплачено" : "Оплатить";
                }
                else
                {
                    // Если штраф не найден
                    FineIDTextBlock.Text = "Штраф не найден";
                    DateOfViolationTextBlock.Text = "Дата: Нет данных";
                    ViolationTypeTextBlock.Text = "Тип нарушения: Нет данных";
                    AmountTextBlock.Text = "Сумма штрафа: Нет данных";
                    PaymentButton.Content = "Оплатить";
                }
            }
        }

        private void PaymentButton_Click(object sender, RoutedEventArgs e)
        {
            using (var context = new GAIContext())
            {
                // Загружаем информацию о штрафе
                var fine = context.Fines
                    .FirstOrDefault(f => f.FineID == fineID);

                if (fine != null)
                {
                    if (fine.IsPaid)
                    {
                        // Если штраф оплачен
                        MessageBox.Show("Не надо оплачивать то, что давно оплачено)", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    else
                    {
                        // Если штраф не оплачен
                        MessageBox.Show("Рекламу Банков никто не оплатил).", "Окно оплаты", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                }
                else
                {
                    // Если штраф не найден
                    MessageBox.Show("Штраф не найден.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Возвращаемся на страницу со списком штрафов
            WindowManager.ShowWindow<FinesWindow>(driverID);
            this.Close();
        }
    }
}