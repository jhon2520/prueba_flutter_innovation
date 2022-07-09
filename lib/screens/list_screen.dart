import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innovation_test/providers/product_form_provider.dart';
import 'package:innovation_test/ui/ui.dart';
import 'package:provider/provider.dart';





class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_)=> ProductFormProvider(),)
      ],
      child: FormProducts(),
    );
  }
}


class FormProducts extends StatelessWidget {
  const FormProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Product"),
      ),
      body: _FormContainer(),
    );
  }
}

class _FormContainer extends StatelessWidget {
  const _FormContainer({
    Key? key,
  }) : super(key: key);


 

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final Size size = MediaQuery.of(context).size;

    final items = [

      "elemento 1",
      "elemento 2",
      "elemento 3",
      "elemento 4",
      "elemento 5",

    ];

    final initialValue = "elemento 1";


    return SingleChildScrollView(
      child: Container(
        // color: Colors.red,
        height: size.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
    
            key: productForm.formKey,
    
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecorarions.authInputDecoration(
                    hintText: "", 
                    labelText: "id",
                    prefixIcon: Icons.drag_indicator_outlined
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecorarions.authInputDecoration(
                    hintText: "Pruducto", 
                    labelText: "Nombre producto",
                    prefixIcon: Icons.production_quantity_limits_outlined
                    ),
                  onChanged: (value)=> productForm.product = value,
    
                  validator: (value){
    
                    String pattern = r"[A-Za-z]";
                    RegExp regExp  = new RegExp(pattern);
    
                    return regExp.hasMatch(value ?? "")
                    ? null
                    : "El producto sólo puede contener letras";
    
                  },
                ),
                
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecorarions.authInputDecoration(
                    hintText: "Codigo", 
                    labelText: "Código producto",
                    prefixIcon: Icons.qr_code_scanner_sharp
                    ),
                ),
    
                //Dropdown estado
                // DropdownButton(
                //   value: initialValue,
                //   items: items.map((String item){
                //       return DropdownMenuItem(
                //         value: item,
                //         child: Text(item),
                //       );
                //   }).toList(), 
                //   onChanged: null),

                // text area descripción
    
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecorarions.authInputDecoration(
                    hintText: "Descripción", 
                    labelText: "descripción producto",
                    prefixIcon: Icons.description
                    ),
                  minLines: 2,
                  maxLines: 2,
                  
                ),
    
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecorarions.authInputDecoration(
                    hintText: "Precio", 
                    labelText: "precio producto",
                    prefixIcon: Icons.price_check_rounded
                    ),
                ),
    
                //Dropdown Categoria
    
                SizedBox(height: 40,),
    
                MaterialButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: AppConst.primaryColor,
                    child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                  child:  Text("Crear",
                    style: const TextStyle(
                      color: Colors.white),
                      ),
                    ),
                  onPressed: (){
                    FocusScope.of(context).unfocus();
                    if(!productForm.isValidForm()) return;
                  }),
                // MaterialButton(
                //   shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10)),
                //   disabledColor: Colors.grey,
                //   elevation: 0,
                //   color: AppConst.primaryColor,
                //     child: Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                //   child:  Text("Prueba",
                //     style: const TextStyle(
                //       color: Colors.white),
                //       ),
                //     ),
                //   onPressed: (){
                //     print(('assets/categories.json'));
                //   }),
              ],
            )
          ),
        ),
      ),
    );
  }
}