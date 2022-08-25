import 'package:carrot/model/product.dart';
import 'package:carrot/model/providers/index_provider.dart';
import 'package:carrot/model/providers/products_provider.dart';
import 'package:carrot/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'routes/generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  //firebase initialiation
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();

  // path provider
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();

  //hive initialization
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ProductAdapter());

  //running app
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
