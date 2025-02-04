import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/profile/widgets/other_profile_detail_card.dart';
import 'package:inakal/features/requests/widgets/accept_button.dart';
import 'package:inakal/features/requests/widgets/decline_button.dart';
import 'package:inakal/features/requests/widgets/message_button.dart';
import 'package:inakal/model/user.dart';

class OtherProfileScreen extends StatefulWidget {
  const OtherProfileScreen({super.key});

  @override
  State<OtherProfileScreen> createState() => _OtherProfileScreenState();
}

class _OtherProfileScreenState extends State<OtherProfileScreen> {
  User userData = User.getUser();
  final List<String> imagePaths = [
    "assets/vectors/suriya.jpeg",
    "assets/vectors/suriya2.webp",
    "assets/vectors/suriya3.jpg",
  ];
  int currentIndex = 0;

  void _nextImage() {
    setState(() {
      currentIndex = currentIndex + 1;
    });
  }

  void _previousImage() {
    setState(() {
      currentIndex = currentIndex - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(userData.name),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.white,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      gradient: AppColors.lightPinkWhiteGradient,
                    ),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage(imagePaths[currentIndex]),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            imagePaths.length,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4.0),
                              width: currentIndex == index ? 10.0 : 8.0,
                              height: currentIndex == index ? 10.0 : 8.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == index
                                    ? Colors.pink
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      currentIndex != 0
                          ? Positioned(
                              left: 10,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
                                onPressed: _previousImage,
                              ),
                            )
                          : Container(),
                      currentIndex != imagePaths.length-1
                      ? Positioned(
                        right: 10,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios,
                              color: Colors.white),
                          onPressed: _nextImage,
                        ),
                      )
                      : Container()
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(userData.name,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 5),
                            const Text("|",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey)),
                            const SizedBox(width: 5),
                            Text(userData.location,
                                style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("INK3929", style: TextStyle(fontSize: 20)),
                            SizedBox(width: 5),
                            Text("|",
                                style: TextStyle(
                                    fontSize: 24, color: AppColors.grey)),
                            SizedBox(width: 5),
                            Text("Last seen today at 11:11am",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text("Male", style: TextStyle(fontSize: 16)),
                            const SizedBox(width: 5),
                            const Text("|",
                                style: TextStyle(
                                    fontSize: 24, color: AppColors.grey)),
                            const SizedBox(width: 5),
                            Text("${userData.height}, ${userData.weight} Kg",
                                style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(userData.description,
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Personal Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OtherProfileDetailCard(
                                      title: "Height", value: userData.height),
                                  OtherProfileDetailCard(
                                      title: "Religion",
                                      value: userData.religion),
                                  const OtherProfileDetailCard(
                                      title: "Mother Tongue", value: "Tamil"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OtherProfileDetailCard(
                                      title: "Weight", value: userData.weight),
                                  const OtherProfileDetailCard(
                                      title: "Caste", value: "Nair"),
                                  OtherProfileDetailCard(
                                      title: "Marital Status",
                                      value: userData.status),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text("Educational Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const OtherProfileDetailCard(
                                  title: "Qualification",
                                  value: "MSc Computer Science"),
                              OtherProfileDetailCard(
                                  title: "Job", value: userData.role),
                              const OtherProfileDetailCard(
                                  title: "Income", value: "33 LPA"),
                              const OtherProfileDetailCard(
                                  title: "Working Location",
                                  value: "Infopark, Kochi"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text("Additional Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OtherProfileDetailCard(
                                  title: "Smoking Habit", value: "No"),
                              OtherProfileDetailCard(
                                  title: "Drinking Habit", value: "Yes"),
                              OtherProfileDetailCard(
                                  title: "Profile created by", value: "Sister"),
                              OtherProfileDetailCard(
                                  title: "Hobbies",
                                  value: "Reading, Painting, Singing"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  userData.req_status == "Accepted"
                      ? const MessageButton(text: "Message")
                      : const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DeclineButton(text: "Decline"),
                              AcceptButton(text: "Accept")
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 40,
                  )
                ]),
              ],
            ),
          ),
        ));
  }
}


// import 'package:flutter/material.dart';
// import 'package:inakal/constants/app_constants.dart';
// import 'package:inakal/features/profile/widgets/other_profile_detail_card.dart';
// import 'package:inakal/features/requests/widgets/accept_button.dart';
// import 'package:inakal/features/requests/widgets/decline_button.dart';
// import 'package:inakal/features/requests/widgets/message_button.dart';
// import 'package:inakal/model/user.dart';

// class OtherProfileScreen extends StatefulWidget {
//   const OtherProfileScreen({super.key});

//   @override
//   State<OtherProfileScreen> createState() => _OtherProfileScreenState();
// }

// class _OtherProfileScreenState extends State<OtherProfileScreen> {
//   User userData = User.getUser();
//   int _currentImageIndex = 0;
//   final List<String> _imagePaths = [
//     "assets/vectors/suriya2.jpg",
//     "assets/vectors/suriya.jpg",
//     "assets/vectors/suriya3.jpg",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(userData.name),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             color: AppColors.white,
//             child: Stack(
//               children: [
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     height: 150,
//                     decoration: const BoxDecoration(
//                       gradient: AppColors.lightPinkWhiteGradient,
//                     ),
//                   ),
//                 ),
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   Stack(
//                     children: [
//                       SizedBox(
//                         height: MediaQuery.of(context).size.width,
//                         width: MediaQuery.of(context).size.width,
//                         child: PageView.builder(
//                           itemCount: _imagePaths.length,
//                           onPageChanged: (index) {
//                             setState(() {
//                               _currentImageIndex = index;
//                             });
//                           },
//                           itemBuilder: (context, index) {
//                             return ClipRRect(
//                               borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(20),
//                                 bottomRight: Radius.circular(20),
//                               ),
//                               child: Image.asset(
//                                 _imagePaths[index],
//                                 fit: BoxFit.cover,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 10,
//                         left: 0,
//                         right: 0,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: List.generate(
//                             _imagePaths.length,
//                             (index) => Container(
//                               margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                               width: _currentImageIndex == index ? 10.0 : 8.0,
//                               height: _currentImageIndex == index ? 10.0 : 8.0,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: _currentImageIndex == index
//                                     ? Colors.pink
//                                     : Colors.grey,
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20.0, vertical: 15.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.baseline,
//                           textBaseline: TextBaseline.alphabetic,
//                           children: [
//                             Text(userData.name,
//                                 style: const TextStyle(
//                                     fontSize: 24, fontWeight: FontWeight.bold)),
//                             const SizedBox(width: 5),
//                             const Text("|",
//                                 style: TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.bold,
//                                     color: AppColors.grey)),
//                             const SizedBox(width: 5),
//                             Text(userData.location,
//                                 style: const TextStyle(fontSize: 16)),
//                           ],
//                         ),
//                         const Row(
//                           crossAxisAlignment: CrossAxisAlignment.baseline,
//                           textBaseline: TextBaseline.alphabetic,
//                           children: [
//                             Text("INK3929",
//                                 style: TextStyle(fontSize: 20)),
//                             SizedBox(width: 5),
//                             Text("|",
//                                 style: TextStyle(
//                                     fontSize: 24, color: AppColors.grey)),
//                             SizedBox(width: 5),
//                             Text("Last seen today at 11:11am",
//                                 style: TextStyle(fontSize: 16)),
//                           ],
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.baseline,
//                           textBaseline: TextBaseline.alphabetic,
//                           children: [
//                             const Text("Male", style: TextStyle(fontSize: 16)),
//                             const SizedBox(width: 5),
//                             const Text("|",
//                                 style: TextStyle(
//                                     fontSize: 24, color: AppColors.grey)),
//                             const SizedBox(width: 5),
//                             Text("${userData.height}, ${userData.weight} Kg",
//                                 style: const TextStyle(fontSize: 16)),
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         Text(userData.description,
//                             style: const TextStyle(fontSize: 16)),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text("Personal Details",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold)),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   OtherProfileDetailCard(
//                                       title: "Height", value: userData.height),
//                                   OtherProfileDetailCard(
//                                       title: "Religion", value: userData.religion),
//                                   const OtherProfileDetailCard(
//                                       title: "Mother Tongue", value: "Tamil"),
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   OtherProfileDetailCard(
//                                       title: "Weight", value: userData.weight),
//                                   const OtherProfileDetailCard(
//                                       title: "Caste", value: "Nair"),
//                                   OtherProfileDetailCard(
//                                       title: "Marital Status", value: userData.status),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         const Text("Educational Details",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold)),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const OtherProfileDetailCard(
//                                   title: "Qualification",
//                                   value: "MSc Computer Science"),
//                               OtherProfileDetailCard(
//                                   title: "Job",
//                                   value: userData.role),
//                               const OtherProfileDetailCard(
//                                   title: "Income", value: "33 LPA"),
//                               const OtherProfileDetailCard(
//                                   title: "Working Location",
//                                   value: "Infopark, Kochi"),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         const Text("Additional Details",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold)),
//                         const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               OtherProfileDetailCard(
//                                   title: "Smoking Habit", value: "No"),
//                               OtherProfileDetailCard(
//                                   title: "Drinking Habit", value: "Yes"),
//                               OtherProfileDetailCard(
//                                   title: "Profile created by", value: "Sister"),
//                               OtherProfileDetailCard(
//                                   title: "Hobbies",
//                                   value: "Reading, Painting, Singing"),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   userData.req_status == "Accepted" 
//                     ? const MessageButton(text: "Message")
//                     : const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 25.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           DeclineButton(text: "Decline"),
//                           AcceptButton(text: "Accept")
//                         ],
//                       ),
//                     ),
//                   const SizedBox(
//                     height: 40,
//                   )
//                 ]),
//               ],
//             ),
//           ),
//         ));
//   }
// }
