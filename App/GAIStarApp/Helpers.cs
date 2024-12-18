using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;

namespace GAIStarApp.Helpers
{
    public static class WindowManager
    {
        // Словарь для хранения открытых окон
        private static Dictionary<string, Window> _openWindows = new Dictionary<string, Window>();

        // Метод для открытия окна
        public static void ShowWindow<T>(params object[] args) where T : Window
        {
            // Генерируем уникальный ключ для окна
            string key = typeof(T).Name + string.Join("_", args);

            // Проверяем, открыто ли окно
            if (_openWindows.ContainsKey(key))
            {
                // Если окно открыто, активируем его
                _openWindows[key].Activate();
            }
            else
            {
                // Если окно не открыто, создаем новое
                T window = (T)Activator.CreateInstance(typeof(T), args);
                window.Closed += (s, e) => _openWindows.Remove(key); // Удаляем окно из словаря при закрытии
                _openWindows.Add(key, window);
                window.Show();
            }
        }

        // Метод для открытия окна как диалогового
        public static bool? ShowDialogWindow<T>(params object[] args) where T : Window
        {
            // Генерируем уникальный ключ для окна
            string key = typeof(T).Name + string.Join("_", args);

            // Проверяем, открыто ли окно
            if (_openWindows.ContainsKey(key))
            {
                // Если окно открыто, активируем его
                _openWindows[key].Activate();
                return true;
            }
            else
            {
                // Если окно не открыто, создаем новое
                T window = (T)Activator.CreateInstance(typeof(T), args);
                window.Closed += (s, e) => _openWindows.Remove(key); // Удаляем окно из словаря при закрытии
                _openWindows.Add(key, window);
                return window.ShowDialog();
            }
        }

        // Метод для проверки, открыто ли окно
        public static bool IsWindowOpen<T>() where T : Window
        {
            return Application.Current.Windows.OfType<T>().Any();
        }
    }
}