import 'package:flutter/material.dart';
import 'package:json_project/student_model.dart';
import 'package:json_project/student_services.dart';

class StudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<Student>(
          future:
              Future.delayed(const Duration(seconds: 10), () => loadStudent()),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text(snapshot.data!.studentName.toString())),
                  Center(child: Text(snapshot.data!.studentId.toString())),
                  Center(child: Text(snapshot.data!.studentScores.toString())),
                ],
              );
            }
          },
        ),
      );
}
