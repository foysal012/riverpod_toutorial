import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_6/provider/favourite_provider.dart';
import 'model/favourite_item_model.dart';

class FavouriteHomeStatefulScreen extends ConsumerStatefulWidget {
  const FavouriteHomeStatefulScreen({super.key});

  @override
  ConsumerState<FavouriteHomeStatefulScreen> createState() => _FavouriteHomeStatefulScreenState();
}

class _FavouriteHomeStatefulScreenState extends ConsumerState<FavouriteHomeStatefulScreen> {

  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isFavouriteGroupValue = true;
  bool yseFavouriteValue = true;
  bool noFavouriteValue = false;

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build1 ${DateTime.now()}');
    // final favourite = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App (Stateful)'),
        centerTitle: true,
        backgroundColor: Colors.indigo[200],

        actions: [
          Consumer(
              builder: (context, ref, child) {
                debugPrint('Build3 ${DateTime.now()}');
                // final favourite = ref.watch(favouriteProvider);
                return PopupMenuButton<String>(
                  onSelected: (value) {
                    ref.read(favouriteProvider.notifier).filterItem(value);
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(value: 'All', child: Text('all')),
                    const PopupMenuItem<String>(value: 'Favourite', child: Text('favourite')),
                  ],
                );
              }
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Search',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )
            ),
            SizedBox(height: 5.0),

            TextFormField(
              controller: searchController,
              onChanged: (value) {
                ref.read(favouriteProvider.notifier).searchItem(searchController.text);
              },
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
                ),
              ),
            ),
            SizedBox(height: 10.0),

            Expanded(
                child:
                Consumer(
                    builder: (context, ref, child) {
                      debugPrint('Build4 ${DateTime.now()}');
                      final favourite = ref.watch(favouriteProvider);
                      return favourite.allItem.isEmpty?
                      Center(child: Text('No data found')):
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: favourite.favouriteItem.length,
                        itemBuilder: (context, index) {
                          final dataInfo = favourite.favouriteItem[index];
                          return ListTile(
                              leading: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.indigo[200],
                                  ),
                                  child: Text('${index+1}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                              ),

                              title: Text(dataInfo.name,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                              trailing: Icon(
                                  dataInfo.isFavourite == true ? Icons.favorite :
                                  Icons.favorite_border,
                                  color: dataInfo.isFavourite == true ?
                                  Colors.cyan : Colors.indigo[200]
                              )
                          );
                        },
                      );
                    }
                )
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Added item form'),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                              Icons.close,
                              color: Colors.red
                          )
                      )
                    ],
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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

                      StatefulBuilder(builder: (context, setState) {
                        return Row(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: yseFavouriteValue,
                                  groupValue: isFavouriteGroupValue,
                                  onChanged: (value) {
                                    isFavouriteGroupValue = value??false;
                                    setState(() {

                                    });
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
                                    setState(() {

                                    });
                                  },
                                ),

                                Text('No')
                              ],
                            )
                          ],
                        );
                      },)
                    ],
                  ),

                  actions: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 42,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red,
                        ),
                        child: Text('Cancel'),
                      ),
                    ),
                    SizedBox(width: 5.0),

                    Consumer(
                        builder: (context, ref, child) {
                          debugPrint('Build2 ${DateTime.now()}');
                          // final favourite = ref.watch(favouriteProvider);
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              ref.read(favouriteProvider.notifier).addItem(
                                  dataModel: FavouriteItemModel(
                                    isFavourite: isFavouriteGroupValue,
                                    name: nameController.text,
                                    id: DateTime.now().toString(),
                                  )
                              );
                              nameController.clear();
                              isFavouriteGroupValue = true;
                            },
                            child: Container(
                              height: 42,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.green,
                              ),
                              child: Text('Add'),
                            ),
                          );
                        }
                    )
                  ],
                );
              },
            );
          },
          child: Icon(Icons.add)
      ),

    );
  }
}
