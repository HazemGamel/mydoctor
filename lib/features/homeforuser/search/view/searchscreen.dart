import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/components/customanimationloading.dart';
import 'package:mydoctor/core/components/customloading.dart';
import 'package:mydoctor/core/functions/translatdatabase.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';
import 'package:mydoctor/core/utilies/styles.dart';
import 'package:mydoctor/features/homeforuser/search/controller/seaechcontroller.dart';
import 'package:mydoctor/models/usermodels/search/serachmodel.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Seaechcontroller());
    return Scaffold(
      body: GetBuilder<Seaechcontroller>(builder: (controller) {
        return ListView(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(100),
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
                          Image.asset(
                            AppAssets.logo,
                            height: 50,
                            width: 50,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: controller.search,
                        cursorColor: AppColors.grey,
                        style: Styles.textStyle16,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            borderSide: BorderSide(color: AppColors.wight),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            borderSide: BorderSide(color: AppColors.wight),
                          ),
                          fillColor: AppColors.grey.withOpacity(0.5),
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          hintText: "140".tr,
                          hintStyle: Styles.textStyle16
                              .copyWith(color: AppColors.wight),
                          suffixIcon: InkWell(
                            onTap: () {
                              controller.onPressSearch();
                            },
                            child: const Icon(Icons.search,
                                color: AppColors.wight),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),

            //search list
            controller.statusRequest == StatusRequest.loading
                ? CustomLoading()
                : controller.isSearching && controller.searchList.isEmpty
                    ? Center(
                        child: Text(
                          "205".tr,
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    : ItemsSearchList(
                        model: controller.searchList,
                      ),
          ],
        );
      }),
    );
  }
}

class ItemsSearchList extends StatelessWidget {
  final List<SearchModel> model;
  const ItemsSearchList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: model.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(AppRouter.kClinicdetailsforuserscreen,
                  arguments: {"id": model[index].id});
            },
            child: Container(
              padding: const EdgeInsets.all(1),
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppLinkAPi.images}/${model[index].image}",
                            height: 100,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            ), // Loading indicator
                            errorWidget: (context, url, error) => const Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.red,
                            ), // Error widget
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(
                            "${translateDatabase(model[index].nameAr, model[index].nameEn)}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle20
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "${translateDatabase(model[index].addressAr, model[index].addressEn)}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
