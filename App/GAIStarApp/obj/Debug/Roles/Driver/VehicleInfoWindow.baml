   M S B A M L   `   `   `  ����  
GAIStarApp/    )GAIStarApp.Roles.Driver.VehicleInfoWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$G  AИнформация о транспортном средстве��5   	   $	��600��64   $	��600��6A    � WindowStartupLocation$ CenterScreen=�5   	   ���#B6ADAF � Icon$ Resources/GAIStarLogo.ico��5   	    � 	Resources 5	      3  -System.Windows.Media.Effects.DropShadowEffect   DropShadowEffect   
BlurRadius   ShadowDepth   Color  InnerShadowEffect   	Direction��%�   &	        &	 <       5
   
   $ 10Q�64   $ 3Q�6D   $ #333333��6T     5   
   $ 5Q�65   $ 1Q�6D   $ #666666��6T   $	 270Q�6d   5      .��5      � .+�5   
   �� $��Resources/GAIStarLogo.png��6   $	��107��5      $	��117��6   $
��Left=�5      $	��Top=�6+   $��	10,10,0,0q�5      �� 5   
   -   5        $��Right=�5      $	��Top=�6-   $��90��5      $��90��6   $��0,0,10,0q�5      
������ $��0q�5      .��5      �� $��Resources/BackArrow.png��6   $��80��65   $��90��6@    J� RenderTransformOrigin$ 0.393,0.487&�6L   5      �� 5   
   $G��AИнформация о транспортном средстве��6   $��Center=�5       $	��Top=�61   $��0,90,0,0q�5!      $��20(�5"      
�������5#      �� 5&   
   ���#4A4A4A$��Center=�5'      $	��Top=�61   $	��300��5(      $��20��6    $��	0,120,0,0q�5)      �� 5,   
   ���#76A1A7	 �� CornerRadius$	 15��6&   $	��550��5-      $	��380��6   $��Center=�5.      $	��Top=�6.   
 �� Padding$
 20q�5/      $��	0,150,0,0q�6    J� Effect# [  50      ._�51      �� -   5         ��Name$ VehicleTabControl��51      ���#EDE1CF$��0q�53      $��10q�54      56      57      58      59      