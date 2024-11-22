import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firestore_3/item_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD FIRESTORE"),
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: users.orderBy('name', descending: false).snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text("No data available"),
                      );
                    }

                    return Column(
                      children: snapshot.data!.docs.map((e) {
                        final data = e.data() as Map<String, dynamic>;
                        return ItemCard(
                          data['name'],
                          data['age'],
                          onUpdate: () {
                            users.doc(e.id).update({'age': data['age'] + 1});
                          },
                          onDelete: () {
                            users.doc(e.id).delete();
                          },
                        );
                      }).toList(),
                    );
                  }),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(-5, 0),
                  blurRadius: 15,
                  spreadRadius: 3,
                )
              ]),
              width: double.infinity,
              height: 130,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          style: GoogleFonts.poppins(),
                          controller: nameController,
                          decoration: const InputDecoration(hintText: "Name"),
                        ),
                        TextField(
                          style: GoogleFonts.poppins(),
                          controller: ageController,
                          decoration: const InputDecoration(hintText: "Age"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 130,
                    width: 130,
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.blue[900],
                      ),
                      onPressed: () {
                        users.add({
                          'name': nameController.text,
                          'age': int.tryParse(ageController.text) ?? 0
                        });

                        nameController.text = '';
                        ageController.text = '';
                      },
                      child: Text(
                        'Add Data',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
