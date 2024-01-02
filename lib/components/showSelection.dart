import 'package:application/components/showMenu.dart';
import 'package:application/repositories/cafeRepo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    //print(CafeRepo().menuData);
    return Scaffold(
      backgroundColor: Color(0xFF12202f),
      extendBody: true,
      body: _buildBody(
        context,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //
          // BAŞLIK
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 10,
                top: MediaQuery.of(context).size.height / 10),
            child: Text("MENU",
                style: GoogleFonts.montserrat(
                    fontSize: 64,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF4c87f1))),
          ),

          // BUTONLAR
          GridView.builder(
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2)),
              //padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: CafeRepo().categories.length,
              itemBuilder: (context, index) {
                return ListView(physics: ScrollPhysics(), children: <Widget>[
                  ActualMenuButton(title: CafeRepo().categories[index])
                ]);
                // print(CafeRepo().categories);
                //return ActualMenuButton(title: CafeRepo().categories[index]);
              }),
        ]);
  }
}

class ActualMenuButton extends StatelessWidget {
  const ActualMenuButton({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 500,
          right: MediaQuery.of(context).size.width / 500),
      //bottom: MediaQuery.of(context).size.width / 500),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ActualMenu(
            title: title,
          ),
        )),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          child: Card(
            color: Color(0xFF4c87f1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.menu_book),
                  title: Text(title),
                  textColor: Color(0xFFFFFFFF),
                  iconColor: Color(0xFFFFFFFF),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
