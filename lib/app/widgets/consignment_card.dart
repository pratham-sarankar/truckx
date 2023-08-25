import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transport/app/data/models/consignment_card.dart';

class ConsignmentCard extends StatelessWidget {
  const ConsignmentCard({super.key, required this.consignment});
  final Consignment consignment;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, left: 12, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(consignment.from),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5.5, top: 2, bottom: 2),
                  width: 1,
                  height: 6,
                  color: Colors.grey,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5.5, top: 2, bottom: 2),
                  width: 1,
                  height: 6,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(consignment.to),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            children: [
              const SizedBox(width: 14),
              Text(consignment.logisticsName),
              const Spacer(),
              IconButton(
                onPressed: () {},
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                ),
                icon: const Icon(CupertinoIcons.envelope),
              ),
              IconButton(
                onPressed: () {},
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                ),
                icon: const Icon(CupertinoIcons.phone),
              ),
            ],
          )
        ],
      ),
    );
  }
}
