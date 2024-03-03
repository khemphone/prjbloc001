import 'package:flutter/material.dart';

import 'package:prjbloc001/items/items_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ItemsView()),
              );
            },
            child: const Text(
              "View product",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ));
  }
}
