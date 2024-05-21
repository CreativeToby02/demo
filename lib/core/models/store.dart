import 'package:demo_app/core/models/address.dart';
import 'package:demo_app/core/models/credit_card.dart';
import 'package:demo_app/core/models/product.dart';
import 'package:flutter/material.dart';

class Store extends ChangeNotifier {
  final List<Product> _productMenu = [
    //T-shirt
    Product(
      name: 'T-shirt',
      price: '2500',
      imagePath: 'T-shirt',
      rating: '4.0',
    ),
    //Cardigan
    Product(
      name: 'Cardigan',
      price: '3500',
      imagePath: 'Cardigan',
      rating: '3.5',
    ),
    //High Boots
    Product(
      name: 'High Boots',
      price: '1500',
      imagePath: 'High Boots',
      rating: '4.0',
    ),
    // Jeans
    Product(
      name: 'Jeans',
      price: '2000',
      imagePath: 'Jeans',
      rating: '4.0',
    ),
    //Snikers
    Product(
      name: 'Snickers',
      price: '4500',
      imagePath: 'Snickers',
      rating: '4.0',
    ),
    //Sweater
    Product(
      name: 'Coat',
      price: '2500',
      imagePath: 'Coat',
      rating: '4.0',
    ),
    //Trave Bag
    Product(
      name: 'Travel Bag',
      price: '2500',
      imagePath: 'Travel Bag',
      rating: '4.0',
    ),
  ];

  int _totalPrice = 0;

  int get totalPrice => _totalPrice;

  void calculateSubTotal() {
    _totalPrice = _cart.fold(
      0,
      (previousValue, product) =>
          previousValue + int.parse(product.price) * product.quantity,
    );
    notifyListeners();
  }

  void calculateTotalPrice(int price) {
    _totalPrice += price;
    notifyListeners();
  }

  //Customer Cart
  final List<Product> _cart = [];
  final List<Product> _savedItem = [];
  final List<CreditCard> _creditCardItem = [
    CreditCard(cardName: 'VISA', cardDigits: '**** **** **** 2134')
  ];
  final List<Address> _addressItem = [
    Address(
      addressName: 'Home',
      addressFullname: '28, Church street, Ikorodu Lagos Road, Lagos.',
    )
  ];

  //getter methods
  List<Product> get productMenu => _productMenu;
  List<Product> get cart => _cart;
  List<Product> get savedItem => _savedItem;
  List<Address> get addressItem => _addressItem;
  List<CreditCard> get creditCardItem => _creditCardItem;

  void addToProduct(Product product) {
    _productMenu.add(product);
    notifyListeners();
  }

  void removeFromProduct(Product product) {
    _productMenu.remove(product);
    notifyListeners();
  }

  //add to cart
  void addToCart(Product productItem) {
    _cart.add(productItem);
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Product productItem) {
    _cart.remove(productItem);
    notifyListeners();
  }

  void addToSavedItem(Product savedItem) {
    _savedItem.add(savedItem);
    notifyListeners();
  }

  void removeFromSavedItem(Product savedItem) {
    _savedItem.remove(savedItem);
    notifyListeners();
  }

  void addToAddress(Address address) {
    _addressItem.add(address);
    notifyListeners();
  }

  void removeFromAddress(Address address) {
    _addressItem.remove(address);
    notifyListeners();
  }

  void addToCreditCard(CreditCard creditCard) {
    _creditCardItem.add(creditCard);
    notifyListeners();
  }

  void removeFromCreditCard(CreditCard creditCard) {
    _creditCardItem.remove(creditCard);
    notifyListeners();
  }
}
