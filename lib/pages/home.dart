import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    return Scaffold(
      body:SafeArea(child: 
    Padding(
      padding: const EdgeInsets.fromLTRB(0,150,0,0),
      child: Column(children: <Widget>[
          TextButton(onPressed: ()=>Navigator.pushNamed(context, '/location'),
           child: 
           Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.edit_location, color: Colors.black,),
            Text('Edit Location',style: TextStyle(color: Colors.black),),
            
            ])
            ),
            SizedBox(height:20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                data['location'],
                style:TextStyle(
                  fontSize: 28.0,
                  letterSpacing:  2.0
                )
              )
            ]),
            SizedBox(height: 30.0),
            Text(
              data['time'],
              style:TextStyle(
                fontSize:66.0
              )
            )
      ],
      ),
    )
      ),
   
    );
  }
}