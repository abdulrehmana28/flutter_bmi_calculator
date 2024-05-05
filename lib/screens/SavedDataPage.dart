import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/database_helper.dart';

import '../constants.dart';

class SavedDataPage extends StatefulWidget {
  @override
  _SavedDataPageState createState() => _SavedDataPageState();
}

class _SavedDataPageState extends State<SavedDataPage> {
  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  _loadUsers() async {
    final dbHelper = DatabaseHelper();
    final users = await dbHelper.getUsers();
    setState(() {
      _users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return Card(
              color: kActiveCardColor,
              child: ListTile(
                title: Text(_users[index]['name']),
                subtitle: Text('Age: ${_users[index]['age']}'),
                trailing: Text(
                  'BMI: ${_users[index]['bmi'].toStringAsFixed(2)}',
                  style: kBmiInterpretationTextStyle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
