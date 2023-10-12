
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
  //função para criar o background da tela
  Widget _buildBodyBack() => Container(
        decoration: const BoxDecoration(
          color: Colors.white
            ),
      );

  Future<QuerySnapshot> _getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('home').orderBy('pos').get();
    return querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    //O stack faz com que vc possa sobrepor elementos uns sobre os outrs
    return Stack(
      children: <Widget>[
        //função que constrói o background rosa
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              floating: true, //faz desaparecer o appBar ao rolar
              snap: true, //faz desaparecer o appBar ao rolar
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Novidades', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
                centerTitle: true,
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
                    child: GridView.custom(
                      padding: const EdgeInsets.all(2),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
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
