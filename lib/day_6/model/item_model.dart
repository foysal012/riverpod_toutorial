
class ItemModel{
  final String name;
  final String id;
  final bool isFavourite;

  ItemModel({required this.name, required this.id, required this.isFavourite});

  ItemModel copyWith ({String? name, String? id, bool? isFavourite}){
    return ItemModel(
        name: name ?? this.name,
        id: id ?? this.id,
        isFavourite: isFavourite ?? this.isFavourite
    );
  }
}