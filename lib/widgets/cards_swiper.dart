
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:innovation_test/models/product_model.dart';

class CardsSwiper extends StatelessWidget {

  final List<Product> products;

  const CardsSwiper({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final Size size = MediaQuery.of(context).size;

    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Listener(
            onPointerMove: (details) {
              if(details.delta.dx > 0){
                print("Derecha");
              }
              if(details.delta.dx < 0){
                Navigator.pushNamed(context, "list",arguments: "");
              }

            },
            child: Container(
              color: Colors.amber,
              height: size.height * 0.35,
            ),
          ),
        );
      },
      itemCount: products.length,
      itemWidth: 300,
      layout: SwiperLayout.TINDER,
      
    );
  }
}
