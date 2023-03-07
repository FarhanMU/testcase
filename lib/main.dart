import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:testcase/location_page2.dart';


void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
} 

class Main extends StatefulWidget {
  
  const Main({ Key? key }) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {  

    return MaterialApp(
      //Over here
      navigatorKey: NavigationService().navigationKey,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) =>  location_page2(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
  
}

class NavigationService {
  /// Creating the first instance
  static final NavigationService _instance = NavigationService._internal();
  NavigationService._internal();

  /// With this factory setup, any time  NavigationService() is called
  /// within the appication _instance will be returned and not a new instance
  factory NavigationService() => _instance;

  ///This would allow the app to monitor the current screen state during navigation.
  ///
  ///This is where the singleton setup we did
  ///would help as the state is internally maintained
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  /// For navigating back to the previous screen
  dynamic goBack([dynamic popValue]) {
    return navigationKey.currentState?.pop(popValue);
  }

  /// This allows you to naviagte to the next screen by passing the screen widget
  Future<dynamic> navigateToScreen(Widget page, {arguments}) async => navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );

  /// This allows you to naviagte to the next screen and
  /// also replace the current screen by passing the screen widget
  Future<dynamic> replaceScreen(Widget page, {arguments}) async => navigationKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );

  /// Allows you to pop to the first screen to when the app first launched.
  /// This is useful when you need to log out a user,
  /// and also remove all the screens on the navigation stack.
  /// I find this very useful
  void popToFirst() => navigationKey.currentState?.popUntil((route) => route.isFirst);
}


// flutter pub run change_app_package_name:main com.bukahuni.hunipro
// flutter pub run flutter_launcher_icons:main
// flutter pub run flutter_app_name 
// Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => discover_page()), (Route<dynamic> route) => false);
// Navigator.push(context, MaterialPageRoute(builder: (context) => discover_page_genre()));
// Navigator.pop(context);
// -keep class com.xraph.plugin.** {*;}

// final List<Widget> imageSliders = imgSliders.asMap().entries.map((entry) {  
    // return  
// }).toList();

// Container(
//   margin: EdgeInsets.symmetric(horizontal: 10),
//   child: Container(
//       width: 120,
//       height: 120,
//       decoration: BoxDecoration(
//         color: blueDarkColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//     )
// )
