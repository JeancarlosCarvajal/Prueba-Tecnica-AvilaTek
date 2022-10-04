
import 'package:flutter/material.dart';

import '../widgets/leading_widget.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
        appBar: AppBar(
          toolbarHeight: 100,
          leadingWidth: 100,
          // backgroundColor: Colors.red, // for testing
          backgroundColor: Colors.white,
          elevation: 0,
          leading: LeadingWidget(
            icon: Icons.menu, // princial
            // icon: Icons.close, // details
            // icon: Icons.arrow_back_ios_new, // profile
            // color: Color.fromARGB(255, 202, 202, 202),
            onPressed: () { 
              print('jean: Precionado Boton');
            },
           ), 
          centerTitle: true,
          title: const Text( 'Latest', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black) ),
        ), 
        body: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Column(
                children: [
                  Text( 'Columna 1' ),
                  Text( 'Columna 1' ),
                  Text( 'Columna 1' ),
                  Text( 'Columna 1' ),
                  Text( 'Columna 1' ),
                  Text( 'Columna 1' ),
                  Text( 'Columna 1' ), 
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Text( 'Columna 2' ),
                    Text( 'Columna 2' ),
                    Text( 'Columna 2' ),
                    Text( 'Columna 2' ),
                    Text( 'Columna 2' ),
                    Text( 'Columna 2' ),
                    Text( 'Columna 2' ),
                  ],
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
