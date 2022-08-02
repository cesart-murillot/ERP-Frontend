import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'try_bloc.dart';
import 'try_event.dart';

class TryPage extends StatelessWidget {
  const TryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TryBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => Scaffold(
          drawer: const Drawer(
            child: Example(),
          ),
          appBar: AppBar(),
          body: const MyCustomForm(),
        ),
      ),
    );
  }
}

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: [
        SliverAppBar(
          shadowColor: Colors.yellow,
          elevation: 8.0,
          snap: true,
          centerTitle: true,
          toolbarHeight: 64.0,
          stretchTriggerOffset: 16.0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(16.0),
            child: Placeholder(
              fallbackHeight: 64.0,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              print('bye');
            },
            icon: const Icon(Icons.arrow_back),
          ),
          pinned: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
          expandedHeight: 256.0,
          floating: true,
          title: const Text('hello'),
          flexibleSpace: const FlutterLogo(size: 256.0),
          onStretchTrigger: () {
            return hello();
          },
          leadingWidth: 64.0,
          collapsedHeight: 128.0,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => const ListTile(
                    title: Text('hello'),
                    subtitle: Text('Subttitle'),
                  ),
              childCount: 24),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                title: Text('SHHH $index'),
              );
            },
            childCount: 16,
          ),
        ),
      ],
    );
  }
}

Future<void> hello() async {
  print('kha?');
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> list = [];

  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var size = MediaQuery(data: data, child: Text('$data.size'));
    return Form(
      key: _formKey,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: list[index],
                        onSaved: (value) {
                          print([value, index]);
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //list.removeAt(index);
                        setState(() {
                          list.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ],
                );
              },
              childCount: list.length,
            ),
          ),
          SliverToBoxAdapter(
            child: TextButton(
              onPressed: () {
                _formKey.currentState?.save();
              },
              child: const Text('Save'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              TextButton(
                onPressed: () {
                  setState(() {
                    list.add(TextEditingController());
                  });
                },
                child: const Text('Add Element'),
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                size,
                Text('$width'),
                Text('$height'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
