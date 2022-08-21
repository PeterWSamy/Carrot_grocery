import 'package:carrot/model/providers/index_provider.dart';
import 'package:carrot/model/providers/products_provider.dart';
import 'package:carrot/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/main_screen.dart';
import 'routes/generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Indexprovider()),
        ChangeNotifierProvider(create: (context) => ProductsProvider())
      ],
      child: MaterialApp(
        title: 'Carrot',
        theme: ThemeData(
          fontFamily: "Noto Sans",
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(255, 82, 205, 109),
          ),
        ),
        home: const Splash(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
