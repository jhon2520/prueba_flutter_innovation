
import 'package:flutter/material.dart';
import 'package:innovation_test/ui/ui.dart';

class PrimaryButton extends StatelessWidget {

  final Function callback;

  const PrimaryButton({
    Key? key,
    required this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        callback();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)), 
      elevation: 0,
      color: AppConst.primaryColor,
      child:  Container(
        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: const Text("Ingresar",style: TextStyle(color:  AppConst.fontColor),)
        
        ),
    );
  }
}