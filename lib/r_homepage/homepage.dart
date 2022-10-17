import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_project_1/models/navbar_items.dart';
import 'package:interview_project_1/providers/bot_nav_index.dart';
import 'package:interview_project_1/providers/cart_p.dart';
import 'package:interview_project_1/providers/category_json_p.dart';
import 'package:interview_project_1/r_homepage/_widgets/exit_confirmation_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final dialog = await showDialog<bool>(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const ExitConfirmationDialog();
          },
        );
        return dialog!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                //TODO: implement custom shape
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(20).copyWith(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on_outlined),
                      Text('Mustafa St.'),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                width: 50,
                height: 50,
                child: SizedBox(
                  child: IconButton(
                    onPressed: () async {
                      await Get.put(PxCategory()).mod();
                    },
                    icon: const Icon(Icons.check),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<PxBotNavIndex>(
          init: PxBotNavIndex(),
          autoRemove: false,
          builder: (px) {
            return PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return NavBarItem.navItemList[px.index].page;
              },
              itemCount: NavBarItem.navItemList.length,
              onPageChanged: (value) {
                px.selectIndex(value);
              },
            );
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: GetBuilder<PxBotNavIndex>(builder: (pxI) {
            return FloatingActionButton.large(
              onPressed: () {
                pxI.selectIndex(3);
              },
              heroTag: 'cartdisplay',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<PxCart>(
                    init: PxCart(),
                    autoRemove: false,
                    builder: (px) {
                      return Text(
                          r'$' ' ' '${px.totalCartPrice.toStringAsFixed(2)}');
                    },
                  ),
                  const Icon(Icons.shopping_cart_checkout),
                ],
              ),
              shape: const CircleBorder(),
              backgroundColor: Colors.orange,
            );
          }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: GetBuilder<PxBotNavIndex>(
          builder: (px) {
            return AnimatedBottomNavigationBar(
              icons: NavBarItem.navItemList
                  .map((element) => element.icon)
                  .toList(),
              activeIndex: px.index,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.sharpEdge,
              onTap: (index) {
                px.selectIndex(index);
              },
              activeColor: Colors.orange,
              inactiveColor: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
