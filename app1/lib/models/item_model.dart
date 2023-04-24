import 'dart:convert';

class ItemModel {

  final String name;
  final String imageitem;
  final String model;
  final String comment;
  final String skin;
  final String urlitem;
  final String type;
  ItemModel({
    required this.name,
    required this.imageitem,
    required this.model,
    required this.comment,
    required this.skin,
    required this.urlitem,
    required this.type,
  });

  ItemModel copyWith({
    String? name,
    String? imageitem,
    String? model,
    String? comment,
    String? skin,
    String? urlitem,
    String? type,
  }) {
    return ItemModel(
      name: name ?? this.name,
      imageitem: imageitem ?? this.imageitem,
      model: model ?? this.model,
      comment: comment ?? this.comment,
      skin: skin ?? this.skin,
      urlitem: urlitem ?? this.urlitem,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'imageitem': imageitem});
    result.addAll({'model': model});
    result.addAll({'comment': comment});
    result.addAll({'skin': skin});
    result.addAll({'urlitem': urlitem});
    result.addAll({'type': type});
  
    return result;
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      name: map['name'] ?? '',
      imageitem: map['imageitem'] ?? '',
      model: map['model'] ?? '',
      comment: map['comment'] ?? '',
      skin: map['skin'] ?? '',
      urlitem: map['urlitem'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemModel(name: $name, imageitem: $imageitem, model: $model, comment: $comment, skin: $skin, urlitem: $urlitem, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ItemModel &&
      other.name == name &&
      other.imageitem == imageitem &&
      other.model == model &&
      other.comment == comment &&
      other.skin == skin &&
      other.urlitem == urlitem &&
      other.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      imageitem.hashCode ^
      model.hashCode ^
      comment.hashCode ^
      skin.hashCode ^
      urlitem.hashCode ^
      type.hashCode;
  }
}
