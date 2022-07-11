import 'package:flutter/material.dart';
import 'package:innovation_test/models/product_model.dart';
import 'package:innovation_test/providers/product_provider.dart';
import 'package:innovation_test/screens/list_screen.dart';
import 'package:innovation_test/ui/const.dart';
import 'package:innovation_test/ui/transition_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

class CardsSwiper extends StatelessWidget {
  final List<Product> products;

  const CardsSwiper({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final formatCurrency = NumberFormat.simpleCurrency();
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.getProduct();

    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: size.height * 0.25,
            decoration: _buildContainerSwiperDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    products[index].producto,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _RowOptions(productProvider: productProvider, products: products,index:index),
                  Text(
                    "Precio: ${formatCurrency.format(products[index].precio)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  footer(index)
                ],
              ),
            ),
          ),
        );
      },
      itemCount: products.length,
      itemWidth: 300,
      layout: SwiperLayout.STACK,
    );
  }

  Container footer(int index) {
    return Container(
      height: 60,
      width: double.infinity,
      color: products[index].estado
          ? AppConst.primaryColor.withOpacity(0.8)
          : AppConst.deleteColor.withOpacity(0.7),
      child: Center(
          child: Text(
        "¿Disponible? : ${products[index].estado ? "Si" : "No"}",
        style: const TextStyle(color: Colors.white, fontSize: 16),
      )),
    );
  }

  BoxDecoration _buildContainerSwiperDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black.withOpacity(0.08)),
    );
  }
}

class _RowOptions extends StatelessWidget {
  const _RowOptions({
    Key? key,
    required this.productProvider,
    required this.products,
    required this.index
  }) : super(key: key);

  final ProductProvider productProvider;
  final List<Product> products;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Icon(Icons.delete_forever,
              color: AppConst.primaryColor.withAlpha(30),
              size: 30),
          onTap: () {
            productProvider.activeProduct = products[index];
            productProvider.deleteProduct(
                productProvider.activeProduct?.productId);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
              content: Text("Procuto eliminado"),
              duration: Duration(milliseconds: 400),
            ));
          },
        ),
        Text("${products[index].descripcion}"),
        GestureDetector(
          child: Icon(
            Icons.edit,
            color: AppConst.primaryColor.withAlpha(30),
            size: 30,
          ),
          onTap: () {
            productProvider.activeProduct = products[index];
            productProvider.updateFlag =true;

            Navigator.push(
              context,
              nagivatorTransitions(screen: const ListScreen()),
            );
          },
        ),
      ],
    );
  }
}
