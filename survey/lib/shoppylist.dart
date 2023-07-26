import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShoppyList extends StatefulWidget {
  const ShoppyList({super.key});

  @override
  State<ShoppyList> createState() => _ShoppyListState();
}

class _ShoppyListState extends State<ShoppyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.purple,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(FontAwesomeIcons.arrowLeftLong),
          ),
          centerTitle: true,
          title: const Text('Shoppylist'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.list))
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black54,
                  elevation: 0),
              child: const Text("Take a Short Quiz on the issue"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30.0),
            child: Image.asset(
              'images/Group 64.png',
              width: 300,
              height: 300,
            ),
          ),
          const Text(
            "We'll be able to match you to",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              "the brands that align with your values",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.purple,
                    minimumSize: const Size(300, 50)),
                child: const Text("Get Started")),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.diamond_outlined, color: Colors.white),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white), label: ""),
        ],
      ),
    );
  }
}
