import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final String? name;
  final int? age;

  final Function? onUpdate;
  final Function? onDelete;

  const ItemCard(this.name, this.age,
      {super.key, this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  name!,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Text(
                "${age!} year old",
                style: GoogleFonts.poppins(),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.green[900],
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    if (onUpdate != null) onUpdate!();
                  },
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.red[900],
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    if (onDelete != null) onDelete!();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
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
