import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/post_provider.dart';
import 'screens/home_screen.dart';
import 'services/post_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostProvider(PostService())..fetchPosts(),
        ),
      ],
      child: const HomeFeatureApp(),
    ),
  );
}

class HomeFeatureApp extends StatelessWidget {
  const HomeFeatureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Feature',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7563D9),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F7FB),
      ),
      home: const HomeScreen(),
    );
  }
}
