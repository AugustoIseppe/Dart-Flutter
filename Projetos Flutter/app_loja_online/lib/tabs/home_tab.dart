import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  


  Future<QuerySnapshot> _getData() async {
    // Buscando todas as imagens do banco de dados
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('home').orderBy('pos').get();
    return querySnapshot;
  }

  @override
  Widget build(BuildContext context) {

    /* PÁGINA INICIAL COM AS IMAGENS */
    
    //O stack faz com que vc possa sobrepor elementos uns sobre os outrs
    return Stack(
      children: <Widget>[
        //função que constrói o background rosa
        CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true, //faz desaparecer o appBar ao rolar
              snap: false, //faz desaparecer o appBar ao rolar
              backgroundColor: Colors.transparent,
              elevation: 10,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network("https://cdn.pixabay.com/photo/2016/10/26/00/07/brazilian-beach-1770335_1280.jpg", fit: BoxFit.cover,),
                title: const Text('Novidades', style: TextStyle(color: Colors.white)),
                centerTitle: true,
                expandedTitleScale: 2,
                collapseMode: CollapseMode.pin,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: _getData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.custom(
                        padding: const EdgeInsets.all(2),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: snapshot.data!.docs.map((e) {
                            return QuiltedGridTile(e['y'], e['x']);
                          }).toList(),
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: snapshot.data!.docs[index]['image'], 
                              fit: BoxFit.cover,
                              
                            ),
                          ),
                          childCount: snapshot.data!.docs.length,
                        ),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        )
      ],
    );
  }
}
