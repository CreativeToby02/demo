import 'package:demo_app/core/routes.dart';
import 'package:demo_app/firebase_options.dart';
import 'package:demo_app/ui/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';

// DevicePreview(
// enabled: !kReleaseMode,
// builder: (context) => const MyApp(),
// ),
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // DevicePreview(
    // enabled: !kReleaseMode,
    // builder: (context) =>
    const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: LightTheme,
      routerConfig: routes,
    );
  }
}

// check if user is logged in
// final token = await SecureStorageUtils.getString(SharedPrefKeys.token);
// final isLoggedIn = !(token == null || token.isEmpty);

// check if user is onboarded
// final isOnboarded = !isLoggedIn
//     ? await SharedPreferencesUtil.getBool(SharedPrefKeys.isOnboarded) ?? false
//     : isLoggedIn;

// initialRoute = isLoggedIn
//     ? BottomNavigator.route
//     : isOnboarded
//         ? OnboardingGetStartedScreen.route
//         : null;
