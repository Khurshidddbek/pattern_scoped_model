import 'package:flutter/material.dart';
import 'package:pattern_scoped_model/scopes/update_scoped.dart';
import 'package:scoped_model/scoped_model.dart';

class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  String title, body;
  UpdatePage({this.title, this.body, Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateScoped scoped = UpdateScoped();

  @override
  void initState() {
    super.initState();

    scoped.titleTextEditingController.text = widget.title;
    scoped.bodyTextEditingController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new post'),
      ),
      body: ScopedModel<UpdateScoped>(
        model: scoped,
        child: ScopedModelDescendant<UpdateScoped>(
          builder: (ctx, model, index) => Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Title
                    Container(
                      height: 75,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextField(
                          controller: scoped.titleTextEditingController,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    // Body
                    Container(
                      height: 475,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: scoped.bodyTextEditingController,
                        style: TextStyle(fontSize: 18),
                        maxLines: 30,
                        decoration: InputDecoration(
                          labelText: 'Body',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
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
          scoped.apiPostUpdate(context);
        },
        child: Icon(Icons.file_upload),
      ),
    );
  }
}
