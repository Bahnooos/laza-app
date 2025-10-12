
import 'package:json_annotation/json_annotation.dart';
part 'home_categories_model.g.dart';

@JsonSerializable()
class HomeCategoriesModel {
  final List<Categories>? categories;

  const HomeCategoriesModel({required this.categories});
  factory HomeCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoriesModelFromJson(json);
}

@JsonSerializable()
class Categories {
  final String? id;
  final String? name;
  final String? description;
  final String? coverPictureUrl;

  const Categories({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}
