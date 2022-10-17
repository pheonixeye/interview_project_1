import 'package:flutter/material.dart';
import 'package:interview_project_1/models/address.dart';
import 'package:interview_project_1/styles/styles.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.address,
  }) : super(key: key);
  final Address address;
  @override
  Widget build(BuildContext context) {
    //TODO: implement better responsive design
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: Styles.REGULARCONTAINERBR,
              ),
              width: double.infinity,
              height: double.infinity,
              child: Icon(address.icon),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    address.street,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
