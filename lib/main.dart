import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd.MM.yyyy').format(now);

    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(title: 'Kalenderdatenblatt vom $formattedDate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Stack(
          children: [
        Text(
          widget.title,
           style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          fontFamily: 'Righteous',
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..color = Colors.black
            ..strokeWidth = 4,

               ),
        
        ),
      
    
        Text(      
        widget.title,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          fontFamily: 'Righteous',
          color: Colors.white,
          
              
          ),
        
        ),
      ],
    ),
      
        flexibleSpace: Image.asset('assets/gta6_theme.jpg',
        width: double.infinity,
        fit: BoxFit.cover,
        
        ),
        
      ),
      body: Center(
     
        child: Column(

          mainAxisAlignment: .center,
          children: [
         
          ],
        ),
      ),
   
    );
  }
}
