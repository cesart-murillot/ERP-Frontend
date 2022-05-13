import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: const Color(0xffe5ffff),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nombre del Producto',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 160.0,
            child: Card(
              child: Column(
                children: [
                  const Align(
                      child: Text('Dimensiones'),
                      alignment: Alignment.bottomLeft),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    width: 136.0,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 64.0,
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Altura'),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        SizedBox(
                          width: 64.0,
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Ancho'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
/*      Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 400,
            height: 200,
            color: const Color(0xffd0d8ff),
            child: Column(
              children: [
                Container(

                  width: 20.0,
                  height: 32.0,
                ),
                TextFormField(
                  enabled: false,
                  initialValue: 'Example',
                  decoration: InputDecoration(
                    labelText: 'Producto descripcion'
                  ),
                ),
                Container(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Example text'
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );*/
  }
}
