
import 'package:flutter/material.dart';

import '../pages/details_page.dart';
import '../pages/home_page.dart';
 
 



final Map<String, Widget Function(BuildContext)> appRoutes = {

  RouteNames.home    : ( context ) => const HomePage(),  
  RouteNames.details : ( context ) => const DetailsPage(),  
  RouteNames.profile : ( context ) => const HomePage(),  

};

class RouteNames {
  static const String home    = '/'; 
  static const String details = 'details'; 
  static const String profile = 'profile'; 
}