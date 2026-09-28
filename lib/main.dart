import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData.dark(), home: ShineUltimate()));

class ShineUltimate extends StatefulWidget {
  @override
  State<ShineUltimate> createState() => _ShineUltimateState();
}

class _ShineUltimateState extends State<ShineUltimate> {
  String activeTool = "ALL";
  final allTypes = [
    {"cat":"EDIT","icon":"✏️","name":"Edit","type":"Any Photo"},
    {"cat":"EDIT","icon":"💡","name":"Light","type":"Bright/Dark"},
    {"cat":"EDIT","icon":"🎨","name":"Colors","type":"100+ Filters"},
    {"cat":"AI","icon":"🤖","name":"AI Photo","type":"Text to Image"},
    {"cat":"AI","icon":"👩","name":"Avatar","type":"Cartoon You"},
    {"cat":"AI","icon":"👶","name":"Baby AI","type":"Future Baby"},
    {"cat":"FRAME","icon":"🌸","name":"Flower Frame","type":"Unlimited"},
    {"cat":"FRAME","icon":"🌻","name":"Sunflower","type":"Full Border"},
    {"cat":"FRAME","icon":"🌹","name":"Rose Gold","type":"Luxury"},
    {"cat":"FRAME","icon":"💐","name":"Mix Flowers","type":"100+ combos"},
    {"cat":"BG","icon":"🏖️","name":"Beach BG","type":"Any Beach"},
    {"cat":"BG","icon":"⛰️","name":"Mountain BG","type":"Any Mountain"},
    {"cat":"BG","icon":"🏙️","name":"City BG","type":"Dubai, NY..."},
    {"cat":"BG","icon":"✂️","name":"Remove BG","type":"Erase BG"},
    {"cat":"DOC","icon":"🪪","name":"Passport","type":"All Sizes"},
    {"cat":"DOC","icon":"💍","name":"Wedding","type":"Wedding"},
    {"cat":"DOC","icon":"🎓","name":"Graduation","type":"Graduation"},
    {"cat":"DOC","icon":"🎂","name":"Birthday","type":"Birthday"},
    {"cat":"DOC","icon":"👶","name":"Kids","type":"Children"},
    {"cat":"DOC","icon":"📸","name":"Collage","type":"2-9 Photos"},
  ];

  @override
  Widget build(BuildContext context) {
    List filtered = activeTool=="ALL"? allTypes : allTypes.where((e)=>e["cat"]==activeTool).toList();
    return Scaffold(
      backgroundColor: Color(0xFF080808),
      appBar: AppBar(backgroundColor: Colors.black, title: Row(children: [Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFFFD700), Colors.orange]), borderRadius: BorderRadius.circular(10)), child: Icon(Icons.all_inclusive, size: 16, color: Colors.white)), SizedBox(width:8), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("SHINE STUDIO", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)), Text("Create ANY Type of Photo", style: TextStyle(fontSize: 9, color: Colors.amber))])])),
      body: Column(
        children: [
          Container(height: 45, child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.symmetric(horizontal: 10), children: [_catChip("ALL","ALL"), _catChip("EDIT","Edit"), _catChip("AI","AI"), _catChip("FRAME","Frame"), _catChip("BG","BG"), _catChip("DOC","Doc") ])),
          Container(height: 200, margin: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF151515), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white10)), child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.add_photo_alternate, size: 50, color: Colors.white24), SizedBox(height:10), Text("Select photo type below", style: TextStyle(color: Colors.white54, fontSize: 12)), SizedBox(height:6), Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: Color(0xFFFFD700), borderRadius: BorderRadius.circular(20)), child: Text("OPEN GALLERY", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 11)))]))),
          Expanded(child: GridView.builder(padding: EdgeInsets.symmetric(horizontal: 10), itemCount: filtered.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.9, crossAxisSpacing: 8, mainAxisSpacing: 8), itemBuilder: (c,i){ var item = filtered[i]; return Container(decoration: BoxDecoration(color: Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.white10)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(item["icon"], style: TextStyle(fontSize: 28)), SizedBox(height:4), Text(item["name"], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10), textAlign: TextAlign.center), Text(item["type"], style: TextStyle(color: Colors.white38, fontSize: 7), textAlign: TextAlign.center)]));})),
          Container(margin: EdgeInsets.all(12), height: 55, decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFFFD700), Color(0xFFFF6A00)]), borderRadius: BorderRadius.circular(15)), child: Center(child: Text("CREATE ANY PHOTO NOW", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)))),
        ],
      ),
    );
  }
  Widget _catChip(String id, String label){ bool active = activeTool==id; return GestureDetector(onTap: ()=>setState(()=>activeTool=id), child: Container(margin: EdgeInsets.only(right:8), padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8), decoration: BoxDecoration(color: active? Color(0xFFFFD700): Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(20)), child: Center(child: Text(label, style: TextStyle(color: active? Colors.black: Colors.white70, fontWeight: FontWeight.bold, fontSize: 11)))));}
}
