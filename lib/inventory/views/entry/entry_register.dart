import 'package:flutter/material.dart';

class EntryRegister extends StatelessWidget {
  const EntryRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Entrada'),
      ),
      body: const EntryInformation(),
    );
  }
}

class EntryInformation extends StatelessWidget {
  const EntryInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: const [
          EntryFormField(keyMap: 'product', label: 'Producto', numeric: false),
          SizedBox(height: 16.0,),
          EntryFormField(keyMap: 'quantity', label: 'Cantidad', numeric: true),
          SizedBox(height: 16.0,),
          EntryFormField(keyMap: 'supplier', label: 'Proveedor', numeric: false),
          SizedBox(height: 16.0,),
        ],
      ),
    );
  }
}


class EntryFormField extends StatelessWidget {
  const EntryFormField(
      {Key? key, required this.keyMap, required this.label, required this.numeric,})
      : super(key: key);

  final String keyMap;
  final String label;
  final bool numeric;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        icon: const Icon(Icons.access_time),

      ),
    );
  }
}

