import 'package:app_chat_online/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.collection("col").doc("doc").set({"texto:": "Augusto Iseppe Balan"});

  runApp(const MaterialApp(
    home: AppChatOnline(),
  ));
}

class AppChatOnline extends StatefulWidget {
  const AppChatOnline({super.key});

  @override
  State<AppChatOnline> createState() => _AppChatOnlineState();
}

class _AppChatOnlineState extends State<AppChatOnline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello World"),
    );
  }
}