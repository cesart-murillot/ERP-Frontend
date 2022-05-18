import 'package:erp_fronted/inventory/views/entry/entry_page.dart';
import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            const Flexible(
              flex: 0,
              child: TabBar(
                indicatorPadding: EdgeInsets.all(8.0),
                isScrollable: true,
                tabs: [
                  Tab(
                    icon: Icon(Icons.input),
                    //child: Text('hola'),
                    text: 'Entradas',
                  ),
                  Tab(
                    icon: Icon(Icons.output),
                    child: Text('Salidas'),
                  ),
                  Tab(
                    icon: Icon(Icons.send_and_archive),
                    child: Text('Traspasos'),
                  ),
                  Tab(
                    icon: Icon(Icons.restore_from_trash),
                    child: Text('Mermas'),
                  ),
                  Tab(
                    icon: Icon(Icons.widgets),
                    child: Text('Saldos'),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  const EntryPage(),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.black,
                  ),
                  Container(
                    color: Colors.pink,
                  ),
                  Container(
                    color: Colors.pink,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
