
import 'dart:convert';

class Product {

    Product({
        required this.id,
        required this.productId,
        required this.producto,
        this.codigo,
        required this.estado,
        this.descripcion,
        required this.precio,
        required this.idCategoria,
    
    });

    String id;
    int productId;
    String producto;
    String? codigo;
    bool estado;
    String? descripcion;
    int precio;
    String idCategoria;

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["_id"],
        productId: json["id"],
        producto: json["producto"],
        codigo: json["codigo"],
        estado: json["estado"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        idCategoria:  json["idCategoria"].toString(),

    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "id": productId,
        "producto": producto,
        "codigo": codigo,
        "estado": estado,
        "descripcion":descripcion,
        "precio": precio,
        "idCategoria": idCategoria,
    };

}


