   M S B A M L   `   `   `  ����E  AGAIStarApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:GAIStarApp.Roles.AdminGAIStarApp.Roles.Admin  5   	   0    *GAIStarApp.Roles.Admin.ManageCamerasWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   6local$clr-namespace:GAIStarApp.Roles.Admin     5   	     � Title$+  %Управление камерами��5   	   $	��450��6%   $	��800��62    � WindowStartupLocation$ CenterScreen=�5	   	   ���#B6ADAF � Icon$ Resources/GAIStarLogo.ico��5   	    � 	Resources 5       �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius   StatusCellStyle*  $System.Windows.Controls.DataGridCell	 �� Triggers
 �� Binding �� Value��%�  '��       &	  (    �� 5   
   " ��6   .�5      ��  � �� �#D9C5BC6+   �� 5       � ��
 �   �6+   �� 5       � �� �#D9C5BC6,   �� 5       � ��$ 2q�60   �� 5       � ��$	 150��6&   �� 5       � ��$ 40��6'   �� 5       � ��$ 14(�6)   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $ 5��6!   #��z��62   #��z��6\   #��z��6�   ._�5      �� $��Center=�6/   $��Center=�6L   5      5      5      5       �� 5"   
   "  6(   	 5#      �� 5$      
 6   �� *Status+
 Online69   .a�5%      ��  � ��
 � � �63   �� 5&       � ��
 �����63   5'      �� 5(      
 6   �� *Status+ Offline69   .a�5)      ��  � ��
 �  ��63   �� 5*       � ��
 �����63   5+      5-      5.      .��50      � .+�52   
   �� $��Resources/GAIStarLogo.png��6   $��84��53      $��81��6   $
��Left=�54      $	��Top=�6+   $��	10,10,0,0q�55      �� 58   
   -   5        $��Right=�58      $	��Top=�6-   $��	0,17,10,0q�59      
������ $��0q�5;      $��90��5<      $��90��6   .��5>      �� $��Resources/BackArrow.png��6   $��84��65   $��60��6@    J� RenderTransformOrigin$ 0.5,0.5&�6L   5?      �� 5B   
   $+��%Управление камерами��6   $��Center=�5C      $	��Top=�61   $��0,28,0,0q�5D      $��20(�5E      
�������5F      �� 5I   
   ���#4A4A4A$
��Left=�5J      $	��Top=�6/   $	��300��5K      $��20��6    $��
255,52,0,0q�5L      �� 5O   
    �� Orientation$ 
Horizontal=�6   $
��Left=�5P      $	��Top=�60   $��105,100,0,0q�5Q      .+�5R      �� $'��!Фильтр по статусу:��6   $��Center=�62   $��0,0,10,0q�6M   �� 5S      -   5         ��Name$ StatusFilterComboBox��5S      $	��150��65    �� SelectedIndex$ 0��6A   $��20��6S   .@�5T      �� $��Все��6   �� 5U      $��Online��6   �� 5V      $��Offline��6   5W      �� 5X      -   5        $��Применить��5X      $��	140,0,0,0q�6J   $	��195��6]   $��29��6i   5Y      &   System.Windows.Controls.DataGrid  5\   
   -   5          Name$ CamerasDataGrid��5\         AutoGenerateColumns .  $
��Left=�5^      $	��Top=�6.   $	��600��5_      $	��232��6   $��105,140,0,0q�5`         
IsReadOnly .    Columns 5b      0  *System.Windows.Controls.DataGridTextColumn  5c      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$
 Auto 6N   1  +System.Windows.Controls.DataGridBoundColumn   Binding 61   �� *
CameraID+6N     5d      $" Местоположение��6%   $ * 6Z    6=   �� *
Location+6Z     5e      $ Статус��6%   $
 Auto 6P    65   �� *Status+   	CellStyle 5f      �� 5g       �� ResourceKey$ StatusCellStyle��6)   5i      5k      5l      5m      