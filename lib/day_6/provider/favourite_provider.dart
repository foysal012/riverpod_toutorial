import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/favourite_item_model.dart';
import 'favourite_state.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, FavouriteSate>((ref) {
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteSate>{
  FavouriteNotifier(): super(FavouriteSate(allItem: [], favouriteItem: [], searchQuery: ''));

  // Add
  void addItem({required FavouriteItemModel dataModel}){
    state.allItem.add(dataModel);
    state = state.copyWith(allItem: state.allItem, favouriteItem: state.allItem);
  }

  // Search
  void searchItem(String searchQuery){
    state = state.copyWith(
        favouriteItem: _searchItem(state.allItem , searchQuery)
    );
  }

  _searchItem(List<FavouriteItemModel> allItemList, String searchString){
    if(searchString.isEmpty ||searchString == null){
      return allItemList;
    } else {
      return allItemList.where((element) => element.name.toString().toLowerCase().contains(searchString.toLowerCase())).toList();
    }
  }

  // Filter
  void filterItem(String value){
    state = state.copyWith(favouriteItem: _filterItem(state.allItem, value));
  }

  _filterItem(List<FavouriteItemModel> allList, String filteredKey){
    if(filteredKey == 'All'){
      return allList;
    } else {
      return allList.where((element) => element.isFavourite == true).toList();
    }
  }

}