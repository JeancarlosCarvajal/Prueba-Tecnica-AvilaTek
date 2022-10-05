import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
import 'routes/routes_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      // home: HomePageTest(),
      initialRoute: RouteNames.home,
      routes: appRoutes,
      theme: ThemeData(
        textTheme: GoogleFonts.balooTammudu2TextTheme()
      )
    );
  }
} 