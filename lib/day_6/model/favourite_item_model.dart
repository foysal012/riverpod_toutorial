
class FavouriteItemModel{
  final String name;
  final String id;
  final bool isFavourite;

  FavouriteItemModel({required this.name, required this.id, required this.isFavourite});

  FavouriteItemModel copyWith ({String? name, String? id, bool? isFavourite}){
    return FavouriteItemModel(
        name: name ?? this.name,
        id: id ?? this.id,
        isFavourite: isFavourite ?? this.isFavourite
    );
  }
}