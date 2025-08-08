import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_5/item_model.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<ItemModel>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<ItemModel>>{
  ItemNotifier() : super([]);

  void addItem({required String name}){
    final item = ItemModel(
        name: name,
        id: DateTime.now().toString()
    );
    state.add(item);
    state = state.toList();
  }

  void removeItem({required String id}){
    state.removeWhere((element) => element.id == id);
    state = state.toList();
  }

  void editItem({required String id, required String name}){
    final foundIndex = state.indexWhere((element) => element.id == id);
    state[foundIndex].name = name;
    state = state.toList();
  }
}