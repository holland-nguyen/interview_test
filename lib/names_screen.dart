import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class NamesScreen extends StatefulWidget {
  const NamesScreen({super.key});

  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  int length = 20;
  late List<String> listName;
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() {
    listName = List.filled(length, "");
    for (int i = 0; i < length; i++) {
      var faker = Faker();
      listName[i] = faker.person.name();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Names"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final name = listName[index];
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(name)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Ink(
                height: 44,
                child: Text(name),
              ),
            ),
          );
        },
        itemCount: length,
      ),
    );
  }
}
