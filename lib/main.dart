import 'package:application/firebase_options.dart';
import 'package:application/mainPages/qrCodeScanner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiteDash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BiteDash Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12202f),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //
          // BAŞLIK
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
            child: Text('BiteDash',
                style: GoogleFonts.montserrat(
                    fontSize: 64,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF4c87f1))),
          ),

          // BAŞLIK ALTI YAZISI
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 16,
            ),
            child: Text('Quick as a bite, dashingly simple.',
                style: GoogleFonts.montserratAlternates(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF4c87f1))),
          ),

          // QR CODE KARTI
          Padding(
            padding: EdgeInsets.only(),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const QRViewExample())),
              //builder: (context) => isletmeHome()
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.height / 3,
                child: Card(
                  color: Color(0xFF4c87f1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.qr_code),
                        title: Text('Scan QR Code'),
                        textColor: Color(0xFFFFFFFF),
                        iconColor: Color(0xFFFFFFFF),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //
          // EXIT BUTTON
          Padding(
            padding: EdgeInsets.only(),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.height / 3,
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
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Exit'),
                        textColor: Color(0xFFFFFFFF),
                        iconColor: Color(0xFFFFFFFF),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
