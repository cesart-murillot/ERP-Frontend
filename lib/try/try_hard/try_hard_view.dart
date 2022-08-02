import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'try_hard_bloc.dart';
import 'try_hard_event.dart';

class TryHardPage extends StatelessWidget {
  const TryHardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TryHardBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => const Material(
          child: MenuBar(),
        ),
      ),
    );
  }
}

class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  bool menuBarVisibility = false;
  bool menuVisibility = true;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    const double maxWidth = 1024;
    const double reorderWidth = 640;
    const double menuBarWidth = 72.0;

    return MediaQuery(
      data: data,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (menuVisibility && data.size.width > reorderWidth)
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Flexible(
                        child: CustomScrollView(
                          primary: false,
                          slivers: [
                            SliverAppBar(
                              pinned: true,
                              backgroundColor: Colors.blue,
                              actions: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      menuVisibility = false;
                                      menuBarVisibility = true;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                  ),
                                ),
                              ],
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  return ListTile(
                                    leading: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.height),
                                    ),
                                    title: Text('Menu Numero $index'),
                                  );
                                },
                                childCount: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Cerrar Sesión'),
                        ),
                      )
                    ],
                  ),
                )
              else if (menuBarVisibility && data.size.width > reorderWidth)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: menuBarWidth,
                  ),
                  child: CustomScrollView(
                    primary: false,
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        title: IconButton(
                          onPressed: () {
                            setState(() {
                              menuVisibility = true;
                              menuBarVisibility = false;
                            });
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.point_of_sale),
                            );
                          },
                          childCount: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              Flexible(
                flex: 6,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.red,
                      leading: data.size.width <= reorderWidth
                          ? IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.black,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Huh extends StatelessWidget {
  const Huh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    var form = const MyCustomForm();
    return MediaQuery(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          backgroundColor: data.size.width > 500 ? Colors.red : Colors.green,
        ),
        body: form,
      ),
      data: data,
    );
  }
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
                return SizedBox(
                  width: 160.0,
                  child: Row(
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
                  ),
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
