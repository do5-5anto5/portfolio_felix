import 'package:flutter/material.dart';
import 'package:portfolio_felix/views/main_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageStorageBucket bucket = PageStorageBucket();
    return MaterialApp(
      title: 'Felix Plaster',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageStorage(
        bucket: bucket,
        child: const MainDashBoard(),
      ),
    );
  }
}
