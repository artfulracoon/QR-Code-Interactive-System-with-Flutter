import 'package:application/components/showSelection.dart';
import 'package:application/repositories/cafeRepo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActualMenu extends StatefulWidget {
  const ActualMenu({super.key, required this.title});
  final String title;
  @override
  State<ActualMenu> createState() => _ActualMenuState();
}

class _ActualMenuState extends State<ActualMenu> {
  @override
  Widget build(BuildContext context) {
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

          // ET ETC BUTTON
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0),
              shrinkWrap: true,
              itemCount: CafeRepo().menuData[widget.title].length,
              itemBuilder: (context, index) {
                return MenuButton(
                  title:
                      CafeRepo().menuData[widget.title][index].data()['İsim'],
                  fiyat:
                      CafeRepo().menuData[widget.title][index].data()['Fiyat'],
                  kalori:
                      CafeRepo().menuData[widget.title][index].data()['Kalori'],
                  photo:
                      CafeRepo().menuData[widget.title][index].data()['Photo'],
                );
              }),
        ]);
  }
}

class MenuButton extends StatefulWidget {
  const MenuButton({
    super.key,
    required this.title,
    required this.kalori,
    required this.fiyat,
    required this.photo,
  });
  final String title;
  final String kalori;
  final String fiyat;
  final String photo;

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 100,
          right: MediaQuery.of(context).size.width / 100),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Card(
          color: Color(0xFF4c87f1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.menu_book),
                title: Text(widget.title),
                textColor: Color(0xFFFFFFFF),
                iconColor: Color(0xFFFFFFFF),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Ink.image(
                        width: 36.0,
                        height: 36.0,
                        fit: BoxFit.scaleDown,
                        image: NetworkImage("${widget.photo}")),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "\nKalori: ${widget.kalori}\nFiyat: ${widget.fiyat}",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
