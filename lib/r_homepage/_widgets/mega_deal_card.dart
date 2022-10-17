import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_project_1/models/category_item.dart';
import 'package:interview_project_1/styles/styles.dart';

class MegaDealCard extends StatelessWidget {
  const MegaDealCard({Key? key, required this.megaDeal}) : super(key: key);
  final CategoryItem? megaDeal;
  @override
  Widget build(BuildContext context) {
    return megaDeal == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.pink.shade100,
              elevation: 8,
              child: SizedBox(
                width: Get.size.shortestSide,
                height: Get.size.shortestSide * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.size.shortestSide * 0.4,
                      height: Get.size.shortestSide * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: Styles.REGULARCONTAINERBR,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        imageUrl: megaDeal!.imgUrl,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => SizedBox(
                          height: 20,
                          width: 20,
                          child: Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Builder(
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: megaDeal!.name.split(' ')[0],
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      letterSpacing: 0,
                                      textBaseline: TextBaseline.alphabetic,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '\n',
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.indigo.shade700,
                                          letterSpacing: 0,
                                        ),
                                        children: megaDeal!.name
                                            .split(' ')[1]
                                            .characters
                                            .map((e) {
                                          if (megaDeal!.name
                                                  .split(' ')[1]
                                                  .indexOf(e) ==
                                              megaDeal!.name
                                                      .split(' ')[1]
                                                      .length -
                                                  2) {
                                            return TextSpan(
                                              text: e.toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.red,
                                                letterSpacing: 2,
                                              ),
                                            );
                                          } else if (megaDeal!.name
                                                  .split(' ')[1]
                                                  .indexOf(e) ==
                                              megaDeal!.name
                                                      .split(' ')[1]
                                                      .length -
                                                  3) {
                                            return TextSpan(
                                              text: e.toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.indigo.shade700,
                                                letterSpacing: -6,
                                              ),
                                            );
                                          } else {
                                            return TextSpan(
                                              text: e.toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.indigo.shade700,
                                                letterSpacing: -1,
                                              ),
                                            );
                                          }
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      r'$'
                                      ' '
                                      '${(megaDeal!.pricePerUnit * (megaDeal!.discount / 100)).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      r'$' ' ' '${megaDeal!.pricePerUnit}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16,
                                        decoration: TextDecoration.combine(
                                          [TextDecoration.lineThrough],
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '* Available Until ${Random().nextInt(30)} December 2022',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
