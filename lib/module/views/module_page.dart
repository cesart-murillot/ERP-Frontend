import 'package:erp_fronted/module/cubit/module_cubit.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modulos'),
      ),
      body: BlocProvider(
        create: (context) => ModuleCubit(Repository()),
        child: const Example(),
      ),
    );
  }
}

/*class _ModuleList extends StatefulWidget {
  const _ModuleList({Key? key}) : super(key: key);

  @override
  State<_ModuleList> createState() => _ModuleListState();
}*/

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModuleCubit, ModuleState>(
      builder: (context, state) {
        if (state is ModuleInitial) {
          context.read<ModuleCubit>().getModules();
          return const Text('Loading');
        } else if (state is ModuleLoading) {
          return const FlutterLogo();
        } else if (state is ModuleLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: state.modules!.modules.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(state.modules!.modules[index].nameModule),
                ),
              );
            },
          );
        } else {
          return const Text('error');
        }
      },
    );
  }
}
/*
class _ModuleListState extends State<_ModuleList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModuleBloc, ModuleState>(builder: (context, state) {
      /*switch (state.status) {
        case ModuleStatus.failure:
          return const Center(
            child: Text('Failed to fetch posts'),
          );
        case ModuleStatus.success:
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
            return Text(
              index.toString(),
            );
          });
        default:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }*/
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Text(index.toString());
        },
      );
    });
  }*/
