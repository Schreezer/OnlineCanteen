import "package:flutter/material.dart";
import "package:online_canteen/resources/firestoreMethods.dart";
import "package:online_canteen/screens/menuScreen.dart";
import "package:online_canteen/widgets/canteenCard.dart";
import "package:online_canteen/widgets/screenWrapper.dart";

class CanteenSelection extends StatefulWidget {
  const CanteenSelection({super.key});

  @override
  State<CanteenSelection> createState() => _CanteenSelectionState();
}

class _CanteenSelectionState extends State<CanteenSelection> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchCanteens(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          print(snapshot.data[index].id);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ScreenWrapper(
                                  title: "Menu Screen",
                                  displayScreen: MenuScreen(
                                      canteenId: snapshot.data[index].id)),
                            ),
                          );
                        },
                        child: Column(children: [
                          SizedBox(height: 9),
                          CanteenCard(
                            canteenName: snapshot.data[index].name,
                            canteenLocation: snapshot.data[index].location,
                            canteenDescription:
                                snapshot.data[index].description,
                            canteenImage: snapshot.data[index].image ??
                                "https://loremflickr.com/320/240/food",
                          ),
                        ]));
                  });
            } else {
              return Center(child: Text("No canteens found"));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
