

import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final List tasks;
  final String title;
  final IconData? icon;


  const CustomListView({
    super.key,
    required this.title,
    required this.tasks,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 15, bottom: 20),
            child: Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400]!, width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: Checkbox(
                  value: tasks[index].isCompleted,
                  activeColor: Color(0xFF458ECC),
                  onChanged: (value) {
                    tasks[index].isCompleted = value!;
                    tasks[index].save();
                  },
                ),
                title: Text(tasks[index].name),
                subtitle: Text(tasks[index].description),
                trailing: IconButton(onPressed:(){
                  tasks[index].delete();
                } , icon: Icon(icon)),
              ),
            );
          },
        ),
      ],
    );
  }
}
