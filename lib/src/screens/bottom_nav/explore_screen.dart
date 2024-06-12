import 'package:bookstore/src/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Column(children: [
        CustomInput(
          hint: "Search",
          controller: searchController,
          inputBorder: const OutlineInputBorder(),
        ),
        Row(
          children: [
            Icon(Icons.filter),
            Text("Filter"),
            Icon(Icons.sort),
            Text("Sort"),
            Icon(Icons.grid_view),
            Text("View"),
          ],
        ),
        Wrap(
            // Books
            )
      ]),
    ));
  }
}
