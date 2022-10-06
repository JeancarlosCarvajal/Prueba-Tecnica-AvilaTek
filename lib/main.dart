import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:google_fonts/google_fonts.dart'; 
  
import 'blocs/actor_profile/actor_profile_bloc.dart';
import 'blocs/details_movie/details_movie_bloc.dart';
import 'blocs/popular_movies/popular_movies_bloc.dart';
import 'routes/routes_app.dart';

void main() async {

  await dotenv.load(fileName: ".env");  
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PopularMoviesBloc()),  
        BlocProvider(create: (context) => DetailsMovieBloc()),    
        BlocProvider(create: (context) => ActorProfileBloc()),   
      ],
      child: const MovieApp()
    ),
  );

} 

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

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