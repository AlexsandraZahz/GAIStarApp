   M S B A M L   `   `   `  ����  
GAIStarApp    GAIStarApp.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  GAI Star��5   	   $	��600��6   $	��450��6'    � WindowStartupLocation$ CenterScreen=�5   	   ���#B6ADAF � 	Resources 5         ShadowAnimation �� 
TargetName �� TargetProperty W� From	 W� To g� Duration��%9  &	        �� 5	   
   .��5
      W� $ SloganTextBlock��6   $ (TextBlock.Opacity)�5      $ 1X�5      $ 0X�6'   $ 0:0:1D�6.   W� 5      $ SloganTextBlock��6   $7 1(TextBlock.Effect).(DropShadowEffect.ShadowDepth)�5      $ 0X�5      $ 20X�6'   $ 0:0:1D�6/   5      5      .��5      � .+�5   
   �� $��Resources/GAIStarLogo.png��6   $	��217��5      $	��183��6   $
��Left=�5      $	��Top=�6+   $��	10,10,0,0q�5      �� 5   
   ���#BDE3FF �� CornerRadius$ 10��6&   	 �� Padding$	 20q�68   $��Center=�5      $	��Top=�6.   $��	0,292,0,0q�5      $	��420��5      $��60��6   ._�5      �� -   5        
 ��Name$
 SloganTextBlock��5      $g��aГАИ Star — безопасность на дорогах, сияющая как звезда!��5       $��13(�5!      $
��Bold"�6&   $��Center=�5"      $��Center=�65   ���#333 �� TextAlignment$ Center=�5$       J� Effect 5%      3  -System.Windows.Media.Effects.DropShadowEffect  5&         ShadowDepth$ 0Q�6'      Color$ Black��67      Opacity$	 0.5Q�6E      
BlurRadius$ 10Q�6S    � Triggers 5(      :� 5)       :� RoutedEvent$ TextBlock.Loaded��6#   .[�5*      �� #��[  6*   5+      5-      5.      �� 51   
   -   5        $"��Авторизоваться��51      $��Center=�52      $	��Top=�6.   $��	0,435,0,0q�53      ���#76A1A7
����������#76A1A7$��2q�58      $	��200��59      $��60��5:      $��14(�5;       � Cursor$
 Hand��5<      ��5=      �� 5>       �� 
TargetType" ��6"   .R�5?      �� $ 20��6   #��z��6/   #��z��6Y   #��z��6�   ._�5@      �� $��Center=�6+   $��Center=�6H   5A      5B      5D      �� 5G   
   $;��5© 2024 GAI Star. Все права защищены.��6   $��Center=�6@   $��Bottom=�6]   $��0,0,0,20q�6x   $��12(�6�   ���#8886�   5H      5I      