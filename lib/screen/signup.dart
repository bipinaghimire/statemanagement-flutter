import 'package:batchstudent/state/batch_state.dart';
import 'package:batchstudent/state/student_state.dart';
import 'package:flutter/material.dart';

import '../model/student.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // List<Student> lstStudent = [];

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  String? gender;
  String? batch;
  final passwordController = TextEditingController();
  final fkey = GlobalKey<FormState>();

  var batchlist = BatchState.batches;
  var lstStudent = StudentState.students;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Form(
        key: fkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: 'last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Age';
                  }
                  return null;
                },
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Select gender'),
              ),
              // Create radio button for gender
              RadioListTile(
                title: const Text('Male'),
                value: 'Male',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Female'),
                value: 'Female',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Others'),
                value: 'Others',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              DropdownButtonFormField(
                validator: (value) {
                  if (value == null) {
                    return 'Please select a batch';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Batch',
                  border: OutlineInputBorder(),
                ),
                items: batchlist
                    .map(
                      (batch) => DropdownMenuItem(
                        value: batch,
                        child: Text(batch),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    batch = value;
                  });
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (fkey.currentState!.validate()) {
                      //Create a student object and add it to List of students
                      var student = Student(
                        fname: firstNameController.text.trim(),
                        lname: lastNameController.text.trim(),
                        gender: gender!,
                        age: int.parse(ageController.text.trim()),
                        batch: batch,
                        password: passwordController.text.trim(),
                      );
                      lstStudent.add(student);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Student added successfully'),
                        ),
                      );
                    }
                  },
                  child: const Text('Add Student'),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/login',
                      // arguments: lstStudent,
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
