import 'package:flutter/material.dart';
import 'package:innovation_test/screens/screens.dart';
import 'package:innovation_test/ui/ui.dart';
import 'package:innovation_test/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  top: size.height / 3,
                  left: 0,
                  child: Image(
                    width: size.width,
                    image: const AssetImage("assets/logo.PNG"),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                PrimaryButton(
                  // callback: ()=>getProducts(),
                  callback: () => Navigator.push(
                    context,
                    nagivatorTransitions(screen: const ProductScreen()),
                  ),
                )
              ],
            ),
            //Decoration
            //top
            const Positioned(
                top: 25,
                right: 60,
                child: BubbleDecoration(
                  radius: 10,
                  opacity: 0.08,
                )),
            const Positioned(
                top: 30,
                right: 80,
                child: BubbleDecoration(
                  radius: 20,
                  opacity: 0.1,
                )),
            const Positioned(
                top: 40,
                right: 110,
                child: BubbleDecoration(
                  radius: 30,
                  opacity: 0.2,
                )),
            const Positioned(
                top: 60,
                right: 140,
                child: BubbleDecoration(
                  radius: 40,
                  opacity: 0.3,
                )),
            const Positioned(
                top: 100,
                right: 180,
                child: BubbleDecoration(
                  radius: 50,
                  opacity: 0.4,
                )),
            //botton
            const Positioned(
                bottom: 25,
                left: 60,
                child: BubbleDecoration(
                  radius: 10,
                  opacity: 0.35,
                )),
            const Positioned(
                bottom: 30,
                left: 80,
                child: BubbleDecoration(
                  radius: 20,
                  opacity: 0.25,
                )),
            const Positioned(
                bottom: 40,
                left: 110,
                child: BubbleDecoration(
                  radius: 30,
                  opacity: 0.2,
                )),
            const Positioned(
                bottom: 60,
                left: 140,
                child: BubbleDecoration(
                  radius: 40,
                  opacity: 0.12,
                )),
            const Positioned(
                bottom: 100,
                left: 180,
                child: BubbleDecoration(
                  radius: 50,
                  opacity: 0.08,
                )),

            Positioned(
              bottom: 260,
              right: 20,
              child: Transform.rotate(
                angle: 45,
                child: SquareDecoration(
                  height: 20,
                  width: 20,
                  color: Colors.teal.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: -10,
              child: Transform.rotate(
                angle: 45,
                child: SquareDecoration(
                  height: 30,
                  width: 40,
                  color: Colors.deepOrangeAccent.withOpacity(0.3),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }






}

