import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../blocs/popular_movies/popular_movies_bloc.dart';

import '../widgets/circular_progress_widget.dart';
import '../widgets/grid_view_builder_widget.dart';
import '../widgets/leading_widget.dart'; 

class HomePage extends StatefulWidget {
   
  const HomePage({Key? key}) : super(key: key);
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController(); 
  late PopularMoviesBloc popularMoviesBloc;
  late AnimationController controller; 
  late Animation<double> moveToRight; 
  late Animation<double> scale;  

  @override
  void initState() {
    popularMoviesBloc = BlocProvider.of<PopularMoviesBloc>(context);

    popularMoviesBloc.getPopularMoviesByPage();
    controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 150)
    );
    scale = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear)
    );

    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose(); 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) { 
    final size = MediaQuery.of(context).size; 
    moveToRight = Tween(begin: 0.0, end: size.width).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
             

            _MainPage(
              controller: controller, 
              scrollController: scrollController, 
              popularMoviesBloc: popularMoviesBloc
            ),
          

            _HamburgerMenu(
              controller: controller, 
              size: size, scale: scale, 
              moverDerecha: moveToRight
            ),


          ],
        ),
      ),

    );
  }
 

}


class _MainPage extends StatelessWidget {
  const _MainPage({
    Key? key,
    required this.controller,
    required this.scrollController,
    required this.popularMoviesBloc,
  }) : super(key: key);

  final AnimationController controller;
  final ScrollController scrollController;
  final PopularMoviesBloc popularMoviesBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
 
          SizedBox(
            height: 100, 
            child: Stack(
              children: [
                LeadingWidget( // boton azul
                  icon: Icons.menu,
                  margin: 37,
                  onPressed: () {   
                    if(controller.status != AnimationStatus.completed) controller.forward(); 
                  },
                ),
                
                Container( // latest
                  alignment: Alignment.center,
                  child: const Text(
                    'Latest', 
                    textAlign: TextAlign.center, 
                    style: TextStyle( fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black) 
                  )
                ),
              ],
            ),
          ),
      
          Flexible(
            flex: 1,
            child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
              builder: (context, state) {
                scrollController.addListener(() {
                  if(scrollController.position.pixels >= (scrollController.position.maxScrollExtent-500)){
                    if(state.isLoading == false){
                      popularMoviesBloc.getPopularMoviesByPage( page: (state.currentPage + 1) );
                    }
                  }
                });
                return state.movies.isEmpty
                  ? const CircularProgressMovie()
                  : GridViewBuilder( movies: state.movies, heigthToLeftFree: 100, scrollController: scrollController );
              }
            )
          ),
         
        ],
      ),
    );
  }
}


class _HamburgerMenu extends StatelessWidget {
  const _HamburgerMenu({
    Key? key,
    required this.controller,
    required this.size,
    required this.scale,
    required this.moverDerecha
  }) : super(key: key);

  final AnimationController controller;
  final Size size;
  final Animation<double> scale;
  final Animation<double> moverDerecha;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ 

        // back ground opacity
        AnimatedBuilder(
          animation: controller, 
          builder: (BuildContext context, Widget? child) { 
            return Transform.scale(
              scale: scale.value, 
              child: GestureDetector(
                onTap: () {
                  print('jean: Click en cerrar 2');
                  if(controller.status == AnimationStatus.completed) controller.reverse(); 
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  height: size.height,
                ),
              ),
            ); 
          }
        ), 
  
        // contenido del menu haburguesa
        AnimatedBuilder(
          animation: controller, 
          builder: (BuildContext context, Widget? child) { 
            return Transform.translate(
              offset: Offset( (-size.width + moverDerecha.value), 0 ), 
              child: Container(
                color: Colors.white,
                width:  size.width < 300 ? 250 : 300,
                height: size.height,
                child: Column(
                  children: [ 
             
                    SizedBox( 
                      width: 200,
                      height: 200,
                      child: Container( 
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: const Image(image: AssetImage('assets/icon/peliculas.png')) 
                          ),
                        ),
                    ), 
             
                    const Expanded(
                      child: Text( 'Movie_App', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), )  
                    ), 
             
                    ListTile(
                      leading: const Icon( Icons.lightbulb_outline ),
                      title: const Text('Dark Mode'),
                      trailing: Switch.adaptive(
                        value: false , 
                        onChanged: ( value ) => {} 
                      ),
                    )  
             
                  ],
                ),
              ),
            ); 
          }
        ),

      ],
    );
  }
} 
 