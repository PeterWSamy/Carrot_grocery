import 'package:carrot/providers/index_provider.dart';
import 'package:carrot/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/main_screen.dart';
import 'routes/generator.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (context) => Indexprovider()),
        ChangeNotifierProvider( create: (context) => ProductsProvider())
      ],
      child: MaterialApp(
        title: 'Carrot',
        theme: ThemeData(
          fontFamily: "Noto Sans",
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(255, 82, 205, 109),
          ),
        ),
        home: const MainPage(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
