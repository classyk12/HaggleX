import 'package:flutter/material.dart';

class OnBoardingHeader extends StatelessWidget {

  final String title;
  final String subtitle;

  OnBoardingHeader({@required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
   return  Stack(
            children: <Widget>[
              Container(
                width: 500,
                color: Colors.blueGrey,
                child: Image.asset('assets/images/header.jpeg', fit: BoxFit.cover, width: MediaQuery.of(context).size.width, height: 90,),
              ),  
                
              
              Padding(
                padding: const EdgeInsets.only(left:50.0, top: 30, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                    Text(title, style:TextStyle(fontSize: 20,color:Colors.black, fontWeight: FontWeight.bold)),
                    Text(subtitle, style:TextStyle(fontSize: 15,color:Colors.black, fontWeight: FontWeight.normal))
                  ]
                ),
              ),
              
             // Container()

              // Positioned(right: titleRight,top:titleTop,
              // child: Text(title, style:TextStyle(fontSize: 20,color:Colors.black, fontWeight: FontWeight.bold))),

              // Positioned(right: subtitleRight,top:subtitleTop,
              // child: Text(subtitle, style:TextStyle(fontSize: 15,color:Colors.black, fontWeight: FontWeight.normal))),
              ]);
  }
}

