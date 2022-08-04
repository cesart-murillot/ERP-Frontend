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
  bool _menuButtonVisible = false;
  static const double maxWidth = 1024;
  static const double reorderWidth = 640;

  void _handleTapMenuButton(bool newValue) {
    setState(() {
      _menuButtonVisible = newValue;
    });
  }

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
              Flexible(
                flex: 3,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      toolbarHeight: 32.0,
                      leading: data.size.width <= reorderWidth
                          ? FittedBox(
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.menu),
                              ),
                            )
                          : FittedBox(
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_back),
                              ),
                            ),
                    )
                  ],
                ),
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
                SliverAppBar(
                  actions: [
                    FittedBox(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.start,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                  pinned: true,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 32.0,
                ),
                SliverToBoxAdapter(
                  child: DrawerHeader(
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Placeholder(),
                          maxRadius: 48.0,
                        ),
                        Text(
                          '${userInfo.namesEmployee} ${userInfo.lastNameEmployee}',
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final module = modules[index];
                    return ListTile(
                      leading: Icon(
                        IconData(
                          int.parse(module.iconModule ?? '0xf0555'),
                          fontFamily: 'MaterialIcons',
                        ),
                      ),
                      title: Text(module.nameModule),
                      onTap: () {},
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

class Content extends StatelessWidget {
  const Content({
    Key? key,
    this.menuButtonVisible = false,
    required this.onChanged,
  }) : super(key: key);
  final bool menuButtonVisible;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!menuButtonVisible);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        menuButtonVisible
            ? const Text('Menu Button')
            : const Text('no menu button'),
        FloatingActionButton(
          onPressed: () => _handleTap(),
          child: const Text('tapme'),
        ),
      ],
    );
  }
}
