class Product {
  String name;
  String price;
  String imagePath;
  String rating;
  int quantity;
  bool isLiked;

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    this.quantity = 1,
    this.isLiked = false,
  });

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
  int get _quantity => quantity;
  bool get _isLiked => isLiked;
}
