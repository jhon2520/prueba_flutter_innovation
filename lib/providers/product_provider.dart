import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:innovation_test/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final String _baseUrl = "innovation-back.herokuapp.com";
  List<Product> globalProducts = [];
  List<String> globalCategories = [];
  bool updateFlag = true;
  Product? activeProduct;

  ProductProvider() {
    getProduct();
    getCategories();
  }

  getProduct() async {
    var url = Uri.https(_baseUrl, "/api/products");
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final List<dynamic> products = decodedData["products"];
    //print(response.body.runtimeType); //String

    final List<Product> totalProducts = [];

    for (var product in products) {
      totalProducts.add(Product.fromMap(product));
    }

    globalProducts = totalProducts;
    notifyListeners();
  }

  setDefaultActiveProduce() {
    activeProduct = Product(
        id: "",
        producto: "",
        productId: globalProducts.length + 1,
        codigo: "",
        estado: true,
        descripcion: "",
        precio: 1,
        idCategoria: "");
  }

  getCategories() async {
    var url = Uri.https(_baseUrl, "/api/categories");
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final List<dynamic> categories = decodedData["categories"];

    final List<String> totalcategories = [];

    for (var product in categories) {
      totalcategories.add(product["nombre"]);
    }

    globalCategories = totalcategories;
    notifyListeners();
  }

  deleteProduct(int? id) async {
    var url = Uri.https(_baseUrl, "/api/products/$id");
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      notifyListeners();
    }
  }

  createProduct(Product product) async {
    final response = await http.post(
        Uri.parse("https://innovation-back.herokuapp.com/api/products/new"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "id": product.id.toString(),
          "producto": product.producto,
          "codigo": product.codigo,
          "estado": product.estado,
          "descripcion": product.descripcion,
          "precio": product.precio,
          "idCategoria": product.idCategoria
        }));

    print(response.statusCode);  
    notifyListeners();
    
  }

  updateProduct(int id, Product productChanged) async {
    final response = await http.put(
        Uri.parse("https://innovation-back.herokuapp.com/api/products/$id"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "id": productChanged.productId.toString(),
          "producto": productChanged.producto,
          "codigo": productChanged.codigo,
          "estado": productChanged.estado,
          "descripcion": productChanged.descripcion,
          "precio": productChanged.precio,
          "idCategoria": productChanged.idCategoria
        }));

    notifyListeners();

  }
}
