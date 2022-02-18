import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tpfm_app/screens/addProduct.dart';
import 'package:tpfm_app/screens/auth/login.dart';
import 'package:tpfm_app/screens/checklist/checklist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tpfm_app/screens/contents/contents.dart';
import 'package:tpfm_app/screens/contents/contents.dart';
import 'package:tpfm_app/screens/ip/ip.dart';
import 'package:tpfm_app/screens/program/program.dart';
import 'package:tpfm_app/screens/project/client.dart';
import 'package:tpfm_app/screens/project/project.dart';
import 'package:tpfm_app/screens/visit%20status/visit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff444444),
          secondary: Colors.black54,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: project(),
    );
  }
}
