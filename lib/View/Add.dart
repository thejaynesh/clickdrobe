import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(1.0),
            child: Center(
              child: OutlinedButton(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20,),
                    Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcskiG2uurF1un5U4Oox5WesvTRfheHxR_Xg&usqp=CAU'),
                    Text('Add Clothes',textScaleFactor: 2,),
                  ],
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/AddProductForm');
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Or',
            textScaleFactor: 1.7,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                 Center(
                  child: ElevatedButton(onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildPopupDialog(context),
                    );
                  },
                      child: Text('Add clothes from URL'),),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return  AlertDialog(
      title: const Text('Enter Product URL'),
      content:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          TextField(
            keyboardType: TextInputType.url,
          )
        ],
      ),
      actions: <Widget>[
         TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
