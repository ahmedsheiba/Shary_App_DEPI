class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String? description;
  final String image;
  final RatingModel? rating;
  final String? category;

  ProductModel({
    this.id,
    required this.title,
    required this.price,
    this.description,
    required this.image,
    this.rating,
    this.category,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      image: jsonData['image'],
      category: jsonData['category'],
      rating: RatingModel.fromJson(
        jsonData['rating'],
      ),
    );
  }
}

class RatingModel {
  final dynamic rating;
  final int count;

  RatingModel({
    required this.rating,
    required this.count,
  });

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rating: jsonData['rating'], count: jsonData['count']);
  }
}
