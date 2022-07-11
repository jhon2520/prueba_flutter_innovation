import 'package:flutter/material.dart';
import 'package:innovation_test/models/product_model.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String productField = "";
  Product productToCreate = Product(
      id: "",
      producto: "",
      productId: 0,
      codigo: "",
      estado: true,
      descripcion: "",
      precio: 0,
      idCategoria: "");

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
