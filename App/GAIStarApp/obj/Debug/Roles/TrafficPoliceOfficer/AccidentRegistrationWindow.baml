   M S B A M L   `   `   `  ����  
GAIStarAppF    @GAIStarApp.Roles.TrafficPoliceOfficer.AccidentRegistrationWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$#  Регистрация ДТП��5   	   $	��939��6!   $	��600��6.    � WindowStartupLocation$ CenterScreen=�5   	   ���#B6ADAF � Icon$ Resources/GAIStarLogo.ico��5   	    � 	Resources 5       �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius(  "System.Windows.Controls.DatePicker��%�  '��       '�� M    '�� �    '  c    '�� �    �� 5
   
   " ��6   .�5      ��  � �� �#4CAF506+   �� 5       � ��
 �����6+   �� 5       � �� �#4CAF506,   �� 5       � ��$ 2q�60   �� 5       � ��$	 200��6&   �� 5       � ��$ 40��6'   �� 5       � ��$ 10q�6'   �� 5       � ��$ 16(�6)   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $ 10��6!   #��z��63   #��z��6]   #��z��6�   ._�5      �� $��Center=�6/   $��Center=�6L   5      5      5      5      �� 5!   
   " ��6   .�5"      ��  � ��$ 16(�6)   �� 5#       � ��$ 0,0,0,5q�6'   �� 5$       � �� �#3333336+   5&      �� 5)   
   " ��6   .�5*      ��  � ��$	 300��6&   �� 5+       � ��$ 30��6'   �� 5,       � ��$ 0,0,0,10q�6'   �� 5-       � ��$ 14(�6)   �� 5.       � ��
 �����6+   �� 5/       � �� �#3333336+   �� 50       � �� �#CCCCCC6,   �� 51       � ��$ 1q�60   �� 52       � ��$ 5q�6(   53      �� 56   
   "  6   .�57      ��  � ��$	 300��6&   �� 58       � ��$ 30��6'   �� 59       � ��$ 0,0,0,10q�6'   �� 5:       � ��$ 14(�6)   �� 5;       � ��
 �����6+   �� 5<       � �� �#3333336+   �� 5=       � �� �#CCCCCC6,   �� 5>       � ��$ 1q�60   �� 5?       � ��$ 5q�6(   5@      �� 5C   
   " ��6   .�5D      ��  � ��$	 300��6&   �� 5E       � ��$ 30��6'   �� 5F       � ��$ 0,0,0,10q�6'   �� 5G       � ��$ 14(�6)   �� 5H       � ��
 �����6+   �� 5I       � �� �#3333336+   �� 5J       � �� �#CCCCCC6,   �� 5K       � ��$ 1q�60   �� 5L       � ��$ 5q�6(   5M      5N      .��5P      � $��0,0,0,14q�6   .+�5R   
   �� $��Resources/GAIStarLogo.png��6   $	��118��5S      $��93��6   $
��Left=�5T      $	��Top=�6+   $��	10,10,0,0q�5U      �� 5X   
   -   5        $��Right=�5X      $	��Top=�6-   $��90��5Y      $��90��6   $��0,0,10,0q�5Z      
������ $��0q�5\      .��5^      �� $��Resources/BackArrow.png��6   $��80��65   $��90��6@   	 J� RenderTransformOrigin$	 0.393,0.487&�6L   5_      �� 5b   
   $H��BРегистрация транспортного средства��6   $��Center=�5c      $	��Top=�61   $��0,90,0,0q�5d      $��20(�5e      
�������5f      �� 5i   
   ���#4A4A4A$
��Left=�5j      $	��Top=�6/   $	��490��5k      $��20��6    $��
50,122,0,0q�5l      �� 5o   
   ���#EDE1CF$ 15��6&   $	��500��5p      $	��647��6   $��Center=�5q      $	��Top=�6.   
 �� Padding$
 20q�5r      $��	0,183,0,0q�6   ._�5s      �� .+�5u      �� $��Водитель:��6   �� 5v      -   5         ��Name$ DriverComboBox��5v       �� DisplayMemberPath$ FullName��63    �� SelectedValuePath$ DriverID��6P   6m   �� 5y      $0��*Транспортное средство:��6   �� 5z      -   5        $ VehicleComboBox��5z      $ LicensePlate��64   $ 	VehicleID��6U   �� 5}      $��	Дата:��6     5~      -   5          Name$ AccidentDatePicker��5~      $��45��69   �� 5�      $��Время:��6   �� 5�      -   5         ��Name$ AccidentTimeTextBox��5�      $��12:00��67   �� 5�      $��Место:��6   �� 5�      -   5        $ LocationTextBox��5�      �� 5�      $��Описание:��6   �� 5�      -   5        $ DescriptionTextBox��5�      $	��100��66    �� TextWrapping$
 Wrap=�6C   �� 5�      $��Сумма ущерба:��6   �� 5�      -   5        $ DamageAmountTextBox��5�      67   �� 5�      -	   5        $&�� Зарегистрировать��5�      64   5�      5�      5�      5�      