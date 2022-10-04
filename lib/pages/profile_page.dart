import 'package:flutter/material.dart'; 

import '../json_test/json_test.dart';

import '../models/credits_by_idmovie.dart';
import '../models/movies_by_actor.dart';
import '../models/popular_movies.dart'; 

import '../widgets/grid_view_builder_widget.dart';
import '../widgets/leading_widget.dart'; 

class ProfilePage extends StatelessWidget {

  const ProfilePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Cast actor = ModalRoute.of(context)!.settings.arguments as Cast;

    final   test = JsonTest.moviesByActor;

    final MoviesByActor moviesByActor = MoviesByActor.fromMap( JsonTest.moviesByActor );  
    final List<Movie> moviesActors = moviesByActor.results.first.knownFor;

    print('jean: ${ moviesByActor.results.first.knownFor.length }');

    return SafeArea(
      child: Scaffold( 
        // appBar: AppBar(
        //   automaticallyImplyLeading: false, 
        //   toolbarHeight: 250,
        //   // leadingWidth: 100,
        //   backgroundColor: Colors.white,
        //   elevation: 0, 
        //   title: Container(
        //     width: double.infinity,
        //     margin: EdgeInsets.only(bottom: 0),
        //     padding: EdgeInsets.only(bottom: 0),
        //     child: Column( 
        //       children: [
        //         Container(
        //           width: double.infinity,
        //           child: LeadingWidget(
        //             icon: Icons.arrow_back_ios_new,
        //             margin: 37,
        //             onPressed: () {  
        //               Navigator.pop(context);
        //             },
        //           ),
        //         ),
        //         // Text( 'Hola mundo Soy Imagen y NOmbre del artista', style: TextStyle(fontSize: 40, color: Colors.red), ),
        //         Row(
        //           children: [
        //             Container(
        //               width: 70,
        //               height: 70, 
        //               child: ClipRRect(
        //                 borderRadius: BorderRadius.circular(70),
        //                 child: FadeInImage(
        //                   placeholder: const AssetImage('assets/no-image.jpg'), 
        //                   image: NetworkImage(actor.fullProfilePath ),
        //                   width: 110,
        //                   height: 138,
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //             ),
        //             Container(
        //               // height: 150,  
        //               width: MediaQuery.of(context).size.width,
        //               child: Column(
        //                 children: [
        //                   Container(
        //                     width: double.infinity,
        //                     child: const Text(
        //                       // actor.name,
        //                       'Hola Tom',
        //                       textAlign: TextAlign.start,
        //                       // maxLines: 1,
        //                       // overflow: TextOverflow.ellipsis,
        //                       // textAlign: TextAlign.left,
        //                       style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold), 
        //                     ),
        //                   ),
        //                   Container(
        //                     // width: MediaQuery.of(context).size.width - 70,
        //                     // height: 100,
        //                     child: const Text(
        //                       // softWrap: true,
        //                       // actor.name,
        //                       'Sint laborum pariatur aute exercitation. Qui cupidatat enim et esse id quis amet culpa eu officia culpa adipisicing tempor dolor. Cupidatat exercitation nulla labore commodo minim mollit nisi eiusmod reprehenderit qui aliqua labore aliquip labore. Eiusmod nulla commodo commodo adipisicing mollit consectetur occaecat. Anim voluptate mollit est laboris adipisicing.',
        //                       // maxLines: 5,
        //                       textAlign: TextAlign.justify,
        //                       // overflow: TextOverflow.ellipsis,
        //                       // textAlign: TextAlign.left,
        //                       style: TextStyle( color: Colors.black,  ), 
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),

        //         Container(
        //           width: double.infinity,
        //           margin: EdgeInsets.only(bottom: 0),
        //           padding: EdgeInsets.only(bottom: 0),
        //           child: const Text( 'Casted on', style: TextStyle( fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black) )
        //         ), 
        //       ],
        //     ),
        //   ),
        // ), 
        
        
        body: Column(
          children: [

            Container(
              width: double.infinity,
              height: 310,
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.only(bottom: 0),
              child: Column( 
                children: [
                  Container(
                    width: double.infinity, 
                    child: LeadingWidget(
                      icon: Icons.arrow_back_ios_new,
                      margin: 37,
                      onPressed: () {  
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // Text( 'Hola mundo Soy Imagen y NOmbre del artista', style: TextStyle(fontSize: 40, color: Colors.red), ),
                  Row( 
                    children: [
                      Stack(
                        // alignment: AlignmentDirectional.topStart,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 90,
                                height: 90, 
                                padding: EdgeInsets.all(15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: FadeInImage(
                                    placeholder: const AssetImage('assets/no-image.jpg'), 
                                    image: NetworkImage( actor.fullProfilePath ),
                                    // width: 90,
                                    // height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Spacer(), 
                              Container(
                                height: 50,
                              ),
                              // Text( 'hila' )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        // height: 150,  
                        width: MediaQuery.of(context).size.width - 90,
                        // padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 90,
                              // padding: EdgeInsets.only(top: 20),
                              child: const Text(
                                // actor.name,
                                'Hola Tom',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                // overflow: TextOverflow.ellipsis,
                                // textAlign: TextAlign.left,
                                style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold), 
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 90, 
                              padding: EdgeInsets.only(right: 20),
                              // height: 100,
                              child: const Text(
                                // softWrap: true,
                                // actor.name,
                                'S upidatat exercitation nulla labore commodo minim mollit nisi eiusmod reprehenderit qui aliqua labore aliquip labore. Eiusmod nulla commodo commodo adipisicing mollit consectetur occaecat. Anim voluptate mollit est laboris adipisicing.',
                                maxLines: 5,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                // textAlign: TextAlign.left,
                                style: TextStyle( color: Colors.black, height: 1.3  ), 
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.only(bottom: 0),
                    child: const Text( 'Casted on', style: TextStyle( fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black) )
                  ), 
                ],
              ),
            ),

            GridViewBuilder( movies: moviesActors, heigth: 360, bottom: 50, ),


          ],
        ),
      ),
    );
  }
}

 