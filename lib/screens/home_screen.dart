import 'package:flutter/material.dart';
import 'package:innovation_test/screens/product_screen.dart';
import 'package:innovation_test/ui/ui.dart';
import 'package:innovation_test/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    


    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: _buildBoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Positioned(
                top: size.height/3,
                left: 0,
                child: Image(
                  width: size.width,
                  image: AssetImage("assets/logo.PNG"),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 40,),
              PrimaryButton(
                // callback: ()=>getProducts(),
                callback: ()=> Navigator.push(context,nagivatorTransitions( screen: const ProductScreen()),),
              )
            ],

          ),
        ),
      ),
    );
  }



  BoxDecoration _buildBoxDecoration() {
    
    return BoxDecoration(
      // color: Colors.red
    );
  }


}
