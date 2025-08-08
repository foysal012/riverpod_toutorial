import 'package:riverpod_toutorial/day_5/item_model.dart';

class FavouriteSate {

  List<ItemModel> allItem;
  List<ItemModel> favouriteItem;
  String searchQuery;

  FavouriteSate({
    required this.allItem,
    required
    this.favouriteItem,
    required
    this.searchQuery
  });

  FavouriteSate copyWith({List<ItemModel>? allItem, List<ItemModel>? favouriteItem, String? searchQuery}){
    return FavouriteSate(
    allItem: allItem ?? this.allItem,
    favouriteItem: favouriteItem ?? this.favouriteItem,
    searchQuery: searchQuery ?? this.searchQuery
    );
  }
}