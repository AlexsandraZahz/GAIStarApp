﻿#pragma checksum "..\..\..\..\Roles\Driver\FineDetailsWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "92887FBA63D9EC93DFDE7521C4D600DCA22867DE53B1FABFDE99F24A8EE29964"
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


namespace GAIStarApp.Roles.Driver {
    
    
    /// <summary>
    /// FineDetailsWindow
    /// </summary>
    public partial class FineDetailsWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 78 "..\..\..\..\Roles\Driver\FineDetailsWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock FineIDTextBlock;
        
        #line default
        #line hidden
        
        
        #line 79 "..\..\..\..\Roles\Driver\FineDetailsWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock DateOfViolationTextBlock;
        
        #line default
        #line hidden
        
        
        #line 80 "..\..\..\..\Roles\Driver\FineDetailsWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock ViolationTypeTextBlock;
        
        #line default
        #line hidden
        
        
        #line 81 "..\..\..\..\Roles\Driver\FineDetailsWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock AmountTextBlock;
        
        #line default
        #line hidden
        
        
        #line 86 "..\..\..\..\Roles\Driver\FineDetailsWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button PaymentButton;
        
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
            System.Uri resourceLocater = new System.Uri("/GAIStarApp;component/roles/driver/finedetailswindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\Roles\Driver\FineDetailsWindow.xaml"
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
            
            #line 57 "..\..\..\..\Roles\Driver\FineDetailsWindow.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Back_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.FineIDTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 3:
            this.DateOfViolationTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 4:
            this.ViolationTypeTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 5:
            this.AmountTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 6:
            this.PaymentButton = ((System.Windows.Controls.Button)(target));
            
            #line 90 "..\..\..\..\Roles\Driver\FineDetailsWindow.xaml"
            this.PaymentButton.Click += new System.Windows.RoutedEventHandler(this.PaymentButton_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

