import '../model/favourite_item_model.dart';

class FavouriteSate {

  List<FavouriteItemModel> allItem;
  List<FavouriteItemModel> favouriteItem;
  String searchQuery;

  FavouriteSate({
    required this.allItem,
    required this.favouriteItem,
    required this.searchQuery
  });

  FavouriteSate copyWith({List<FavouriteItemModel>? allItem, List<FavouriteItemModel>? favouriteItem, String? searchQuery}){
    return FavouriteSate(
    allItem: allItem ?? this.allItem,
    favouriteItem: favouriteItem ?? this.favouriteItem,
    searchQuery: searchQuery ?? this.searchQuery
    );
  }
}