import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pjsp/Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PJSP',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
_functionTap(){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Dashboard()),
  );
}

startTime() async {
  var duration = new Duration(seconds: 3);
  return new Timer(duration, route);
}

route() {
  Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => Dashboard()
    )
  ); 
}

@override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    startTime();
  }
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a92a3),
      body:GestureDetector(
         onTap: () => _functionTap(),
      child:Stack(
               children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              GestureDetector(  
               onTap: () => _functionTap(),
            child:Image.asset("assets/PJSP.png",
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  )
            ),
            Text(
                'Pièces Justificatives',
                style: TextStyle(
                  fontFamily: 'Verdana',
                  fontSize: 14,
                  color: const Color(0xffe7e8ea),
                ),
                textAlign: TextAlign.left,
              ),
            
             Text(
                  'en matière de  Solde et des Pensions',
                  style: TextStyle(
                    fontFamily: 'Verdana',
                    fontSize: 14,
                    color: const Color(0xffe7e8ea),
                  ),
                  textAlign: TextAlign.center,
                ),
           
          ],
        ),
     
         ],
       ),),
    );
  }
}



