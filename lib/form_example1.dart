import 'package:flutter/material.dart';

class FormExample1 extends StatefulWidget {
  const FormExample1({super.key});

  @override
  State<FormExample1> createState() => _FormExample1State();
}

class _FormExample1State extends State<FormExample1> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  String? selectedgender;
  bool isAccept = false;
  String? marriedStatus = 'Single';
  bool isSwitched = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FormExample'),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // First Name
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your First Name';
                  }
                  return null;
                },
              ),

              // Last Name
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Last Name';
                  }
                  return null;
                },
              ),

              // Gender Dropdown
               DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Gender'),
                value: selectedgender,
                items: <String>['Male', 'Female', 'Other']
                    .map((String item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedgender = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select your gender' : null,
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // RadioListTile
                  RadioListTile<String>(
                    title: const Text('Single'),
                    value: 'Single',
                    groupValue: marriedStatus,
                    onChanged: (value) {
                      setState(() {
                        marriedStatus = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Married'),
                    value: 'Married',
                    groupValue: marriedStatus,
                    onChanged: (value) {
                      setState(() {
                        marriedStatus = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Separate'),
                    value: 'Separate',
                    groupValue: marriedStatus,
                    onChanged: (value) {
                      setState(() {
                        marriedStatus = value;
                      });
                    },
                  ),

                  // CheckboxListTile แก้ไขวงเล็บ
                  CheckboxListTile(
                    title: const Text("Accept Term & Conditions"),
                    value: isAccept,
                    onChanged: (bool? value){
                      setState(() {
                        isAccept = value!;
                      });
                    },
                  ),
                ],
              ),

              SwitchListTile(
                title: Text("Enable Notifications"),
                value: isSwitched,
                onChanged: (bool value){
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Auto Input
                  ElevatedButton(
                    onPressed: () {
                      firstNameController.text = "Bev";
                      lastNameController.text = "Ops";
                    },
                    child: const Text("Auto input"),
                  ),
                  const SizedBox(width: 10),

                  // Clear
                  ElevatedButton(
                    onPressed: () {
                      firstNameController.clear();
                      lastNameController.clear();
                      setState(() {
                        selectedgender = null;
                      });
                    },
                    child: const Text("Clear"),
                  ),
                  const SizedBox(width: 10),

                  // Submit
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Submitted: ${firstNameController.text} ${lastNameController.text} ($selectedgender)",
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
