import 'package:flutter/material.dart';
import 'package:quote/quote_widget.dart';
import 'service.dart';


void main (){
  runApp(Myapp());
}
class  Myapp extends StatelessWidget {
  const  Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor:Color.fromARGB(255, 225, 218, 147))),
      title: "New Quote App",
      home:const Homepage(),
    );
  }
}
class  Homepage extends StatelessWidget {
  const  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer:const  Drawer(
        backgroundColor:  Color.fromARGB(255, 229, 222, 151),
        child: Column(children: [
          DrawerHeader(child: Text("Motivational App",style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
        ],),
      ),
      appBar: AppBar(
        title:const Text("Quotes"),
        backgroundColor:const Color.fromARGB(216, 240, 171, 23),
      ),
      body: FutureBuilder(future: OnlineService().getQuotes(), builder: (context,snapshot){
        if (snapshot.connectionState==ConnectionState.waiting){
          return const Center(child:CircularProgressIndicator());
        }if (snapshot.hasError){
          return Center(child: Text("Error:${snapshot.error}"),);
        }if (snapshot.hasData){
          final quotes=snapshot.data!;
          return ListView.builder(
            itemCount: quotes.length,
            itemBuilder:(context, index) {
              return QuoteWidget(quote: quotes[index]);
            },
          );
      }
      return Text("Error");
      }
      )
    );

  }
}

