import "package:flutter/material.dart";
import "package:online_canteen/providers/userProvider.dart";
import "package:online_canteen/resources/authMethods.dart";
import "package:online_canteen/screens/LoginScreen.dart";
import "package:online_canteen/widgets/screenWrapper.dart";
import "package:online_canteen/models/user.dart";
import "package:provider/provider.dart";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late User? currentUser;
  bool isLoading = false;
  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    initialiseUser();
  }

  initialiseUser() async {
    Provider.of<UserProvider>(context, listen: false).refreshUser(false);
    setState(() {
      isLoading = true;
    });
    setState(() {
      currentUser = Provider.of<UserProvider>(context, listen: false).getUser;
    });
    print(Provider.of<UserProvider>(context, listen: false).getUser?.email?? "its null");
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  AuthMethods authMethods = AuthMethods();
  Widget build(BuildContext context) {
    return Material(
        child: currentUser != null
            ? Column(children: [
                Container(
                  child: Row(children: [
                    Container(
                      width: 100,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            currentUser?.photoUrl ?? "lorem"),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Text(currentUser!.name),
                          Text(currentUser!.phoneNumber),
                          Text(currentUser?.email?? ""),
                        ],
                      ),
                    )),
                  ]),
                ),
                const Divider(
                  height: 5,
                  thickness: 3,
                  color: Colors.grey,
                ),
                TabBar(
                  tabs: const <Widget>[
                    Tab(
                      child: Text(
                        "Active Orders",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Past Orders",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                  controller: _tabController,
                ),
                Expanded(
                  // height: MediaQuery.of(context).size.height*0.605,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Placeholder(), // TODO: List of Active Orders
                      Placeholder(), // TODO: List of Past Orders
                    ],
                  ),
                )
              ])
            : Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    const Text("Please Login or Sign Up to view your profile"),
                    SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            ),
                        child: Text("Login/Sign Up"))
                  ])));
  }
}
