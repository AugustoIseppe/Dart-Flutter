import 'package:app_loja_online/firebase_options.dart';
import 'package:app_loja_online/models/cart_model.dart';
import 'package:app_loja_online/models/user_model.dart';
import 'package:app_loja_online/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  //Instância para conexão com o firebase (Conexão feita com o FlutterFire(prompt de comando))
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //ScopedModel -> responsável por deixar acessícel as funçoes de qqlr lugar do App
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<CartModel>(
        model: CartModel(model),
        child: MaterialApp(
          title: "Flutter's Clothing",
          theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            primaryColor: const Color.fromARGB(255, 4, 125, 141),
            useMaterial3: true,       
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      );
        },
        ),
    );
  }
}
