   M S B A M L   `   `   `  ����  
GAIStarApp?    9GAIStarApp.Roles.TrafficPoliceOfficer.ReportDetailsWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$)  #Подробности отчета��5   	   $	��400��6$   $	��600��61    � WindowStartupLocation$ CenterScreen=�5   	   ���#B6ADAF � Icon$ Resources/GAIStarLogo.ico��5   	   .��5      � .+�5
   
   �� $��Resources/GAIStarLogo.png��6   $��83��5      $��66��6   $
��Left=�5      $	��Top=�6+   $��	10,10,0,0q�5      �� 5   
   -   5        $��Right=�5      $	��Top=�6-   $��90��5      $��90��6   $��0,0,10,0q�5      
������ $��0q�5      .��5      �� $��Resources/BackArrow.png��6   $��70��65   $��63��6@    J� RenderTransformOrigin$ 0.393,0.487&�6L   5      �� 5   
   $)��#Подробности отчета��6   $��Center=�5      $	��Top=�61   $��0,20,0,0q�5      $��20(�5      
�������5      �� 5    
   ���#4A4A4A$��Center=�5!      $	��Top=�61   $	��300��5"      $��2��6    $��0,47,0,0q�5#      �� 5&   
   ���#EDE1CF �� CornerRadius$ 15��6&   $	��500��5'      $	��250��6   $��Center=�5(      $	��Top=�6.    �� Padding$ 20q�5)      $��0,95,0,0q�6   ._�5*      �� .+�5,      ��  �� Orientation$ 
Horizontal=�6   $��0,0,0,10q�66   .+�5-      �� $��Тип отчета: ��6    $��16(�5.       $
��Bold"�5/       ���#33333350       �� 51      $��16(�52       ���#333333��51       �� *
ReportType+53       54      �� 57      $ 
Horizontal=�6   $��0,0,0,10q�66   .+�58      �� $!��Дата создания: ��6    $��14(�59       $
��Bold"�5:       ���#5555555;       �� 5<      $��14(�5=       ���#555555��5<       �� *DateGenerated+ �� StringFormat$ {0:dd.MM.yyyy}��5>       5?      �� 5B      $(��"Содержимое отчета:��6   $��14(�5C      $
��Bold"�5D      ���#333333$��0,0,0,5q�5F      �� 5G      $��14(�5H      ���#333333 �� TextWrapping$
 Wrap=�5J      	 �� 
IsReadOnly	 . "
 �� VerticalScrollBarVisibility$

 Auto=�5L      $ �� HorizontalScrollBarVisibility$ Disabled=�5M      $��1q�5N      ���#CCCCCC$��5q�5P      ��5G      �� *	Content+5P      5Q      5R      5S      5T      