import 'package:flutter/material.dart';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Klonu',
      home: InstagramArayuz(), 
    );
  }
}

class InstagramArayuz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 125,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      
                      hikayeKutusu("https://upload.wikimedia.org/wikipedia/tr/a/ab/Giresun_%C3%9Cniversitesi_Logosu.png", "Giresun Üni."),
                      hikayeKutusu("https://thumbor.evrimagaci.org/xX9moFwB3xbHdWfiDnqL1fFu0ug=/filters:quality(85)/mi/ce9a2069-168c-442f-9169-da47afe12f7e.jpeg", "Barış Özcan"),
                      hikayeKutusu("https://upload.wikimedia.org/wikipedia/commons/8/8e/Fatma_Deniz_at_Republica25_2025-05-28_06_%28cropped%29.jpg", "Fatma Deniz"),
                      hikayeKutusu("https://upload.wikimedia.org/wikipedia/commons/b/b2/%C3%96mer_Y%C4%B1ld%C4%B1r%C4%B1m.jpg", "Ömer Yıldırım"),
                      hikayeKutusu("https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Ahmet-Akyol-B-transformed.jpg/1920px-Ahmet-Akyol-B-transformed.jpg", "Ahmet Akyol"),
                      hikayeKutusu("https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Ipek_Bilgin_at_Berlinale_2026.jpg/960px-Ipek_Bilgin_at_Berlinale_2026.jpg", "İpek Bilgin"),
                    ],
                  ),
                ),
                Divider(height: 1, color: Colors.grey[300]),
                
                GonderiYapisi(
                  kullanici: "giresun_uni",
                  gorselUrl: "https://upload.wikimedia.org/wikipedia/tr/a/ab/Giresun_%C3%9Cniversitesi_Logosu.png",
                ),
                GonderiYapisi(
                  kullanici: "ebubekir sifil",
                  gorselUrl: "https://pbs.twimg.com/profile_images/1185204768731533314/9xp7GXON_400x400.jpg",
                ),
                GonderiYapisi(
                  kullanici: "bora arda",
                  gorselUrl: "https://picsum.photos/id/237/500/500", 
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home, size: 28),
            Icon(Icons.search, size: 28),
            Icon(Icons.add_box_outlined, size: 28),
            Icon(Icons.favorite_border, size: 28),
            Icon(Icons.person_outline, size: 28),
          ],
        ),
      ),
    );
  }

  
  Widget hikayeKutusu(String resim, String isim) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Column(
        children: [
          Container(
            width: 68,
            height: 68,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.purple, Colors.red],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: NetworkImage(resim),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            isim,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}


class GonderiYapisi extends StatefulWidget {
  final String kullanici;
  final String gorselUrl;
  GonderiYapisi({required this.kullanici, required this.gorselUrl});
  @override
  _GonderiYapisiState createState() => _GonderiYapisiState();
}

class _GonderiYapisiState extends State<GonderiYapisi> {
  bool begendikMi = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(widget.kullanici, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Container(
          width: double.infinity,
          height: 400,
          color: Colors.grey[100],
          child: Image.network(
            widget.gorselUrl,
            fit: BoxFit.contain,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(begendikMi ? Icons.favorite : Icons.favorite_border, color: begendikMi ? Colors.red : Colors.black),
              onPressed: () => setState(() => begendikMi = !begendikMi),
            ),
            IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {}),
          ],
        ),
        Divider(),
      ],
    );
  }
}