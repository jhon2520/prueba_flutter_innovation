import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innovation_test/models/product_model.dart';
//import 'package:movies/src/models/pelicula_model.dart';

class HorizontalCards extends StatelessWidget {

   final List<Product> products;
  // final List<Pelicula> peliculas;
  //final Function siguientePagina;

  //MovieHorizontal({/*@required this.peliculas*/, @required this.siguientePagina});

  const HorizontalCards({super.key, required this.products});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
      final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.35);



    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 100) {
        // siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.25,
      color: Colors.green,
      child: PageView.builder(
        //se quita el magneto a la hora de arrastrar las imágenes
        pageSnapping: false,
        //cantidad de tarjetas mostradas en pantalla viewportFraction
        controller: _pageController,
        // itemCount: peliculas.length, 
        itemCount: products.length, 
        itemBuilder: (context, index) {
          return _tarjeta(context , products[index]);
        },
       // children: _tarjetas(),
      ),
    );
  }

Widget _tarjeta(BuildContext context, Product product){

  //  pelicula.uniqueId = "${pelicula.id}-poster";
  final random = Random();

    final tarjeta =  Container(
        color: Colors.amberAccent,
        margin: const EdgeInsets.only(right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //el hero crea una transición de las tarjetas entre las páginas
            ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              color: Colors.indigoAccent,
              width: 200,
              height: 150,
            )
              ),
            Text(
              // pelicula.title, 
              product.codigo!, 
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 9),
            )
          ],
        ),
      );

      return GestureDetector(
        child: tarjeta,
        onTap: (){

          //en el navigator estoy mandando la película a modo de argumento
          //para que en la página detalle esta llegue con todas sus
          //características y poderlas usar
          //Navigator.pushNamed(context, 'detalle',arguments: "pelicula");
        },
      );
}

}
