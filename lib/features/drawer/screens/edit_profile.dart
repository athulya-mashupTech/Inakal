import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient_from_top.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/educational_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/family_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/partners_preference_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/personal_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/additional_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/location_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/profile_details.dart';
import 'package:shimmer/shimmer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final userController = Get.find<UserDataController>();
  DropdownModel? dropdownModel;
  bool _isLoading = true;
  bool _isSavingImage = false;

  Future<void> pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _isSavingImage = true;
      });
      await EditProfileService()
          .uploadProfileImage(filePath: pickedFile.path, context: context)
          .then((value) async {
        await userController.updateProfilePicture(value!.url ?? "");
        setState(() {
          _isSavingImage = false;
        });
      });
    }
  }

  Future<void> _loadDropdownOptions() async {
    await EditProfileService()
        .getDropdownOptions(context: context)
        .then((value) {
      setState(() {
        dropdownModel = value;
      });
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadDropdownOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(children: [
          const LightPinkGradientFromTop(),
          Positioned(
            top: 50,
            left: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.14),
              child: Image.asset(
                "assets/vectors/dotted_design3.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Edit ',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                              ),
                              TextSpan(
                                text: 'Profile',
                                style: TextStyle(
                                  color: AppColors.primaryRed,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      // Profile Image
                      Stack(
                        children: [
                          Obx(() => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: AppColors.primaryRed,
                                    width: 3,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 80,
                                  child: _isSavingImage
                                  ? Center(child: CircularProgressIndicator(color: AppColors.primaryRed,))
                                  : ClipOval(
                                    child: CachedNetworkImage(
                                      height: 160,
                                      width: 160,
                                      imageUrl: userController
                                              .userData.value.user?.image ??
                                          "https://i.pinimg.com/736x/dc/9c/61/dc9c614e3007080a5aff36aebb949474.jpg",
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                        baseColor: AppColors.grey,
                                        highlightColor: AppColors.white,
                                        child: Container(
                                          color: AppColors.grey,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/images/user_avatar.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primaryRed,
                                  width: 3,
                                ),
                              ),
                              width: 50,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: AppColors.primaryRed,
                                  size: 22,
                                ),
                                onPressed: () async {
                                  await pickImage(context);
                                },
                                iconSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Profile Details
                _isLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(child: CircularProgressIndicator()))
                    : Column(
                        children: [
                          ProfileDetails(dropdownModel!),
                          SizedBox(height: 2),
                          PersonalDetails(dropdownModel!),
                          SizedBox(
                            height: 2,
                          ),
                          EducationalDetails(dropdownModel!),
                          SizedBox(
                            height: 2,
                          ),
                          FamilyDetails(dropdownModel!),
                          SizedBox(
                            height: 2,
                          ),
                          LocationDetails(dropdownModel!),
                          SizedBox(
                            height: 2,
                          ),
                          AdditionalDetails(),
                          SizedBox(
                            height: 2,
                          ),
                         PartnersPreferenceDetails(dropdownModel!),
                         
                        ],
                      ),
              ]))),
        ]));
  }
}
