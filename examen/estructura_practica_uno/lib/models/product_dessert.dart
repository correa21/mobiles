// TODO: Agregar al ProductRepository una lista de estos productos.

import 'dart:math';

import 'package:flutter/foundation.dart';

class ProductDesserts {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  bool liked;

  ProductDesserts({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo al weight del producto
    productPrice = productPriceCalculator();
  }

  double productPriceCalculator() {
    //   if (this.productWeight == ProductWeight.CUARTO)
    return (20 + Random().nextInt(40)).toDouble();
    //   if (this.productWeight == ProductWeight.KILO)
    //     return (40 + Random().nextInt(60)).toDouble();
    //   return 9999.0;
  }
}
