import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_manager/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  static final List<Widget> _pages = [
    const HomePageWidget(),
    const ChatPageWidget(),
    const FoodPageWidget(),
    const UserPageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Manager'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          appProvider.setCurrentIndex(index);
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.grey[600]),
        currentIndex: appProvider.currentIndex,
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Colors.black,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank,
              color: Colors.black,
            ),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'User',
          ),
        ],
      ),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}

class ChatPageWidget extends StatelessWidget {
  const ChatPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chat Page'),
    );
  }
}

class FoodPageWidget extends StatelessWidget {
  const FoodPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Food Page'),
    );
  }
}

class UserPageWidget extends StatelessWidget {
  const UserPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('User Page'),
    );
  }
}
