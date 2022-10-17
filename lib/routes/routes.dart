import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_project_1/r_categories_page/categories_page.dart';
import 'package:interview_project_1/r_category_items_page/category_items_page.dart';
import 'package:interview_project_1/r_homepage/homepage.dart';
import 'package:interview_project_1/r_proceed_checkout/proceed_to_checkout.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => HomePage(
        key: state.pageKey,
      ),
      routes: [
        GoRoute(
          path: 'checkout',
          builder: (context, state) {
            return ProceedToCheckoutPage(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          path: 'categoriespage',
          builder: (BuildContext context, GoRouterState state) =>
              CategoriesPage(
            key: state.pageKey,
          ),
          routes: [
            GoRoute(
              path: 'items',
              builder: (BuildContext context, GoRouterState state) =>
                  CategoryItemsPage(
                key: state.pageKey,
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
