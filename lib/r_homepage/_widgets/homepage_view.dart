import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_project_1/models/address.dart';
import 'package:interview_project_1/providers/category_json_p.dart';
import 'package:interview_project_1/r_homepage/_widgets/address_card.dart';
import 'package:interview_project_1/r_homepage/_widgets/category_card.dart';
import 'package:interview_project_1/r_homepage/_widgets/deal_of_the_day_card.dart';
import 'package:interview_project_1/r_homepage/_widgets/mega_deal_card.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //* text search field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            maxLines: 1,
            enabled: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              fillColor: Colors.grey.shade300,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Search in thousands of products',
            ),
          ),
        ),
        //* address Row
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: Address.addressList.map((e) {
              return AddressCard(address: e);
            }).toList(),
          ),
        ),
        //* explore by category
        GetBuilder<PxCategory>(
          init: PxCategory(),
          builder: (px) {
            return ListTile(
              title: Row(
                children: [
                  const Text('Explore by Category'),
                  const Spacer(),
                  TextButton(
                    child: Text('See All (${px.category.length})'),
                    onPressed: () {
                      GoRouter.of(context).go('/categoriespage');
                    },
                  ),
                ],
              ),
              subtitle: GetBuilder<PxCategory>(
                builder: (px) {
                  while (px.category.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: px.category.map((e) {
                        return CategoryCard(category: e);
                      }).toList(),
                    ),
                  );
                },
              ),
            );
          },
        ),
        //* deal of the day
        GetBuilder<PxCategory>(
          builder: (px) {
            return ListTile(
              title: Row(
                children: const [
                  Text('Deals of the Day'),
                ],
              ),
              subtitle: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: px.dotd.map((e) {
                    return DealOfTheDayCard(item: e);
                  }).toList(),
                ),
              ),
            );
          },
        ),
        //* mega deal
        GetBuilder<PxCategory>(
          builder: (px) {
            return MegaDealCard(
              megaDeal: px.megaDeal,
            );
          },
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
