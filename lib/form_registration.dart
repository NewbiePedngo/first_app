import 'package:flutter/material.dart';

class FormRegistration extends StatefulWidget {
  const FormRegistration({super.key});

  @override
  State<FormRegistration> createState() => _FormRegistrationState();
}

class _FormRegistrationState extends State<FormRegistration> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? selectedGender;
  String? selectedProvince;
  bool isAccept = false;

  final List<String> provinces = [
    'Bangkok',
    'Chiang Mai',
    'Phuket',
    'Khon Kaen',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),

              // Email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),
              const Text('Gender'),

              // Gender radio
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                  ),
                ],
              ),

              // Province dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Province'),
                value: selectedProvince,
                items: provinces
                    .map((p) => DropdownMenuItem(
                          value: p,
                          child: Text(p),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProvince = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a province' : null,
              ),

              // Checkbox
              CheckboxListTile(
                title: const Text('Accept Terms & Conditions'),
                value: isAccept,
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  setState(() {
                    isAccept = value ?? false;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Submit button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        selectedGender != null &&
                        isAccept) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Submitted: ${fullNameController.text}, ${emailController.text}, $selectedGender, $selectedProvince',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
