﻿#pragma checksum "..\..\..\..\Roles\TrafficPoliceOfficer\DriverRegistrationWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "D8656C2E57CBD63E97C91237E1CBEAE7FF34BC536DC50DB459BD030A673214C1"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace GAIStarApp.Roles.TrafficPoliceOfficer {
    
    
    /// <summary>
    /// DriverRegistrationWindow
    /// </summary>
    public partial class DriverRegistrationWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        /// <summary>
        /// FullNameTextBox Name Field
        /// </summary>
        
        #line 102 "..\..\..\..\Roles\TrafficPoliceOfficer\DriverRegistrationWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        public System.Windows.Controls.TextBox FullNameTextBox;
        
        #line default
        #line hidden
        
        /// <summary>
        /// DateOfBirthDatePicker Name Field
        /// </summary>
        
        #line 107 "..\..\..\..\Roles\TrafficPoliceOfficer\DriverRegistrationWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        public System.Windows.Controls.DatePicker DateOfBirthDatePicker;
        
        #line default
        #line hidden
        
        /// <summary>
        /// LicenseNumberTextBox Name Field
        /// </summary>
        
        #line 110 "..\..\..\..\Roles\TrafficPoliceOfficer\DriverRegistrationWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        public System.Windows.Controls.TextBox LicenseNumberTextBox;
        
        #line default
        #line hidden
        
        /// <summary>
        /// UsernameTextBox Name Field
        /// </summary>
        
        #line 114 "..\..\..\..\Roles\TrafficPoliceOfficer\DriverRegistrationWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        public System.Windows.Controls.TextBox UsernameTextBox;
        
        #line default
        #line hidden
        
        /// <summary>
        /// PasswordTextBox Name Field
        /// </summary>
        
        #line 118 "..\..\..\..\Roles\TrafficPoliceOfficer\DriverRegistrationWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        public System.Windows.Controls.TextBox PasswordTextBox;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/GAIStarApp;component/roles/trafficpoliceofficer/driverregistrationwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\Roles\TrafficPoliceOfficer\DriverRegistrationWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 78 "..\..\..\..\Roles\TrafficPoliceOfficer\DriverRegistrationWindow.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Back_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.FullNameTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.DateOfBirthDatePicker = ((System.Windows.Controls.DatePicker)(target));
            return;
            case 4:
            this.LicenseNumberTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.UsernameTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.PasswordTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 7:
            
            #line 122 "..\..\..\..\Roles\TrafficPoliceOfficer\DriverRegistrationWindow.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Register_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

