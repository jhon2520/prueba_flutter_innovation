import 'package:flutter/material.dart';
import 'package:innovation_test/providers/product_provider.dart';
import 'package:innovation_test/screens/screens.dart';
import 'package:innovation_test/ui/ui.dart';
import 'package:innovation_test/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Productos"),
          actions: [
            GestureDetector(
              child: Container(
                  width: 35,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.08),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.add, size: 30)),
              onTap: () {
                productProvider.setDefaultActiveProduce();
                productProvider.updateFlag =false;
                Navigator.push(
                  context,
                  nagivatorTransitions(screen: const ListScreen()),
                );
              },
            )
          ],
        ),
        body: BodyContainer(size: size, productProvider: productProvider));
  }
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    Key? key,
    required this.size,
    required this.productProvider,
  }) : super(key: key);

  final Size size;
  final ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Elimina o edita un producto desde las opciones de cada tarjeta",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: size.height * 0.45,
                  child: CardsSwiper(products: productProvider.globalProducts)),
              const SizedBox(
                height: 30,
              ),
              const Text("Todos los productos",
                  style: TextStyle(fontSize: 14, color: Colors.black54)),
              const SizedBox(
                height: 30,
              ),
              HorizontalCards(products: productProvider.globalProducts)
            ],
          ),
          const Positioned(
              top: 20,
              left: -15,
              child: BubbleDecoration(
                radius: 50,
                opacity: 0.2,
              )),
          Positioned(
            bottom: 200,
            right: 0,
            child: Transform.rotate(
              angle: 45,
              child: SquareDecoration(
                height: 40,
                width: 30,
                color: Colors.orangeAccent.withOpacity(0.1),
              ),
            ),
          ),
          const Positioned(
              top: 20,
              left: -15,
              child: BubbleDecoration(
                radius: 50,
                opacity: 0.1,
              )),
          Positioned(
            top: 10,
            right: -50,
            child: Transform.rotate(
              angle: 45,
              child: SquareDecoration(
                height: 60,
                width: 100,
                color: Colors.purple.withOpacity(0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
