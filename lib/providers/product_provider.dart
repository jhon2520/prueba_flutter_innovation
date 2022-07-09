
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:innovation_test/models/product_model.dart';

class ProductProvider extends ChangeNotifier{


  final String _baseUrl = "innovation-back.herokuapp.com";
  List<Product> globalProducts = [];

  ProductProvider(){
    print("Product provider iniciado");
    getProduct();
  }

  getProduct() async{
    
    var url = Uri.https(_baseUrl, "/api/products");
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final List<dynamic> products = decodedData["products"];
    //print(response.body.runtimeType); //String
    
    final List<Product> totalProducts = [];

    for(var product in products){
      totalProducts.add(Product.fromMap(product));
    }
    
    this.globalProducts = totalProducts;
    notifyListeners();


  }

}