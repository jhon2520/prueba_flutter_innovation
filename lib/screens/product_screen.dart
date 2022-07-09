import 'package:flutter/material.dart';
import 'package:innovation_test/providers/product_provider.dart';
import 'package:innovation_test/ui/ui.dart';
import 'package:innovation_test/widgets/horizontal_cards.dart';
import 'package:innovation_test/widgets/widgets.dart';
import 'package:provider/provider.dart';



class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);

    print(productProvider.globalProducts);

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text("Productos"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Colors.red,
                width: double.infinity,
                height: size.height * 0.5,
                child: CardsSwiper(products: productProvider.globalProducts)),
            HorizontalCards(products: productProvider.globalProducts)
          ],

        )
        //floatingActionButton: _floatingActionsButtons()
        );
  }
}

class _floatingActionsButtons extends StatelessWidget {
  const _floatingActionsButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.edit_note_outlined),
              backgroundColor: AppConst.editColor,
              heroTag: "edit",
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: AppConst.primaryColor,
              heroTag: "add",
              ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.delete_forever),  
              backgroundColor: AppConst.deleteColor,
              heroTag: "delete",
            ),
          ),
        ],
      ),
    );
  }
}
