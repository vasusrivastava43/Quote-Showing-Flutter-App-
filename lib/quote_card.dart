import 'package:flutter/material.dart';
import 'quoteLiist.dart';

class quoteCard extends StatelessWidget {
  final Function delete;

  final quoteList quotelist;
  quoteCard({required this.quotelist,required this.delete,});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child:Padding(
          padding: EdgeInsets.all(12),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  quotelist.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),

              SizedBox(height: 6),
               Text(quotelist.author,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18,
                  ),
                ),

              SizedBox(height: 8),
              TextButton(onPressed: (){
                print("");
                delete();
                },
                child: Text('Delete Quote'),
              )
            ],
          ),
        )
    );
  }
}
