import 'package:batchstudent/state/student_state.dart';
import 'package:flutter/material.dart';

class ListOfStudentScreen extends StatefulWidget {
  const ListOfStudentScreen({super.key});

  @override
  State<ListOfStudentScreen> createState() => _ListOfStudentScreenState();
}

class _ListOfStudentScreenState extends State<ListOfStudentScreen> {
  var lstStudents = StudentState.students;
  var batches;

  @override
  void didChangeDependencies() {
    batches = ModalRoute.of(context)!.settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Of Students'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < lstStudents.length; i++) ...{
                if (lstStudents[i].batch == batches) ...{
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      " ${lstStudents[i].fname} ${lstStudents[i].lname} \n ${lstStudents[i].gender}, ${lstStudents[i].age}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                }
              }
            ],
          ),
        ));
  }
}
