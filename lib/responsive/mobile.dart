import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:online_canteen/resources/authMethods.dart";
import "package:online_canteen/screens/LoginScreen.dart";
import "package:online_canteen/screens/canteenSelection.dart";
import "package:online_canteen/screens/profileScreen.dart";
import "package:online_canteen/widgets/canteenCard.dart";
import "package:online_canteen/widgets/screenWrapper.dart";

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _page = 0;
  late PageController pageController;
  final AuthMethods authMethods = AuthMethods();
  void navigationTapped(int page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          ScreenWrapper(
          title: "Canteen Selection", displayScreen: CanteenSelection()),
          ScreenWrapper(title: "Cart", displayScreen: LoginScreen()),
          ScreenWrapper(title: "Profile", displayScreen: ProfileScreen()),
        ],
      ),
      bottomNavigationBar: _iosTabBar(),
    );
  }

  Widget _iosTabBar() {
    return CupertinoTabBar(
      currentIndex: _page,
      onTap: navigationTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cart),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
