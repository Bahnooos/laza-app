// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{'items': instance.items};

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
  id: json['id'] as String?,
  productCode: json['productCode'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  arabicName: json['arabicName'] as String?,
  arabicDescription: json['arabicDescription'] as String?,
  coverPictureUrl: json['coverPictureUrl'] as String?,
  productPictures: (json['productPictures'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  price: (json['price'] as num?)?.toDouble(),
  stock: (json['stock'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toDouble(),
  color: json['color'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
  reviewsCount: (json['reviewsCount'] as num?)?.toInt(),
  discountPercentage: (json['discountPercentage'] as num?)?.toInt(),
  sellerId: json['sellerId'] as String?,
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productCode': instance.productCode,
      'name': instance.name,
      'description': instance.description,
      'arabicName': instance.arabicName,
      'arabicDescription': instance.arabicDescription,
      'coverPictureUrl': instance.coverPictureUrl,
      'productPictures': instance.productPictures,
      'price': instance.price,
      'stock': instance.stock,
      'weight': instance.weight,
      'color': instance.color,
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'discountPercentage': instance.discountPercentage,
      'sellerId': instance.sellerId,
      'categories': instance.categories,
    };
