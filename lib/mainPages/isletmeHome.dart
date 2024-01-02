import 'package:application/components/showSelection.dart';
import 'package:application/repositories/cafeRepo.dart';
import 'package:application/components/showSpotifyPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class isletmeHome extends StatelessWidget {
  const isletmeHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12202f),
      body: _buildBody(
        context,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //
          // BAŞLIK
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 10,
                right: MediaQuery.of(context).size.width / 10,
                bottom: MediaQuery.of(context).size.width / 10,
                top: MediaQuery.of(context).size.height / 10),
            child: Text(CafeRepo().cafeData!["cafe_name"],
                style: GoogleFonts.montserrat(
                    fontSize: 46,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF4c87f1))),
          ),

          // SADAKAT
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 10,
                right: MediaQuery.of(context).size.width / 10,
                bottom: MediaQuery.of(context).size.width / 10,
                top: MediaQuery.of(context).size.height / 100),
            child: Text(
                "You need ${CafeRepo().cafeSadakatData!["max"] - CafeRepo().cafeSadakatData!["how_many"]} more coffees to get a free one!",
                style: GoogleFonts.montserrat(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF4c87f1))),
          ),

          //
          // MENU BUTTON

          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 50,
                right: MediaQuery.of(context).size.width / 50),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Menu(),
              )),
              child: Container(
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
                      const ListTile(
                        leading: Icon(Icons.menu_book),
                        title: Text('Menu'),
                        textColor: Color(0xFFFFFFFF),
                        iconColor: Color(0xFFFFFFFF),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // SPOTIFY
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 50,
                right: MediaQuery.of(context).size.width / 50),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SpotifyPage(),
              )),
              child: Container(
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
                      const ListTile(
                        leading: Icon(Icons.menu_book),
                        title: Text('Spotify'),
                        textColor: Color(0xFFFFFFFF),
                        iconColor: Color(0xFFFFFFFF),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
