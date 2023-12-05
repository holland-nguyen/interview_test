import 'package:flutter/material.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  List<String> listPath = [
    "assets/images/img_1.jpg",
    "assets/images/img_2.jpeg",
    "assets/images/img_3.jpg",
  ];

  late int indexPath = 0;

  void onNext() {
    indexPath++;
    if (indexPath >= listPath.length) {
      indexPath = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Images"),
      ),
      body: GestureDetector(
        onTap: onNext,
        child: Center(
          child: Image.asset(
            listPath[indexPath],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
