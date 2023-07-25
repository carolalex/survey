import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _MyAppState();
}

class _MyAppState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  bool? _checkbox = false;
  bool _obscureText = true;
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  _MyAppState createState() => _MyAppState();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 370,
                      height: 250,
                    ),
                    Positioned(
                      top: 20,
                      right: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, elevation: 0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Skip>',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      left: 130,
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: TextFormField(
                    focusNode: _emailFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) {
                      _emailFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                    decoration: const InputDecoration(
                      labelText: 'Enter your Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                  child: TextFormField(
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) {
                      _passwordFocusNode.unfocus();
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password";
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        checkColor: Colors.white,
                        activeColor: Colors.purple,
                        value: _checkbox,
                        onChanged: (val) {
                          setState(() {
                            _checkbox = val;
                          });
                        },
                      ),
                      const Text("Remember me"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('procssing data'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        fixedSize: const Size(330, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: const Text("Join now"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const Text('(or)'),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('images/twitter.jpg'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('images/google.jpg'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('images/link.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
