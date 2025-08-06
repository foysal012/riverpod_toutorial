import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_5/item_provider.dart';

class TodoHomeStatelessScreen extends ConsumerWidget {
  TodoHomeStatelessScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final item = ref.watch(itemProvider);
    debugPrint('build1: ${DateTime.now().second}');

    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App (Stateless)'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),

      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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

                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(itemProvider.notifier).addItem(name: nameController.text);
                    },
                    child: Container(
                      height: 40,
                      width: 60,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.cyan,
                      ),
                      child: Text('Add')),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),

            Text('All ToDo List:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              )
            ),
            SizedBox(height: 5.0),

            Expanded(
              child: Consumer(
                builder: (context, ref, child) {

                  final item = ref.watch(itemProvider);
                  debugPrint('build2: ${DateTime.now().second}');


                  if(item.isEmpty){
                    return Center(child: Text('No data found'));
                  }

                  return ListView.builder(
                      itemCount: item.length,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {

                        final itemData = item[index];
                        return ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.cyan.shade200
                            ),
                            child: Text('${index+1}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                          ),

                          title: Text('${itemData.name}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),

                          subtitle: Text('${itemData.id}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black
                            ),
                          ),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    // ref.read(itemProvider.notifier).removeItem(id: itemData.id);

                                  },
                                  icon: Icon(Icons.edit, color: Colors.green)
                              ),
                              SizedBox(width: 5.0),

                              IconButton(
                                  onPressed: () {
                                    ref.read(itemProvider.notifier).removeItem(id: itemData.id);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red)
                              ),
                            ],
                          ),
                        );
                      },
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
