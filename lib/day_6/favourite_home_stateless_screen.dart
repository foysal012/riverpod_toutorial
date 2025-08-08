import 'package:flutter/material.dart';

class FavouriteHomeStatelessScreen extends StatelessWidget {
  FavouriteHomeStatelessScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  bool isFavouriteGroupValue = true;
  bool yseFavouriteValue = true;
  bool noFavouriteValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App (Stateless)'),
        centerTitle: true,
        backgroundColor: Colors.indigo[200],
      ),

      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )
            ),
            SizedBox(height: 5.0),

            TextFormField(
              controller: nameController,
              decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Colors.cyan,
                          width: 2.0
                      )
                  ),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Colors.cyan,
                          width: 2.0
                      )
                  )
              ),
            ),
            SizedBox(height: 10.0),

            Text('Favourite',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                        value: yseFavouriteValue,
                        groupValue: isFavouriteGroupValue,
                        onChanged: (value) {
                          isFavouriteGroupValue = value??false;
                        },
                    ),

                    Text('Yes')
                  ],
                ),

                Row(
                  children: [
                    Radio(
                      value: noFavouriteValue,
                      groupValue: isFavouriteGroupValue,
                      onChanged: (value) {
                        isFavouriteGroupValue = value??false;
                      },
                    ),

                    Text('No')
                  ],
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
