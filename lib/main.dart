import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        colorSchemeSeed: Colors.amber,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.purple,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message,
    BuildContext context,
  ) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory App"),
        toolbarHeight: 70,
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            onPressed: () {
              showSnackBar("MEESSAGE: You are fucked!!", context);
            },
            icon: Icon(Icons.notification_important),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {showSnackBar("Add Something", context)},
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add_alarm),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: 'Blogs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined),
              label: 'Report',
            ),
          ],
          onTap: (value) => {
            if (value == 0) {showSnackBar("We are home!", context)},
            if (value == 1) {showSnackBar("We are at blogs!", context)},
            if (value == 2) {showSnackBar("We are at reports!", context)},
          },
          backgroundColor: Colors.blueGrey,
          selectedItemColor: Colors.lightBlueAccent,
        ),
      ),
      drawer: Drawer(
        width: 350,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                accountName: Text("EddyBoy"),
                accountEmail: Text("eddy@infosys.com"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_filled),
              title: Text("Home"),
              onTap: () => showSnackBar("HOME", context),
            ),
            ListTile(leading: Icon(Icons.list), title: Text("Blogs")),
            ListTile(leading: Icon(Icons.analytics), title: Text("Reports")),
            ListTile(
              leading: Icon(Icons.accessibility_new_rounded),
              title: Text("Techs"),
            ),
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(child: Text("ROW ONE")),
          ),

          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(child: Text("ROW TWO")),
          ),

          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(child: Text("ROW THREE")),
          ),
        ],
      ),
    );
  }
}
