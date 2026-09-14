import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/pages/blogs_page.dart';
import 'package:flutter_application_1/pages/reports_page.dart';
import 'package:flutter_application_1/pages/todo_page.dart';
import 'package:flutter_application_1/widgets/app_drawer.dart';
import 'package:flutter_application_1/widgets/simple_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;

  List<Todo> todos = List.generate(
    10,
    (i) => Todo(
      "Todo $i",
      "Description of todo $i"
    )
  );

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> alertShowing(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(5),
          ),
          title: Text("Are you sure?", textAlign: TextAlign.center),
          content: Text(
            "You wanna start right now?",
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                showSnackBar("Go Then!");
                Navigator.of(context).pop();
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody() {
    switch(_currentIndex) {
      case 0:
        return _buildHome();
      case 1:
        return const Blogs();
      case 2:
        return TodoPage(todos: todos);
      case 3:
        return const ReportsPage();
      default:
        return _buildHome();
    }
  }

  Widget _buildHome() {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurpleAccent,
      foregroundColor: Colors.white,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );

    return SingleChildScrollView(
      child:  Column(
        children: [
          const Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text("Everything in one hand", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Row(
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
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {},
                  style: buttonStyle,
                  child: Text("Get It", style: TextStyle(fontSize: 16)),
                ),
                TextButton(
                  onPressed: () => {alertShowing(context)},
                  child: const Text("Start Now"),
                ),
              ],
            ),
          ),
          const SimpleForm(),
        ],
      ),
    );
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
              showSnackBar("Message: You are fucked!!");
            },
            icon: Icon(Icons.notification_important),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {showSnackBar("Add Something")},
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add_alarm),
      ),
      drawer: const AppDrawer(),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },

        // type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Blogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Report',
          ),
        ],

        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.white70,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        elevation: 8,
      ),
    );
  }
}