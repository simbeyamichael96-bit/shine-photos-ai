import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(ShineApp());
}

class ShineApp extends StatelessWidget{
  @override
  Widget build(BuildContext c){
    return MaterialApp(debugShowCheckedModeBanner:false, home: HomePage());
  }
}

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState()=> _Home();
}

class _Home extends State<HomePage>{
  File? img;
  BannerAd? banner;
  final id = 'ca-app-pub-6198433078225470/7800723021';

  @override
  void initState(){
    super.initState();
    banner = BannerAd(adUnitId: id, size: AdSize.banner, request: AdRequest(), listener: BannerAdListener())..load();
  }

  pick() async {
    final p = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(p!=null) setState(()=> img = File(p.path));
  }

  @override
  Widget build(BuildContext c){
    return Scaffold(
      appBar: AppBar(title: Text('Shine Photos AI'), backgroundColor: Colors.purple, foregroundColor: Colors.white, centerTitle:true),
      body: Column(children:[
        Expanded(child: Center(child: img==null ? ElevatedButton.icon(onPressed: pick, icon: Icon(Icons.photo), label: Text('Chagua Picha')) : Image.file(img!))),
        ElevatedButton.icon(onPressed: (){ ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('✨ Ime Ng\'arishwa!'))); }, icon: Icon(Icons.auto_fix_high), label: Text('Ng\'arisha AI'), style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white)),
        SizedBox(height:10),
        if(banner!=null) SizedBox(height:50, child: AdWidget(ad: banner!))
      ]),
    );
  }
}
