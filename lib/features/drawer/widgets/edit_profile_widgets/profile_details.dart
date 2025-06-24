import 'package:flutter/material.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  String? selectedGender;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(
              side: BorderSide.none, 
            ),
            collapsedShape: RoundedRectangleBorder(
              side: BorderSide.none,
            ),
      title: const Text('Edit Profile'),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextFormField(
                  label: 'First Name', controller: firstNameController),
              const SizedBox(height: 16),
              _buildTextFormField(
                  label: 'Last Name', controller: lastNameController),
              const SizedBox(height: 16),
              _buildTextFormField(label: 'Email', controller: emailController),
              const SizedBox(height: 16),
              _buildTextFormField(
                  label: 'Phone Number', controller: phoneNumberController),
              const SizedBox(height: 16),
              _buildDatePickerField(
                  label: 'Date of Birth', controller: dateOfBirthController),
              const SizedBox(height: 16),
              _buildDropdownField(
                  label: 'Gender',
                  items: ['Male', 'Female', 'Other'],
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDatePickerField(
      {
        required String label,
        required TextEditingController controller
        }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onTap: () async {
        await _selectDate(context, controller, label);
      },
    );
  }

  Widget _buildTextFormField(
      {
        required String label,
       required TextEditingController controller
       }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
    String label) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      helpText: 'Select $label', // Added label to the date picker
    );
    if (picked != null) {
      controller.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  Widget _buildDropdownField(
      {required String label,
      required List<String> items,
      required ValueChanged<String?> onChanged}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged,
      value: selectedGender,
    );
  }
}
