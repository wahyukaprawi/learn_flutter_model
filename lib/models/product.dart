import 'package:flutter/material.dart';

class Product {
  @required
  String judul;
  @required
  String imageURL;
  @required
  int harga;
  @required
  String deskripsi;

  Product(this.judul, this.imageURL, this.harga, this.deskripsi); 
}