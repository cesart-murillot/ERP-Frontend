import 'package:erp_fronted/entry_order/index_entry_order/index_entry_order_view.dart';
import 'package:erp_fronted/product_request/list_product_request/list_product_request_view.dart';
import 'package:erp_fronted/warehouse/warehouse_list/warehouse_list_view.dart';
import 'package:erp_fronted/warehouse/warehouse_menu/warehouse_menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'warehouse_menu_bloc.dart';
import 'warehouse_menu_event.dart';

class WarehouseMenuPage extends StatelessWidget {
  const WarehouseMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WarehouseMenuBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => const StateViews(),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarehouseMenuBloc, WarehouseMenuState>(
      builder: (context, state) {
        return ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WarehouseListPage(),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 40.0,
                      child: Row(
                        children: [
                          Text(
                            'Lista de Almacenes',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const IndexEntryOrderPage(),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 40.0,
                      child: Row(
                        children: [
                          Text(
                            'Ingresos',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 40.0,
                      child: Row(
                        children: [
                          Text(
                            'Despachos',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ListProductRequestPage(),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 40.0,
                      child: Row(
                        children: [
                          Text(
                            'Pedidos',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 40.0,
                      child: Row(
                        children: [
                          Text(
                            'Mermas',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
