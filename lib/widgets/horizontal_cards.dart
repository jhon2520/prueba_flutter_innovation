import 'package:flutter/material.dart';
import 'package:innovation_test/models/product_model.dart';
import 'package:innovation_test/ui/const.dart';
import 'package:intl/intl.dart';

class HorizontalCards extends StatelessWidget {
  final List<Product> products;

  const HorizontalCards({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final pageController =
        PageController(initialPage: 1, viewportFraction: 0.35);

    return Container(
      height: screenSize.height * 0.2,
      color: Colors.grey[100],
      // color: Colors.green,
      child: PageView.builder(
        //se quita el magneto a la hora de arrastrar las imágenes
        pageSnapping: false,
        controller: pageController,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _tarjeta(context, products[index]);
        },
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Product product) {
    final formatCurrency = NumberFormat.simpleCurrency();
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 100),
                child: Container(
                  color: Colors.white,
                  width: 200,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.producto,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${product.descripcion}"),
                        Text(
                          formatCurrency.format(product.precio),
                          style: const TextStyle(fontSize: 12),
                        ),
                        footer(product)
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Container footer(Product product) {
    return Container(
      height: 30,
      width: double.infinity,
      color: product.estado
          ? AppConst.primaryColor.withOpacity(0.8)
          : AppConst.deleteColor.withOpacity(0.7),
      child: Center(
          child: Text(
        "¿Disponible? : ${product.estado ? "Si" : "No"}",
        style: const TextStyle(color: Colors.white, fontSize: 12),
      )),
    );
  }
}
