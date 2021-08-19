import 'package:flutter/material.dart';
import 'package:pattern_scoped_model/pages/create_page.dart';
import 'package:pattern_scoped_model/scopes/home_scoped.dart';
import 'package:pattern_scoped_model/views/item_of_post.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
HomeScoped scoped = HomeScoped();

  @override
  void initState() {
    super.initState();
    scoped.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SetState'),
      ),
      body: ScopedModel<HomeScoped>(
        model: scoped,
        child: ScopedModelDescendant<HomeScoped>(
          builder: (ctx, model, index) => Stack(
            children: [
              ListView.builder(
                itemCount: scoped.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPosts(context, scoped, scoped.items[index]);
                },
              ),

              scoped.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, CreatePage.id);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}