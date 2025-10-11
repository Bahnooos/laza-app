// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCategoriesModel _$HomeCategoriesModelFromJson(Map<String, dynamic> json) =>
    HomeCategoriesModel(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeCategoriesModelToJson(
  HomeCategoriesModel instance,
) => <String, dynamic>{'categories': instance.categories};

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  coverPictureUrl: json['coverPictureUrl'] as String?,
);

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'coverPictureUrl': instance.coverPictureUrl,
    };
