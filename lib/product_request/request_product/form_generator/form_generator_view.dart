import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_generator_cubit.dart';
import 'form_generator_state.dart';

class FormGeneratorPage extends StatelessWidget {
  const FormGeneratorPage({Key? key, required this.element}) : super(key: key);
  final StatelessWidget element;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FormGeneratorCubit(),
      child: Builder(builder: (context) => FormGenerator(element: element,)),
    );
  }
}

class FormGenerator extends StatelessWidget {
  const FormGenerator({Key? key, required this.element}) : super(key: key);
  final StatelessWidget element;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormGeneratorCubit, FormGeneratorState>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  TextButton(onPressed: (){
                    context.read<FormGeneratorCubit>().addElement();
                  }, child: const Text('Añadir'),),
                  TextButton(onPressed: (){
                    context.read<FormGeneratorCubit>().removeElement();
                  }, child: const Text('Remover'),),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: state.elements,
              itemBuilder: (context, index) {
                return element;
              },
            ),
          ],
        );
      },
    );
  }
}
