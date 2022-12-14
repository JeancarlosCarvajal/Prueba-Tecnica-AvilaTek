import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/actor_profile/actor_profile_bloc.dart';

import '../models/credits_by_idmovie.dart';

import '../routes/routes_app.dart';

import '../widgets/circular_progress_widget.dart';
import '../widgets/grid_view_builder_widget.dart';
import '../widgets/leading_widget.dart'; 

class ProfilePage extends StatelessWidget {

  const ProfilePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Cast actor = ModalRoute.of(context)!.settings.arguments as Cast; 
    final ActorProfileBloc actorProfileBloc = BlocProvider.of<ActorProfileBloc>(context);
    actorProfileBloc.getNewActorProfileById(actorId: actor.id); 
    return Scaffold( 
      body:  SafeArea(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      
            Container( // header actor. 180 + 99 + 15 padding = 294
              height: 294, 
              padding: const EdgeInsets.only(bottom: 15),
              child: _HeaderActor(actor: actor),
            ),
      
            Flexible( // gridview. all height - header actor
              flex: 1,
              child: BlocBuilder<ActorProfileBloc, ActorProfileState>(
                builder: (context, state) {
                  return state.movies.isEmpty
                    ? const Center( child:CircularProgressMovie() )
                    : GridViewBuilder(movies: state.movies, heigthToLeftFree: 294, bottom: 0);
                }
              )
            ),
          ],
        ),
      ),

    );
  }
}

class _HeaderActor extends StatelessWidget {
  const _HeaderActor({
    Key? key,
    required this.actor, 
  }) : super(key: key);

  final Cast actor; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      Container( // boton azul alto = 99
        alignment: Alignment.topLeft,
        child: LeadingWidget( 
          icon: Icons.arrow_back_ios_new,
          margin: 37, // boton azul, 37x2 padding = 74 mas 25 diametro son 99 por aqui
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      
      Container( // ProfileImage, name-desc and castedon. alto definido 140 + 40 = 180
        height: 180,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [  

            Row( // profile image and name-desc. alto 140
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox( // profile image. alto definido 140
                    height: 140,
                    child: Column( // profile image
                      children: [
                        Hero( 
                          tag: actor.id,
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(45),
                              child: FadeInImage(
                                placeholder: const AssetImage('assets/no-image.jpg'), 
                                image: NetworkImage( actor.fullProfilePath ), 
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ), 
                        const Spacer(), 
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container( // name-desc artist. alto igual que profile image 140
                    padding: const EdgeInsets.only(left: 10),
                    child: Column( 
                      children: [
                        Container( // Artist name
                          alignment: Alignment.topLeft, 
                          child: Text(
                            actor.name,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis, 
                            style: const TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, height: 1), 
                          ),
                        ),
                        Container( // Artist desc
                          alignment: Alignment.topLeft,  
                          padding: const EdgeInsets.only(top: 4),
                          child: BlocBuilder<ActorProfileBloc, ActorProfileState>(
                            builder: (context, state) {
                              return state.movies.isEmpty
                                ? const Center( child:CircularProgressMovie(strokeWidth: 4.0, widthHeight: 50) )
                                :  Text( 
                                      state.actorBiography, 
                                      maxLines: 5,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis, 
                                      style: const TextStyle( color: Colors.black, height: 1.3  ), 
                                    );
                            }
                          ), 
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container( // casted on. alto 40
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text( 'Casted on', style: TextStyle( fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black) ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, RouteNames.home),
                    child: const Text( 'HOME', style: TextStyle( fontWeight: FontWeight.w800, color: Color.fromARGB(255, 135, 135, 135)) )
                  )
                ],
              )
            ), 
 
          ],
        )
      ),
      
      ],
    );
  }
}
 