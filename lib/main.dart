import 'package:a_alkarar_lab/screens/main-screen.dart';
import 'package:a_alkarar_lab/screens/news-pressed-screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import './providers/allProvider.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await FlutterDownloader.initialize(
  //     debug: true // optional: set false to disable printing logs to console
  //     );
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: AllProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Haider alkarar Lab',
          theme: ThemeData(
            fontFamily: 'khebrat',
            textTheme: TextTheme(
                subtitle: TextStyle(
                    fontFamily: "akhand",
                    fontSize: 20,
                    color: Color(0xFF45B649))),
            canvasColor: Color(0xFFecedf1),
            primaryColor: Color(0xFF37d2b3),
            accentColor: Color(0xFF546E7A),
            bottomAppBarColor: Color(0xff313e4b),
            appBarTheme: AppBarTheme(
              color: Color(0xFF37d2b3),
              textTheme: TextTheme(
                title: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          home: SplashScreen.navigate(
            name: 'assets/images/hairderLab.flr',
            next: (_) => MainScreen(0),
            until: () => Future.delayed(Duration(seconds: 1)),
            startAnimation: 'Untitled',
            backgroundColor: Colors.white,
            endAnimation: '1',
          ),
          routes: {
            NewsPressedScreen.routeName: (ctx) => NewsPressedScreen(),
            MainScreen.routeName: (ctx) => MainScreen(0),
          },
        )),
  );
}
