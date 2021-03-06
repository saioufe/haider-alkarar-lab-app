import 'package:a_alkarar_lab/screens/main-screen.dart';
import 'package:a_alkarar_lab/screens/news-pressed-screen.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
//import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import './providers/allProvider.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() async {
//Remove this method to stop OneSignal Debugging
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.init("34a10f05-fcb0-464e-bc8a-262bdb922960", iOSSettings: {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.inAppLaunchUrl: false
  });
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 6)
  await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);



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
