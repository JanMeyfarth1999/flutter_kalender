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
    final PageController pageController =
      PageController(initialPage: 1000);

  Map<DateTime, String> getHolidays(int year) {
    DateTime easterSunday = getEasterSunday(year);
    return{
      DateTime(year, 1, 1): 'Neujahr',
      easterSunday.subtract(Duration(days: 2)): 'Karfreitag',
      easterSunday.add(Duration(days: 1)): 'Ostermontag',
      DateTime(year, 5, 1): 'Tag der Arbeit',
      easterSunday.add(Duration(days: 39)): 'Christi Himmelfahrt',
      easterSunday.add(Duration(days: 50)): 'Pfingstmontag',
      easterSunday.add(Duration(days: 60)): 'Frohenleichnam',
      DateTime(year, 10, 3): 'Tag der Deutschen Einheit',
      DateTime(year, 12, 25): '1. Weihnachtstag',
      DateTime(year, 12, 26): '2. Weihnachtstag',
       
    };
  }
 DateTime getEasterSunday(int year){
  int a = year % 19;
  int b = year ~/ 100;
  int c = year % 100;
  int d = b ~/ 4; 
  int e = b % 4;
  int f = (b + 8) ~/ 25;
  int g = (b - f + 1) ~/ 3;
  int h = (19 * a + b - d - g + 15) % 30;
  int i = c ~/ 4;
  int k = c % 4; 
  int l = (32 + 2 * e + 2 * i - h - k) % 7;
  int m = (a + 11 * h + 22 * l) ~/ 451;

  int month = (h + l - 7 * m + 114) ~/ 31;
  int day = ((h + l - 7 * m + 114) % 31) + 1;

  return DateTime(year, month, day);

  }

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
   
    


        child: PageView.builder(
          controller: pageController,
          itemBuilder: (context, index) {
            int monthOffset = index - 1000;
            DateTime pageMonth = DateTime(
              displayedMonth.year,
                displayedMonth.month + monthOffset,
            );
            Map<DateTime, String> holidays = getHolidays(pageMonth.year);
            String pageMonthTitle = DateFormat('MMMM yyyy', 'de_DE').format(pageMonth);
            DateTime firstDay = DateTime(
              pageMonth.year,
              pageMonth.month,
              1,
            );
            int firstWeekday = firstDay.weekday;
            DateTime lastDay = DateTime(
              pageMonth.year,
              pageMonth.month + 1,
              0,
            );
            int daysInMonth = lastDay.day;
            int emptyFields = firstWeekday - 1;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Row(
              
              children:[
                Expanded(
                child: Center(
                child:
                Text('Mo',
                style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                ),
                ),
                ),
                ),
                 Expanded(
                child: Center(
                child:
                Text('Di',
                style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                ),
                ),
                ),
                ),
                 Expanded(
                child: Center(
                child:
                Text('Mi',
                style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                ),
                ),
                ),
                ),
                 Expanded(
                child: Center(
                child:
                Text('Do',
                style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                ),
                ),
                ),
                ),
                 Expanded(
                child: Center(
                child:
                Text('Fr',
                style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                ),
                ),
                ),
                ),
                Expanded(
                child: Center(
                child:
                Text('Sa',
                style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                ),
                ),
                ),
                ),
                 Expanded(
                child: Center(
                child:
                Text('So',
                style: TextStyle(
                  color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                ),
                ),
                ),
                ),
              
              ],

            ),
              
                    SizedBox(
              height: 700,
              child: GridView.builder(
                itemCount: emptyFields + daysInMonth,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.4,
              ),
              itemBuilder: (context, index) {
                 if (index < emptyFields) {
              return SizedBox();
                }
  
 
              int day = index - emptyFields + 1;
              DateTime currentDate = DateTime(
              pageMonth.year,
              pageMonth.month,
              day,
              );
              bool isHoliday = holidays.containsKey(currentDate);
                return Center(
                  child: Text(
                  day.toString(),
                  style: TextStyle(
                  color: isHoliday ? Colors.yellow : Colors.white,
                  fontWeight: FontWeight.bold,
                  ),
                  ),
              );

            },
          ),
        ),
                   Stack(
          children: [
            Text(
              pageMonthTitle,
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
              pageMonthTitle,
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
          );
        },
      ),
    ),
     ); // Scaffold
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

}
  
          
      
      
