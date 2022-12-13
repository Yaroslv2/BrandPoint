import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api/user_api/bloc/user_bloc.dart';
import 'pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const BottomBar(),
        '/cart': (context) => const CartPage(),
        '/account': (context) => const AccountPage()
      },
      theme: ThemeData(primarySwatch: Colors.grey),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
        create: (context) => UserBloc(),
        child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          print(state);
          if (state is UserInitialState) {
            BlocProvider.of<UserBloc>(context).add(UserInitialEvent());
          }
          if (state is UserLogInState) {
            print("login");
            return BottomBar();
          }
          if (state is UserLogOutState) {
            return LoginPage();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    CartPage(),
    AccountPage()
  ];

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
        elevation: 0,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Shopping cart",
              activeIcon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Account",
              activeIcon: Icon(Icons.account_circle))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
