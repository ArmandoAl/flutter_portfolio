import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Providers/UiProvider.dart';
import 'package:portfolio/Screens/desktop/CimaBoyScreen.dart';
import 'package:portfolio/Screens/desktop/HerNotesScreen.dart';
import 'package:portfolio/Screens/desktop/HomeScreen.dart';
import 'package:portfolio/Screens/mobile/MobileCimaBoy.dart';
import 'package:portfolio/Screens/mobile/MobileHerNotes.dart';
import 'package:portfolio/Screens/mobile/MobileHomeScreen.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/responsive.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UIProvider()),
        ],
        child: MaterialApp(
            routes: {
              '/home': (context) => const HomeScreen(),
              '/herNotes': (context) => const HerNotesScreen(),
              '/cimaBoy': (context) => const CimaBoyScreen(),
              '/pokedex': (context) => const HomeScreen(),
              '/rn_components': (context) => const HomeScreen(),
              '/mobileHerNotes': (context) => const MobileHerNotes(),
              '/mobileCimaBoy': (context) => const MobileCimaBoy(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Portfolio',
            home: const Responsive(
                mobile: MobileHomeScreen(), web: HomeScreen())));
  }
}
