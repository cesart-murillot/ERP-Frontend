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
            return const CustomMainPage();
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
  bool _isExpanded = true;
  static const double maxWidth = 1024;
  static const double reorderWidth = 640;

  void _handleTapMenuButton(bool newValue) {
    setState(() {
      _isExpanded = newValue;
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
              if (_isExpanded && data.size.width > reorderWidth)
                Flexible(
                  flex: 1,
                  child: Menu(
                    onChanged: _handleTapMenuButton,
                    isExpanded: true,
                  ),
                )
              else if (!_isExpanded && data.size.width > reorderWidth)
                MenuBar(
                  onChanged: _handleTapMenuButton,
                  isExpanded: false,
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
                          : const SizedBox(),
                    ),
                    SliverToBoxAdapter(
                      child: Content(
                        onChanged: (bool value) {},
                      ),
                    ),
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
  const Menu({
    Key? key,
    this.isExpanded = true,
    required this.onChanged,
  }) : super(key: key);

  final bool isExpanded;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final modules = context.read<MainMenuBloc>().state.user?.role?.modules;
    final userInfo = context.read<MainMenuBloc>().state.user?.employee;
    if (modules != null && userInfo != null) {
      return Material(
        elevation: 16.0,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.cyan.shade50,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(32.0),
              bottomRight: Radius.circular(32.0),
            ),
          ),
          child: Column(
            children: [
              Flexible(
                child: CustomScrollView(
                  primary: false,
                  slivers: [
                    SliverAppBar(
                      actions: [
                        FittedBox(
                          child: IconButton(
                            onPressed: () {
                              _handleTap();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                      pinned: true,
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      toolbarHeight: 32.0,
                    ),
                    const SliverToBoxAdapter(
                      child: DrawerHeader(
                        child: CircleAvatar(
                          child: Placeholder(),
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
                          title: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Text(module.nameModule),
                          ),
                          onTap: () {
                            print('hello');
                          },
                        );
                      }, childCount: modules.length),
                    ),
                  ],
                ),
              ),
              const Divider(),
              FittedBox(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        height: 8.0,
                        width: 8.0,
                      ),
                      Text('Cerrar Sesión'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
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

class MenuBar extends StatelessWidget {
  const MenuBar({
    Key? key,
    this.isExpanded = false,
    required this.onChanged,
  }) : super(key: key);

  final bool isExpanded;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final modules = context.watch<MainMenuBloc>().state.user?.role?.modules;
    if (modules != null) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 64.0),
        child: Column(
          children: [
            Flexible(
              child: CustomScrollView(
                primary: false,
                slivers: [
/*
                  SliverToBoxAdapter(
                    child: IconButton(
                      onPressed: () {
                        _handleTap();
                      },
                      icon: const Icon(Icons.arrow_back_outlined),
                    ),
                  )
*/
                  SliverAppBar(
                    title: FittedBox(
                      child: IconButton(
                        onPressed: () {
                          _handleTap();
                        },
                        icon: const Icon(
                          Icons.expand,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    primary: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    toolbarHeight: 32.0,
/*                    actions: [
                      FittedBox(
                        child: IconButton(
                          onPressed: () {
                            _handleTap();
                          },
                          icon: const Icon(Icons.expand),
                          color: Colors.black,
                        ),
                      ),
                    ]*/
                  ),
                  const SliverToBoxAdapter(
                    child: Divider(),
                  ),
                  const SliverToBoxAdapter(
                    child: CircleAvatar(
                      child: FlutterLogo(),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final module = modules[index];
                        return IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconData(
                              int.parse(module.iconModule ?? '0xf0555'),
                              fontFamily: 'MaterialIcons',
                            ),
                          ),
                        );
                      },
                      childCount: modules.length,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    return Container();
  }
}

class CustomMainPage extends StatelessWidget {
  const CustomMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Row(
            children: [
              const Flexible(
                flex: 1,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leading: FittedBox(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu_open,
                            )),
                      ),
                      backgroundColor: Colors.deepPurpleAccent,
                      actions: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.message,
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.person,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Flexible(
                flex: 1,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
