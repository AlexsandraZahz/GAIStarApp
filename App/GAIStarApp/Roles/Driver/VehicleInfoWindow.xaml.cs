using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using GAIStarApp.DataAccess;
using GAIStarApp.DataAccess.Models;
using GAIStarApp.Helpers;

namespace GAIStarApp.Roles.Driver
{
    public partial class VehicleInfoWindow : Window
    {
        private int driverID; 
        private List<Vehicle> vehicles; 

        public VehicleInfoWindow(int driverID)
        {
            InitializeComponent();
            this.driverID = driverID;
            LoadVehicleInfo();
        }

        // Получаем все автомобили для текущего водителя
        private void LoadVehicleInfo()
        {
            using (var context = new GAIContext())
            {
                vehicles = context.Vehicles
                    .Include("Brand") 
                    .Include("Driver") 
                    .Where(v => v.OwnerID == driverID)
                    .ToList();


                VehicleTabControl.Items.Clear();

                // Если автомобили найдены, создаем вкладки для каждого автомобиля
                if (vehicles.Any())
                {
                    foreach (var vehicle in vehicles)
                    {
                        // Создаем новую вкладку
                        TabItem tabItem = new TabItem
                        {
                            Header = $"{vehicle.Brand?.Description} {vehicle.Model}" // Заголовок вкладки
                        };

                        // Создаем контейнер для информации
                        StackPanel vehicleInfoPanel = new StackPanel();

                        // Добавляем информацию о транспортном средстве
                        vehicleInfoPanel.Children.Add(new TextBlock
                        {
                            Text = $"Марка автомобиля: {vehicle.Brand?.Description ?? "Нет данных"}",
                            FontSize = 16,
                            Foreground = System.Windows.Media.Brushes.Black,
                            Padding = new Thickness(10)
                        });
                        vehicleInfoPanel.Children.Add(new TextBlock
                        {
                            Text = $"Модель автомобиля: {vehicle.Model ?? "Нет данных"}",
                            FontSize = 16,
                            Foreground = System.Windows.Media.Brushes.Black,
                            Padding = new Thickness(10)
                        });
                        vehicleInfoPanel.Children.Add(new TextBlock
                        {
                            Text = $"VIN-номер: {vehicle.VIN ?? "Нет данных"}",
                            FontSize = 16,
                            Foreground = System.Windows.Media.Brushes.Black,
                            Padding = new Thickness(10)
                        });
                        vehicleInfoPanel.Children.Add(new TextBlock
                        {
                            Text = $"Гос.номерной знак: {vehicle.LicensePlate ?? "Нет данных"}",
                            FontSize = 16,
                            Foreground = System.Windows.Media.Brushes.Black,
                            Padding = new Thickness(10)
                        });
                        vehicleInfoPanel.Children.Add(new TextBlock
                        {
                            Text = $"Информация о страховании: {vehicle.InsuranceInfo ?? "Нет данных"}",
                            FontSize = 16,
                            Foreground = System.Windows.Media.Brushes.Black,
                            Padding = new Thickness(10)
                        });

                        // Добавляем контейнер вкладки
                        tabItem.Content = vehicleInfoPanel;

                        VehicleTabControl.Items.Add(tabItem);
                    }
                }
                else
                {
                    // Если автомобили не найдены, добавляем пустую вкладку
                    TabItem emptyTabItem = new TabItem
                    {
                        Header = "Нет данных",
                        Content = new TextBlock
                        {
                            Text = "У вас нет зарегистрированных транспортных средств.",
                            FontSize = 16,
                            Foreground = System.Windows.Media.Brushes.Black,
                            Padding = new Thickness(10)
                        }
                    };
                    VehicleTabControl.Items.Add(emptyTabItem);
                }
            }
        }

        private void Button_Back_Click(object sender, RoutedEventArgs e)
        {
            // Возвращаемся на главную страницу водителя
            WindowManager.ShowWindow<DriverWindow>(driverID);
            this.Close();
        }
    }
}