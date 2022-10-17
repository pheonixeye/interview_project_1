import 'package:flutter/material.dart';

class Address {
  final String title;
  final String street;
  final IconData icon;

  Address({
    required this.title,
    required this.street,
    required this.icon,
  });

  static List<Address> addressList = [
    Address(
      title: 'Home Address',
      street: 'Mustafa St. No:2 Street x12',
      icon: Icons.home,
    ),
    Address(
      title: 'Office Address',
      street: 'Axis Istanbul, B2 block Floor 2 Office 11',
      icon: Icons.work,
    ),
  ];
}
