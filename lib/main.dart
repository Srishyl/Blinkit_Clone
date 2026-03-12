import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'categories_page.dart';
import 'cart_page.dart';
import 'screens/profile_screen.dart';
import 'screens/orders_screen.dart';
import 'splash_screen.dart';
import 'firebase_options.dart';

import 'package:provider/provider.dart';
import 'cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const BlinkitApp(),
    ),
  );
}

class BlinkitApp extends StatelessWidget {
  const BlinkitApp({super.key});
  
  static const primaryColor = Color(0xFF1E56B2); // Corrected Blue from Stitch
  static const accentColor = Color(0xFFD4F400);  // Corrected Lime from Stitch

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rush',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: accentColor,
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CategoriesPage(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: BlinkitApp.accentColor, // Stitch uses lime for selected item sometimes, but usually blue text with lime icon? Let's use blue/grey
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home, color: BlinkitApp.accentColor), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), activeIcon: Icon(Icons.grid_view, color: BlinkitApp.accentColor), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), activeIcon: Icon(Icons.receipt_long, color: BlinkitApp.accentColor), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person, color: BlinkitApp.accentColor), label: 'Profile'),
        ],
      ),
    );
  }
}
