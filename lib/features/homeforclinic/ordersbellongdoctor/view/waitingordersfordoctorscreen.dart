import 'package:flutter/material.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class WaitingordersfordoctorScreen extends StatelessWidget {
  const WaitingordersfordoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back",
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Waiting Orders",
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
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const CustomItemForWaitingOrders();
              },
              childCount: 3, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}

class CustomItemForWaitingOrders extends StatelessWidget {
  const CustomItemForWaitingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: screenWidth * 0.95, // 90% of screen width
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.yellow, Colors.yellow.withOpacity(0.5)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.yellow.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.list_alt,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Order Number",
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    " : 1 ",
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.normal, color: AppColors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.person,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Pation Name",
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    " : Ahmed Mohamed ",
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.normal, color: AppColors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.call,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Phone",
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " : 123456789 ",
                        style: Styles.textStyle24.copyWith(
                            fontWeight: FontWeight.normal,
                            color: AppColors.black),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.phone,
                            size: 30,
                            color: AppColors.primary,
                          ))
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.wight),
                        color: AppColors.primary),
                    child: Center(
                        child: Text(
                      "Approve",
                      style:
                          Styles.textStyle24.copyWith(color: AppColors.wight),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.wight),
                        color: AppColors.red),
                    child: Center(
                        child: Text(
                      "Reject",
                      style:
                          Styles.textStyle24.copyWith(color: AppColors.wight),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
