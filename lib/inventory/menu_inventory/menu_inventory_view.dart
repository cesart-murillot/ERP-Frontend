import 'package:erp_fronted/inventory/index_entry_order/index_entry_order_view.dart';
import 'package:erp_fronted/inventory/product_inventory/product_inventory_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'menu_inventory_bloc.dart';
import 'menu_inventory_event.dart';

class MenuInventoryPage extends StatelessWidget {
  const MenuInventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MenuInventoryBloc()..add(InitEvent()),
      child: Builder(builder: (context) => const MenuInventory()),
    );
  }
}

class MenuInventory extends StatelessWidget {
  const MenuInventory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                  MaterialPageRoute(
                    builder: (_) => const IndexEntryOrderPage(),
                  ),
                );
          },
          child: const CardMenu(title: 'Entradas'),
        ),
        GestureDetector(
          onTap: () {

          },
          child: const CardMenu(title: 'Salidas'),
        ),
        GestureDetector(
          onTap: () {

          },
          child: const CardMenu(title: 'Traspasos'),
        ),
        GestureDetector(
          onTap: () {

          },
          child: const CardMenu(title: 'Mermas'),
        ),
        GestureDetector(
          onTap: () {

          },
          child: const CardMenu(title: 'Saldos'),
        ),
      ],
    );
  }
}

class CardMenu extends StatelessWidget {
  const CardMenu({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(),
      margin: const EdgeInsets.all(8.0),
      child: Container(
        height: 64.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
