using System.Windows;
using GAIStarApp.DataAccess;
using System.Linq;
using System.Collections.Generic;
using GAIStarApp.Helpers;

namespace GAIStarApp.Roles.Driver
{
    public partial class PaymentHistoryWindow : Window
    {
        private int driverID; 
        public List<PaymentHistoryItem> PaymentHistory { get; set; } // Список оплаченных штрафов с информацией о способе оплаты

        public PaymentHistoryWindow(int driverID)
        {
            InitializeComponent();
            this.driverID = driverID;
            LoadPaymentHistory();
            DataContext = this;
        }

        // Загружаем оплаченные штрафы для текущего водителя
        private void LoadPaymentHistory()
        {
            using (var context = new GAIContext())
            {
                PaymentHistory = (from fine in context.Fines
                                  join payment in context.Payments on fine.FineID equals payment.FineID
                                  join paymentMethod in context.PaymentMethods on payment.PaymentMethodID equals paymentMethod.PaymentMethodID
                                  where fine.DriverID == driverID && fine.IsPaid
                                  select new PaymentHistoryItem
                                  {
                                      FineID = fine.FineID,
                                      Amount = fine.Amount,
                                      PaymentMethod = paymentMethod.PaymentMethodName
                                  }).ToList();
            }
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Возвращаемся на предыдущее окно (DriverWindow) через WindowManager
            WindowManager.ShowWindow<DriverWindow>(driverID);
            this.Close();
        }
    }

    // Класс для хранения данных о штрафе и способе оплаты
    public class PaymentHistoryItem
    {
        public int FineID { get; set; }
        public decimal Amount { get; set; }
        public string PaymentMethod { get; set; }
    }
}