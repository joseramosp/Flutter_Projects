import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                padding: EdgeInsets.all(20),
                textColor: Colors.white,
                color: Colors.lightBlueAccent,
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
