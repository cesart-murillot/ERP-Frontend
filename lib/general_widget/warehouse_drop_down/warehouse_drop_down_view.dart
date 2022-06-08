import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'warehouse_drop_down_cubit.dart';
import 'warehouse_drop_down_state.dart';

class WarehouseDropDownPage extends StatelessWidget {
  const WarehouseDropDownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          WarehouseDropDownCubit()..getWarehouse(),
      child: Builder(builder: (context) => const StateViews()),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarehouseDropDownCubit, WarehouseDropDownState>(
      builder: (context, state) {
        switch (state.state) {
          case States.loading:
            return const Center(
              child: Text('Loading'),
            );
          case States.loaded:
            return const WarehouseDropDown();
          case States.initial:
            return const Center(
              child: Text('Initial State'),
            );
        }
      },
    );
  }
}

class WarehouseDropDownList extends StatelessWidget {
  const WarehouseDropDownList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberOfElements =
        context.watch<WarehouseDropDownCubit>().state.numberOfElements;

    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                context.read<WarehouseDropDownCubit>().addElement();
                print(numberOfElements);
              },
              child: const Text('Añadir'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Remover'),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: numberOfElements,
          itemBuilder: (context, index) {
            return const WarehouseDropDown();
          },
        ),
      ],
    );
  }
}

class WarehouseDropDown extends StatelessWidget {
  const WarehouseDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final warehouseList =
        BlocProvider.of<WarehouseDropDownCubit>(context).state.warehouseList;
    var sectionList =
        BlocProvider.of<WarehouseDropDownCubit>(context).state.sectionList;
    var value =
        context.watch<WarehouseDropDownCubit>().state.sectionList?.first.value;
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Flexible(
              flex: 2,
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Almacen',
                ),
                items: warehouseList,
                onChanged: (value) {
                  context
                      .read<WarehouseDropDownCubit>()
                      .getSections(int.parse(value.toString()));
                },
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            sectionList != null
                ? Flexible(
                    flex: 1,
                    child: DropdownButtonFormField(
                      value: value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Sección',
                      ),
                      items: sectionList,
                      onChanged: (value) {},
                    ),
                  )
                : const Flexible(
                    child: SizedBox(),
                    flex: 1,
                  ),
          ],
        ),
        sectionList != null
            ? ElevatedButton(
                onPressed: () {},
                child: const Text('Registrar Ingreso'),
              )
            : const SizedBox(),
      ],
    );
  }
}
