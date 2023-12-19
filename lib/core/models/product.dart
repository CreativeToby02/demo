class Product {
  String name;
  String price;
  String imagePath;
  String rating;
  // bool isLiked;

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    // required this.isLiked,
  });

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
  // bool get _isLiked => isLiked;
}
