import "package:flutter/material.dart";
import "package:online_canteen/resources/firestoreMethods.dart";
import "package:online_canteen/widgets/canteenCard.dart";
import "package:online_canteen/widgets/itemCard.dart";

class MenuScreen extends StatefulWidget {
  String canteenId;
  MenuScreen({required this.canteenId, super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchMenu(widget.canteenId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          print(snapshot.data[index]);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Placeholder(),
                            ),
                          );
                        },
                        child: 
                        Column(
                          children: [
                            SizedBox(height: 9),
                            ItemCard(
                              itemId: "snapshot.data[index].item_id",
                              canteenId: widget.canteenId,
                              name: snapshot.data[index].name,
                              price: snapshot.data[index].price,
                              description: snapshot.data[index].description,
                              image: snapshot.data[index].image ??
                                  "https://loremflickr.com/320/240/food",
                            ),
                          ],
                        ));
                  });
            } else {
              return Center(child: Text("No Menu found"));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
