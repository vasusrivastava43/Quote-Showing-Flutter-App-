import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quoteLiist.dart';
import 'quote_card.dart';
import 'addquote.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>Quote(),
      'add':(context)=>addQuote()
    },
  ));
}
  class Quote extends StatefulWidget {
  @override
  State<Quote> createState() => _QuoteState();
  }

  class _QuoteState extends State<Quote> {
    // List<String> quote1=['fjhgfhdfkhdfhff','sdffaffefqwefw','dweaefdsfaefaf'];
    List<quoteList> quote1=[quoteList(text: 'Be so busy improving your self that you have no time to criticize others.', author: 'Chetan Bhagat'),
      quoteList(text: 'The only way to learn a new programming language is by writing programs in it.', author: 'Dennis Ritchie'),
      quoteList(text: ''"Don't write better error messages , write code that doesn't need them."'', author: 'Jason C. McDonald')];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[400],
    appBar: AppBar(
      title: Text('QUOTES'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    body: ListView.builder(
        itemCount: quote1.length,
        itemBuilder: (context,index){
          return quoteCard(quotelist:quote1[index] , delete: (){
            setState(() {
              quoteList deletedItem=quote1.removeAt(index);
              final snackBar = SnackBar(
                content: const Text('Quote Deleted'),
                action: SnackBarAction(label: 'Undo',
                    onPressed: () => setState(() => quote1.insert(index, deletedItem),)
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
            );
          }
          );
          } ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.red,
      child: Icon(Icons.add),
      onPressed: () async{
        final result = await Navigator.pushNamed(context,'add') as quoteList;
        setState(() {
          quote1.add(result);
        });
      },
    ),
  );
  }
}

