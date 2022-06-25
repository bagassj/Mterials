import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Items {
  final String name;
  final String img;
  final String price;
  final String stock;

  Items({
    required this.name,
    required this.img,
    required this.price,
    required this.stock
  });
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'img' : img,
    'price': price,
    'stock': stock
  };

  static Items fromJson(Map<String, dynamic> json) => Items(
    name: json['name'],
    img: json['img'], 
    price: json['price'], 
    stock: json['stock']
  );
}

class Fav {
  final String name;
  final String img;
  final String price;
  final String stock;

  Fav({
    required this.name,
    required this.img,
    required this.price,
    required this.stock
  });
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'img' : img,
    'price': price,
    'stock': stock
  };

  static Fav fromJson(Map<String, dynamic> json) => Fav(
    name: json['name'],
    img: json['img'], 
    price: json['price'], 
    stock: json['stock']
  );
}

class History {
  final String date;
  final String name;
  final String img;
  final String price;
  final String stock;

  History({
    required this.date,
    required this.name,
    required this.img,
    required this.price,
    required this.stock
  });
  
  Map<String, dynamic> toJson() => {
    'date': date,
    'name': name,
    'img' : img,
    'price': price,
    'stock': stock
  };

  static History fromJson(Map<String, dynamic> json) => History(
    date: json['date'],
    name: json['name'],
    img: json['img'], 
    price: json['price'], 
    stock: json['stock']
  );
}

class Users{
  final String name;
  final String mail;
  final String nope;

  Users({
    required this.name,
    required this.mail,
    required this.nope
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'mail': mail,
    'nope': nope
  };

  static Users fromJson(Map<String, dynamic> json) => Users(
    name: json['name'], 
    mail: json['mail'],
    nope: json['nope']
  );
}

class Images{
  final String imageUrl;

  Images({
    required this.imageUrl,
  });
  
  Map<String, dynamic> toJson() => {
    'imageUrl' : imageUrl,
  };

  static Images fromJson(Map<String, dynamic> json) => Images(
    imageUrl: json['imageUrl'], 
  );
}

