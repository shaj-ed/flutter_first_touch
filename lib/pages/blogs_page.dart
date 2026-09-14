import 'package:flutter/material.dart';

class Blogs extends StatelessWidget {
  const Blogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blogs"),
        toolbarHeight: 70,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            Text("Blog one"),
            Text("Blog two")
          ],
        ),
      ),
    );
  }
}