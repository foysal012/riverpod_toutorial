import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/favourite_item_model.dart';
import 'favourite_state.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, FavouriteSate>((ref) {
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteSate>{
  FavouriteNotifier(): super(FavouriteSate(allItem: [], favouriteItem: [], searchQuery: ''));

  void addItem({required FavouriteItemModel dataModel}){
    List<FavouriteItemModel> dataList = [];
    dataList.add(dataModel);
    state.allItem.add(dataModel);
    state = state.copyWith(allItem: state.allItem, favouriteItem: state.allItem);
  }

  void searchItem(String searchQuery){
    state = state.copyWith(allItem: _searchItem(state.allItem , searchQuery), favouriteItem: _searchItem(state.allItem , searchQuery));
  }

  _searchItem(List<FavouriteItemModel> allItemList, String searchString){
    if(searchString.isEmpty ||searchString == null){
      return allItemList;
    } else {
      return allItemList.where((element) => element.name.toString().toLowerCase().contains(searchString.toLowerCase())).toList();
    }
  }

  void filterItem(){

  }

}