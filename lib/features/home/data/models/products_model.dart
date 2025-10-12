import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

// This class represents the entire response which contains a list of items.
@JsonSerializable()
class ProductList {
  final List<ProductItem>? items;
  final int ? page;
  final int ? pageSize;
  final int ? totalCount;
  final bool ? hasNextPage;
  final bool ? hasPreviousPage;


  const ProductList(this.page, this.pageSize, this.totalCount, this.hasNextPage, this.hasPreviousPage, {this.items});

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);
}

@JsonSerializable()
class ProductItem {
  final String? id;
  final String? productCode;
  final String? name;
  final String? description;
  final String? arabicName;
  final String? arabicDescription;
  final String? coverPictureUrl;
  final List<String>? productPictures; 
  final double? price;
  final int? stock;
  final double? weight;
  final String? color;
  final int? rating;
  final int? reviewsCount;
  final int? discountPercentage;
  final String? sellerId;
  final List<String>? categories;

  const ProductItem({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.arabicName,
    required this.arabicDescription,
    required this.coverPictureUrl,
    required this.productPictures,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.rating,
    required this.reviewsCount,
    required this.discountPercentage,
    required this.sellerId,
    required this.categories,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
}