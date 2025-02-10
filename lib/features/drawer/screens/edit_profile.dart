import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:inakal/constants/app_constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 30.0, right: 30.0),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Center(
                        child: Column(children: [
              const Text(
                "Edit Profile",
                style: TextStyle(color: AppColors.primaryRed, fontSize: 16),
              ),
              const SizedBox(height: 15),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/vectors/harsha1.jpg"),
                radius: 80,
              ),
              const SizedBox(height: 14),
              const Text("Personal Details", textAlign: TextAlign.start),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Firstname", textAlign: TextAlign.start),
                  Text("Harsha", textAlign: TextAlign.end),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Secondname", textAlign: TextAlign.start),
                  Text("Sreekanth", textAlign: TextAlign.end),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone Number", textAlign: TextAlign.start),
                  Text("9876543210", textAlign: TextAlign.end),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date Of Birth", textAlign: TextAlign.start),
                  Text("21/12/2025", textAlign: TextAlign.end),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gender", textAlign: TextAlign.start),
                  Text("female", textAlign: TextAlign.end),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Height", textAlign: TextAlign.start),
                  Row(
                    children: [
                      const Text("6’65”ft", textAlign: TextAlign.end),
                      Column(
                        children: [
                           IconButton(
                              onPressed: () {},
                              icon: const Iconify(
                                Ic.round_arrow_drop_up,color: AppColors.primaryRed,size: 30,
                              )
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Iconify(
                                Ic.round_arrow_drop_down,color: AppColors.primaryRed,size: 30,
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Divider(),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Weight", textAlign: TextAlign.start),
                  Row(
                    children: [
                      const Text("60Kg", textAlign: TextAlign.end),
                      Column(
                        children: [
                           IconButton(
                              onPressed: () {},
                              icon: const Iconify(
                                Ic.round_arrow_drop_up,color: AppColors.primaryRed,size: 30,
                              )
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Iconify(
                                Ic.round_arrow_drop_down,color: AppColors.primaryRed,size: 30,
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            ]
            )
            ))
            )
            )
            );
  }
}
