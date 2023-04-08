import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageComponent(),
            const SizedBox(height: 10),
            const TextComponent(),
            const SizedBox(height: 20),
            ContainerShadowComponent(component: const ListTileComponentPhone()),
            const SizedBox(height: 20),
            MaterialShadowComponent(component: const ListTileComponentEmail()),
          ],
        ),
      ),
    );
  }
}

class ImageComponent extends StatelessWidget {
  const ImageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100,
      height: 100,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://miro.medium.com/v2/resize:fit:1400/0*vowtRZE_wvyVA7CB"),
        radius: 150,
      ),
    );
  }
}

class TextComponent extends StatelessWidget {
  const TextComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Kayba Omenare",
        style: GoogleFonts.indieFlower(
            fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold));
  }
}

class ContainerShadowComponent extends StatelessWidget {
  ContainerShadowComponent({super.key, required this.component});

  ListTileComponentPhone component;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: component,
    );
  }
}

class MaterialShadowComponent extends StatelessWidget {
  MaterialShadowComponent({super.key, required this.component});

  ListTileComponentEmail component;

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
        elevation: 8,
        child: component);
  }
}

class ListTileComponentPhone extends StatelessWidget {
  const ListTileComponentPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.phone_android),
      title: const Text(
        "351 935-769-578",
        style: TextStyle(color: Colors.teal),
      ),
      onTap: () => launchUrl(
        Uri(
          scheme: "tel",
          path: "+351935769578",
        ),
      ),
    );
  }
}

class ListTileComponentEmail extends StatelessWidget {
  const ListTileComponentEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.email),
      title: const Text(
        "filipenunes.developer@gmail.com",
        style: TextStyle(color: Colors.teal),
      ),
      onTap: () => launchUrl(
        Uri(
          scheme: "mailto",
          path: "filipenunes.developer@gmail.com",
        ),
      ),
    );
  }
}
