import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/auth/custombuttonauth.dart';
import 'package:mydoctor/core/components/customloading.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';
import 'package:mydoctor/core/utilies/styles.dart';
import 'package:mydoctor/features/homeforuser/profile/controller/profileforusercontroller.dart';

class Profileforuserscreen extends StatelessWidget {
  const Profileforuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Profileforusercontroller());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "158".tr,
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "46".tr,
                      style:
                          Styles.textStyle30.copyWith(color: AppColors.wight),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: GetBuilder<Profileforusercontroller>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: controller.image == null
                            ? NetworkImage(
                                "${AppLinkAPi.images}/${controller.profileImage}")
                            : FileImage(controller.image!),
                      ),
                    ),
                    Positioned(
                        bottom: 1,
                        top: 95,
                        right: 1,
                        child: IconButton(
                            onPressed: () {
                              controller.chooseImage1();
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: Colors.grey,
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: controller.userprofileformkey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "12".tr,
                          style: Styles.textStyle24
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: controller.nameController,
                            cursorColor: AppColors.grey,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "27".tr;
                              }
                              return null;
                            },
                            style: Styles.textStyle16,
                            decoration: InputDecoration(
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: AppColors.red,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              hintText: controller.userName,
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "15".tr,
                          style: Styles.textStyle24
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: controller.phoneController,
                            cursorColor: AppColors.grey,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "181".tr;
                              } else if (val.length < 13) {
                                return "29".tr;
                              }
                              return null;
                            },
                            style: Styles.textStyle16,
                            decoration: InputDecoration(
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: AppColors.red,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: AppColors.primary,
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              hintText: controller.userPhone,
                              prefixIcon: const Icon(Icons.call),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    controller.statusRequest == StatusRequest.loading
                        ? CustomLoading()
                        : CustomButtonAuth(
                            textlogin: "23".tr,
                            onpress: () {
                              controller.updateProfile();
                            },
                          ),
                  ],
                ),
              ),
              controller.imageLoading == true
                  ? CustomLoading()
                  : CustomButtonAuth(
                      textlogin: "199".tr,
                      onpress: () async {
                        await controller.updateImage();
                      },
                    ),
            ],
          ),
        );
      }),
    );
  }
}
