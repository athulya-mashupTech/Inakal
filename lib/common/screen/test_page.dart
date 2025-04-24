import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController(text: "Aravind");
  final TextEditingController lastNameController = TextEditingController(text: "Babu");
  final TextEditingController emailController = TextEditingController(text: "arvind@gmail.com");
  final TextEditingController phoneController = TextEditingController(text: "9496370108");
  final TextEditingController dobController = TextEditingController(text: "16-09-1988");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // You can increase this as per your tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile Details'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "Profile Details"),
              Tab(text: "Credentials"),
              Tab(text: "Personal Details"),
              Tab(text: "Edu Proff Details"),
              Tab(text: "Family Details"),
              // Add more tabs as needed
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _labelValue("AGE: 36 YEARS", Colors.blue[100]!),
                  _labelValue("CREATED ON 29-MAR-2025 00:00:00", Colors.green[100]!),
                  SizedBox(height: 16),
                  _buildTextField("First Name", firstNameController),
                  _buildTextField("Last Name", lastNameController),
                  _buildTextField("E-Mail", emailController),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text("🇮🇳 +91"),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(child: _buildTextField("Phone Number", phoneController)),
                    ],
                  ),
                  _buildTextField("Date of Birth", dobController),
                  _buildDropdown("Gender", ["Male", "Female"], "Male"),
                ],
              ),
            ),
            Center(child: Text("Credentials")),
            Center(child: Text("Personal Details")),
            Center(child: Text("Edu Proff Details")),
            Center(child: Text("Family Details")),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options, String selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: selected,
        items: options.map((String value) {
          return DropdownMenuItem(value: value, child: Text(value));
        }).toList(),
        onChanged: (val) {},
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _labelValue(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text),
    );
  }
}
