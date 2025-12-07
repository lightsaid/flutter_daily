import 'package:flutter/material.dart';
import 'package:flutter_daily/agriplant/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class AgriplantApp extends StatefulWidget {
  const AgriplantApp({super.key});

  @override
  State<AgriplantApp> createState() => _AgriplantAppState();
}

class _AgriplantAppState extends State<AgriplantApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Agriculture App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.mulishTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
