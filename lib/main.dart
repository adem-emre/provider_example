import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/features/home/home_view.dart';
import 'package:provider_example/features/home/home_view_model.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel())
    ],

    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

