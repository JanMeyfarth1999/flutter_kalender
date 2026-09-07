import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('de_DE', null);

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
  DateTime displayedMonth = DateTime.now();
 

  @override
  Widget build(BuildContext context) {
     String monthTitle =
      DateFormat('MMMM yyyy', 'de_DE').format(displayedMonth);

    DateTime firstDay = DateTime(
    displayedMonth.year,
    displayedMonth.month,
    1,
  );
  int firstWeekday = firstDay.weekday;

    DateTime lastDay = DateTime(
    displayedMonth.year,
    displayedMonth.month + 1,
    0,
  );
  int daysInMonth = lastDay.day;

  int emptyFields = firstWeekday - 1;

  

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
      
        flexibleSpace: Image.asset('assets/gta6_theme.png',
        width: double.infinity,
        fit: BoxFit.cover,
        
        ),
        
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
   
    


     
        child: Column(
          

          mainAxisAlignment: .center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Mo',
                style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                ),
                ),
                Text('Di',
                 style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                ),
                ),
                Text('Mi',
                 style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,                  
                ),
                ),
                Text('Do',
                 style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                ),
                ),
                Text('Fr',
                 style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                ),
                ),
                Text('Sa',
                 style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                ),
                ),
                Text('So',
                 style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                ),
                ),
              
              ],

            ),

            SizedBox(
              height: 700,
              child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              ),
              itemBuilder: (context, index) {

            },
          ),
        ),
          
           Stack(
          children: [
            Text(
              monthTitle,
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Righteous',
                 foreground: Paint()
            ..style = PaintingStyle.stroke
            ..color = Colors.black
            ..strokeWidth = 4,

                
                   
                ),
            ),
          
            


            Text(
              monthTitle,
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Righteous',
                color: Colors.white,
                   
                ),


             ),
         
          ],
        ),
          ],
      ),
      ),
   
    );
    
    
  }
}
