
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
 
 



final Map<String, Widget Function(BuildContext)> appRoutes = {

  RouteNames.home    : ( _ ) => const HomePage(),  
  RouteNames.details : ( _ ) => const HomePage(),  
  RouteNames.profile : ( _ ) => const HomePage(),  

};

class RouteNames {
  static const String home    = '/'; 
  static const String details = 'details'; 
  static const String profile = 'profile'; 
}