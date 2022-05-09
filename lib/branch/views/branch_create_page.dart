import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:flutter/material.dart';

class BranchFormItemWidget extends StatefulWidget {
  BranchFormItemWidget({
    Key? key,
    this.branch,
    this.index,
    this.onRemove,
  }) : super(key: key);

  final int? index;
  Branch? branch;

  final Function? onRemove;

  @override
  State<BranchFormItemWidget> createState() => _BranchFormItemWidgetState();

  final TextEditingController _nameBranchController = TextEditingController();
  final TextEditingController _addressBranchController =
      TextEditingController();
}

class _BranchFormItemWidgetState extends State<BranchFormItemWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              bottom: 12.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2.0,
                  blurRadius: 10.0,
                  offset: const Offset(0, 3.0),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sucursal - ${widget.index}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.orange,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        widget.onRemove!();
                      },
                      child: const Text(
                        'Clear',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Remove',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  //User((b) => b..email = 'cesar@gmail.com'..password = '123')
                  controller: widget._nameBranchController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      border: OutlineInputBorder(),
                      hintText: 'Ingrese el nombre de la surusal',
                      labelText: 'Nombre'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: widget._addressBranchController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      border: OutlineInputBorder(),
                      hintText: 'Ingrese el nombre de la surusal',
                      labelText: 'Nombre'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BranchForm extends StatefulWidget {
  BranchForm(
      {Key? key,
      required this.removeBranch,
      required this.index,
      required this.callback})
      : super(key: key);

  final Function removeBranch;
  final void Function(int) callback;
  final int index;

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
            Row(
              //crossAxisAlignment: CrossAxisAlignment.end,
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      print(widget._nameBranchController.text +
                          ' ' +
                          widget._addressBranchController.text);
                      print(widget.index);
                    },
                    icon: const Icon(Icons.check),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      //widget.removeBranch();
                      widget.callback(widget.index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ],
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
                      onPressed: () {},
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
      /*Branch? _branch;
      branchList.add(BranchFormItemWidget(
        index: branchList.length,
        branch: _branch,
        onRemove: () => onRemove(branchList.length - 1),
      ));*/
      _warehouseList.add(WarehouseForm(
        removeWarehouse: () => _removeWarehouse(_warehouseList.length - 1),
        index: _warehouseList.length,
      ));
    });
  }

  _removeWarehouse(int index) {
    setState(() {
      _warehouseList.removeAt(index);
    });
  }
}

class WarehouseForm extends StatefulWidget {
  const WarehouseForm(
      {Key? key, required this.removeWarehouse, required this.index})
      : super(key: key);
  final Function removeWarehouse;
  final int index;

  @override
  State<WarehouseForm> createState() => _WarehouseFormState();
}

class _WarehouseFormState extends State<WarehouseForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        decoration: InputDecoration(
          icon: const Icon(Icons.warehouse),
          suffixIcon: IconButton(
            onPressed: () {
              widget.removeWarehouse();
            },
            icon: const Icon(Icons.close),
          ),
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
  final List<BranchFormItemWidget> branchList = List.empty(growable: true);
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
            child: Row(
              children: [
                Expanded(child: _branchFormList[index]),
                IconButton(
                  onPressed: () {
                    print(index);
                    setState(() {
                      _branchFormList.removeAt(index);
                    });
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ); //return _branchFormList[index];
        },
      ),
    );
  }

  onRemove(int index) {
    setState(() {
      branchList.removeAt(index);
    });
  }

  _removeBranch(int index) {
    setState(() {
      //_branchFormList.rem
      _branchFormList.removeAt(index);
      //_branchFormList.remove(value);
    });
  }

  onAdd() {
    setState(() {
      /*Branch? _branch;
      branchList.add(BranchFormItemWidget(
        index: branchList.length,
        branch: _branch,
        onRemove: () => onRemove(branchList.length - 1),
      ));*/
      _branchFormList.add(BranchForm(
        callback: _removeBranch,
        index: _branchFormList.length,
        removeBranch: () => _removeBranch(_branchFormList.length - 1),
        //removeBranch: () => _removeBranch(),
      ));
    });
  }

  onSave() {
    for (int i = 0; i < _branchFormList.length; i++) {
      print(_branchFormList[i]._addressBranchController.text);
    }
  }
}
