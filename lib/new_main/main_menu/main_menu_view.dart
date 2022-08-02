import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_menu_bloc.dart';
import 'main_menu_event.dart';
import 'main_menu_state.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainMenuBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => const Material(
          child: StateViews(),
        ),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainMenuBloc, MainMenuState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: Text(
                'Initial State',
              ),
            );
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case States.loaded:
            return const MainMenu();
          case States.error:
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
        }
      },
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  bool menuBarVisibility = false;
  bool menuVisibility = true;
  static const double maxWidth = 1024;
  static const double reorderWidth = 640;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    return MediaQuery(
      data: data,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Row(
            children: [
              if (menuVisibility && data.size.width > reorderWidth)
                const Flexible(
                  flex: 1,
                  child: Menu(),
                ),
              const Flexible(
                flex: 3,
                child: Text('Hello2'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modules = context.read<MainMenuBloc>().state.user?.role?.modules;
    final userInfo = context.read<MainMenuBloc>().state.user?.employee;
    if (modules != null && userInfo != null) {
      return Column(
        children: [
          Flexible(
            child: CustomScrollView(
              primary: false,
              slivers: [
                SliverPadding(
                  sliver: SliverAppBar(
                    title: const Placeholder(
                      color: Colors.green,
                    ),
                    floating: true,
                    stretch: true,
                    pinned: true,
                    leading: const CircleAvatar(
                      child: Placeholder(),
                    ),
                    collapsedHeight: 64.0,
                    expandedHeight: 256.0,
                    flexibleSpace: const Placeholder(
                      color: Colors.yellow,
                    ),
                    onStretchTrigger: () => Future<void>(() => print('hello')),
                    actions: const [
                      Flexible(child: Placeholder()),
                    ],
                    bottom: const PreferredSize(child: Placeholder(color: Colors.pinkAccent, fallbackHeight: 64.0), preferredSize: Size.fromHeight(64.0)),
                  ),
                  padding: const EdgeInsets.all(8.0),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final module = modules[index];
                    return ListTile(
                      title: Text(module.nameModule),
                    );
                  }, childCount: modules.length),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('Cerrar Sesión'),
            ),
          )
        ],
      );
    }
    return const SizedBox();
  }
}
