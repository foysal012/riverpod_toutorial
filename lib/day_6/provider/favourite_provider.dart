import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_5/item_model.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, List<ItemModel>>((ref) {
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<List<ItemModel>>{
  FavouriteNotifier(): super([]);

  void addItem(){

  }

  void searchItem(){

  }

  void filterItem(){

  }

}