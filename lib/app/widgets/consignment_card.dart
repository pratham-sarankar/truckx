import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:transport/app/data/models/consignment.dart';

class ConsignmentCard extends StatelessWidget {
  const ConsignmentCard(
      {super.key, required this.onMessage, required this.consignment});

  final Function(Consignment) onMessage;
  final Consignment consignment;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      shadowColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, left: 12, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  consignment.logisticsName,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: "Type - ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.colorScheme.onSurface,
                    ),
                    children: const [
                      TextSpan(
                        text: "32Et Container/Open",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    text: "Product - ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.colorScheme.onSurface,
                    ),
                    children: [
                      TextSpan(
                        text: consignment.product,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    text: "Rate - ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.colorScheme.onSurface,
                    ),
                    children: const [
                      TextSpan(
                        text: "18,000/-",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(50, 50)),
                    foregroundColor: MaterialStateProperty.all(
                        Colors.green.shade700.withOpacity(1)),
                    overlayColor:
                        MaterialStateProperty.all(Colors.grey.shade100),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyLight.call,
                      ),
                      SizedBox(width: 5),
                      Text("Call"),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 1,
                color: Get.theme.dividerColor,
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    onMessage(consignment);
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(50, 50)),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.black.withOpacity(0.8),
                    ),
                    overlayColor:
                        MaterialStateProperty.all(Colors.grey.shade100),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyLight.message,
                      ),
                      SizedBox(width: 5),
                      Text("Message"),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
