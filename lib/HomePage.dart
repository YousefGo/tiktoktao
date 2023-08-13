import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO link up images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true ;
  late String message;
  late List <String> gameStatus;

  //TODO initiaze the stateo of box with empty
  @override
  void initState(){
    super.initState();
    setState(() {
      this.gameStatus=[
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });

  }
  //TODO playGame method
   playGame(int index){
    if(this.gameStatus[index]=="empty"){
      setState(() {
        if(this.isCross){
          this.gameStatus[index]="cross";

        }
        else{
          this.gameStatus[index]="circle";
        }
      });
      this.isCross=!this.isCross;
      this.checkwin();
    }
   }
  // TODO Rest game method
   void resetGame(){
    setState(() {
      this.gameStatus=[
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
    this.message="";
    });
   }
  //TODO get image method
   AssetImage getImage(String value){
    switch(value){
      case ("cross"):
        return cross ;
        break;
      case ("circle"):
        return circle ;
        break;
      default:
        return edit ;
    }
   }
   //TODO wait 2 secned
   void wait()async{
      await Future.delayed(const Duration(seconds: 2)).then((val) {

        this.resetGame();

    });
   }
  // TODO check for win logic

  checkwin () {
    if(gameStatus[0]!="empty" && gameStatus[0]==gameStatus[1]
        &&gameStatus[1]==gameStatus[2]){
        setState(() {
          this.message='${this.gameStatus[0]} Wins';
        });
        wait();
    }
   else if(gameStatus[3]!="empty" && gameStatus[3]==gameStatus[4]
        &&gameStatus[4]==gameStatus[5]){
      setState(() {
        this.message='${this.gameStatus[3]} Wins';
      });
      wait();
    }
    else if(gameStatus[6]!="empty" && gameStatus[6]==gameStatus[7]
        &&gameStatus[7]==gameStatus[8]){
      setState(() {
        this.message='${this.gameStatus[6]} Wins';
      });
      wait();
    }
    else if(gameStatus[0]!="empty" && gameStatus[0]==gameStatus[3]
        &&gameStatus[3]==gameStatus[6]){
      setState(() {
        this.message='${this.gameStatus[0]} Wins';
      });
      wait();
    }
    else if(gameStatus[1]!="empty" && gameStatus[1]==gameStatus[4]
        &&gameStatus[4]==gameStatus[7]){
      setState(() {
        this.message='${this.gameStatus[1]} Wins';
      });
      wait();
  }
    else if(gameStatus[2]!="empty" && gameStatus[2]==gameStatus[5]
        &&gameStatus[5]==gameStatus[8]){
      setState(() {
        this.message='${this.gameStatus[2]} Wins';
      });
      wait();
    }
    else if(gameStatus[0]!="empty" && gameStatus[0]==gameStatus[4]
        &&gameStatus[4]==gameStatus[8]){
      setState(() {
        this.message='${this.gameStatus[0]} Wins';
      });
      wait();
    }
    else if(gameStatus[2]!="empty" && gameStatus[2]==gameStatus[4]
        &&gameStatus[4]==gameStatus[6]){
      setState(() {
        this.message='${this.gameStatus[2]} Wins';
      });
      wait();
    }
    else if(! gameStatus.contains('empty')){
      setState(() {
        this.message="Game Draw";
        wait();
      });
    }

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('TicTacToe')
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: GridView.builder
            (padding: EdgeInsets.all(20.0),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:3 ,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing:10.0
              ),
            itemCount: this.gameStatus.length,
            itemBuilder:(context,i)=>SizedBox(
              width: 100.0 ,
              height: 100.0,
              child: MaterialButton(
                onPressed: (){
                  this.playGame(i);
                },
                child: Image(
                  image:this.getImage(this.gameStatus[i]),
                ),
              ),
            ) ,

          )
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(this.message,style: TextStyle(fontSize: 20.0 ,
                fontWeight:FontWeight.bold),
            ),
          ),
          MaterialButton(
              color:Colors.orange,
              minWidth: 300.0,
              height: 50.0,
              child: Text("Rest Game",
              style: TextStyle(color:Colors.white,fontSize: 20.0 ),),
              onPressed:(){
            this.resetGame();
          } ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("Learn Code yousefroot.com",style:TextStyle(fontSize: 18.0)),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("pwoered By Yousef Sarkar",style:TextStyle(fontSize: 18.0)),
          ),
        ],
      ),
    );
  }
}
