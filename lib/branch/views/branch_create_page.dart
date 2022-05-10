import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:flutter/material.dart';

class BranchForm extends StatefulWidget {
  BranchForm({
    Key? key,
  }) : super(key: key);

  final TextEditingController _nameBranchController = TextEditingController();
  final TextEditingController _addressBranchController =
      TextEditingController();

  @override
  State<BranchForm> createState() => _BranchFormState();
}

class _BranchFormState extends State<BranchForm> {
  final branchFormKey = GlobalKey<FormState>();
  final List<WarehouseForm> _warehouseList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: branchFormKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  print(widget._nameBranchController.text +
                      ' ' +
                      widget._addressBranchController.text);
                  for (int i = 0; i < _warehouseList.length; i++) {
                    print(_warehouseList[i]._identifierWarehouse.text);
                  }
                },
                icon: const Icon(Icons.check),
              ),
            ),
            TextFormField(
              controller: widget._nameBranchController,
              decoration: const InputDecoration(
                icon: Icon(Icons.work),
                labelText: 'Nombre de la sucursal',
              ),
            ),
            TextFormField(
              controller: widget._addressBranchController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.map), labelText: 'Dirección'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      _addWarehouse();
                    },
                    child: Text('Añádir un almacen')),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                /*return Row(
                  children: [
                    _removeWarehouse(_warehouseList.length),
                    IconButton(onPressed: (){
                      branchList.removeAt(index);
                    }, icon: const Icon(Icons.delete),),
                  ],
                );*/
                return Row(
                  children: [
                    Expanded(
                      child: _warehouseList[index],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _warehouseList.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete),
                      iconSize: 16.0,
                    ),
                  ],
                );
              },
              itemCount: _warehouseList.length,
            )
          ],
        ),
      ),
    );
  }

  _addWarehouse() {
    setState(() {
      _warehouseList.add(WarehouseForm());
    });
  }
}

class WarehouseForm extends StatefulWidget {
  WarehouseForm({Key? key}) : super(key: key);

  final TextEditingController _identifierWarehouse = TextEditingController();

  @override
  State<WarehouseForm> createState() => _WarehouseFormState();
}

class _WarehouseFormState extends State<WarehouseForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        controller: widget._identifierWarehouse,
        decoration: const InputDecoration(
          icon: Icon(Icons.warehouse),
/*          suffixIcon: IconButton(
            onPressed: () {
              widget.removeWarehouse();
            },
            icon: const Icon(Icons.close),
          ),*/
          labelText: 'Identificador del almacen',
        ),
      ),
    );
  }
}

class ListBranch extends StatefulWidget {
  const ListBranch({Key? key}) : super(key: key);

  @override
  State<ListBranch> createState() => _ListBranchState();
}

class _ListBranchState extends State<ListBranch> {
  //final List<BranchFormItemWidget> branchList = List.empty(growable: true);
  final List<BranchForm> _branchFormList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create multiple branches'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add),
          onPressed: () {
            onAdd();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onSave();
        },
        child: const Icon(Icons.save),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _branchFormList.length,
        itemBuilder: (_, index) {
          return Card(
            child: Column(
              children: [
                _branchFormList[index],
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _branchFormList.removeAt(index);
                      });
                    },
                    child: const Text(
                      'Remover',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ); //return _branchFormList[index];
        },
      ),
    );
  }

  onAdd() {
    setState(() {
      _branchFormList.add(BranchForm());
    });
  }

  onSave() {
    print('hola');
    var branches = Branches(
      (p0) {
        for (int i = 0; i < _branchFormList.length; i++) {
          var branch = Branch(
            (p0) {
              p0.nameBranch = _branchFormList[i]._nameBranchController.text;
              p0.addressBranch =
                  _branchFormList[i]._addressBranchController.text;
            },
          );
          p0.branches.add(branch);
        }
      },
    );
    /*for (int i = 0; i < branches.branches.length; i++) {
      print(i.toString() + ' ' + branches.branches[i].nameBranch! + ' ' + branches.branches[i].addressBranch!);
    }*/

    String? jsonToString = objectToString<Branches>(branches, Branches.serializer);
    String? jsonString = branchesObjectToString(branches);
    print(jsonToString);

  }
}
