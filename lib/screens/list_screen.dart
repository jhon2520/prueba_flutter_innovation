import 'package:flutter/material.dart';
import 'package:innovation_test/models/product_model.dart';
import 'package:innovation_test/providers/product_form_provider.dart';
import 'package:innovation_test/providers/product_provider.dart';
import 'package:innovation_test/ui/ui.dart';
import 'package:innovation_test/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductFormProvider(),
        )
      ],
      child: const FormProducts(),
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
        title: const Text("Datos del Producto"),
      ),
      body: const _FormContainer(),
    );
  }
}

class _FormContainer extends StatefulWidget {
  const _FormContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<_FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<_FormContainer> {
  String? dropDownStatusValue = "Activo";
  String? dropDownCategorieValue = "Tipo A";
  List<String> categories = [];


  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    Product productToEdit = productProvider.activeProduct!;

    categories = productProvider.globalCategories;

    final estadoItems = [
      "Activo",
      "Inactivo",
    ];

    void dropdownStatusCallback(String? selectedValue) {
      setState(() {
        dropDownStatusValue = selectedValue;
      });
    }

    void dropdownCategoriesCallback(String? selectedValue) {
      setState(() {
        dropDownCategorieValue = selectedValue;
      });
    }

    int getLastId() {
      List<int> listId = [];

      for (var element in productProvider.globalProducts) {
        listId.add(element.productId);
      }
      listId.sort();

      int newId = listId[listId.length - 1] + 1;
      productForm.productToCreate.id = newId.toString();

      if (productProvider.activeProduct!.producto != "") {
        return productProvider.activeProduct!.productId;

      }

      return newId;
    }

    final int newId = getLastId();

    return SingleChildScrollView(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
              key: productForm.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    enabled: false,
                    initialValue: "$newId",
                    decoration: InputDecorarions.authInputDecoration(
                      hintText: "",
                      labelText: "id",
                      prefixIcon: Icons.drag_indicator_outlined,
                    ),
                  ),
                  TextFormField(
                    autocorrect: false,
                    initialValue: "${productProvider.activeProduct?.producto}",
                    keyboardType: TextInputType.text,
                    decoration: InputDecorarions.authInputDecoration(
                        hintText: "Pruducto",
                        labelText: "Nombre producto",
                        prefixIcon: Icons.production_quantity_limits_outlined),
                    onChanged: (value) {
                      productForm.productField = value;
                      productForm.productToCreate.producto = value;
                      productToEdit.producto = value;
                    },
                    validator: (value) {
                      String pattern = r"[A-Za-z]";
                      RegExp regExp = RegExp(pattern);

                      if (value == "") {
                        return "El nombre del producto no puede estar vacío";
                      }

                      return regExp.hasMatch(value ?? "")
                          ? null
                          : "El producto sólo puede contener letras";
                    },
                  ),
                  TextFormField(
                    autocorrect: false,
                    initialValue: productProvider.activeProduct?.codigo,
                    keyboardType: TextInputType.text,
                    decoration: InputDecorarions.authInputDecoration(
                        hintText: "Codigo",
                        labelText: "Código producto",
                        prefixIcon: Icons.qr_code_scanner_sharp),
                    onChanged: (value) {
                      productForm.productToCreate.codigo = value;
                      productToEdit.codigo = value;
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecorarions.authInputDecoration(
                        hintText: "Estado",
                        labelText: "estado producto",
                        prefixIcon: Icons.settings_applications_rounded),
                    value: dropDownStatusValue,
                    items: estadoItems.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      dropdownStatusCallback(value as String?);
                      productForm.productToCreate.estado =
                          dropDownStatusValue == "Activo" ? true : false;
                      productToEdit.estado =
                          dropDownStatusValue == "Activo" ? true : false;
                    },
                    isExpanded: true,
                    iconEnabledColor: AppConst.primaryColor,
                  ),
                  TextFormField(
                    autocorrect: false,
                    initialValue: productProvider.activeProduct?.descripcion,
                    keyboardType: TextInputType.text,
                    decoration: InputDecorarions.authInputDecoration(
                        hintText: "Descripción",
                        labelText: "descripción producto",
                        prefixIcon: Icons.description),
                    minLines: 2,
                    maxLines: 2,
                    onChanged: (value) {
                      productForm.productToCreate.descripcion = value;
                      productToEdit.descripcion = value;
                    },
                  ),
                  TextFormField(
                    autocorrect: false,
                    initialValue: "${productProvider.activeProduct?.precio}",
                    keyboardType: TextInputType.number,
                    decoration: InputDecorarions.authInputDecoration(
                        hintText: "Precio",
                        labelText: "precio producto",
                        prefixIcon: Icons.price_check_rounded),
                    onChanged: (value) {
                      if (value != "") {
                        productForm.productToCreate.precio = int.parse(value);
                        productToEdit.precio = int.parse(value);
                      }
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecorarions.authInputDecoration(
                        hintText: "Categoria",
                        labelText: "categoria producto",
                        prefixIcon: Icons.catching_pokemon_rounded),
                    value: dropDownCategorieValue,
                    items: categories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    isExpanded: true,
                    iconEnabledColor: AppConst.primaryColor,
                    onChanged: (value) {
                      dropdownCategoriesCallback(value as String?);
                      productForm.productToCreate.idCategoria =
                          dropDownCategorieValue!;
                      productToEdit.idCategoria = dropDownCategorieValue!;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey,
                      elevation: 0,
                      color: AppConst.primaryColor,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Text(
                          productProvider.updateFlag 
                              ? "Actualizar"
                              : "Crear",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (!productForm.isValidForm()) return;

                        productProvider.updateFlag  
                            ? productProvider.updateProduct(newId, productToEdit)
                            : productProvider.createProduct(productForm.productToCreate);
                        Navigator.pop(context);
                      }),
                ],
              )),
        ),
        const Positioned(
            top: -280,
            right: -350,
            child: BubbleDecoration(
              radius: 450,
              opacity: 0.05,
            )),
        const Positioned(
            top: 10,
            left: 180,
            child: BubbleDecoration(
              radius: 30,
              opacity: 0.1,
            )),
        const Positioned(
            bottom: 0,
            left: -20,
            child: BubbleDecoration(
              radius: 60,
              opacity: 0.1,
            )),
      ]),
    );
  }
}
