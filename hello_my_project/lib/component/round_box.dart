import 'package:flutter/material.dart';


Widget EButton({
  required String text,
  required GestureTapCallback onPressed,
}){
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.orange),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ))
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 8.0,
      ),
    ),
  );
}

class RoundBox1 extends StatefulWidget{
  //GestureTapCallback onTap;
  String str;
  String label;
  bool obscureText = true;
  bool onlyRead = true;
  TextEditingController? textEditingController;

  RoundBox1({
    Key? key,
    required this.str,
    required this.label,
    //required this.onTap,
    required this.obscureText,
    required this.onlyRead,
    required TextEditingController? textEditingController,
}):this.textEditingController = textEditingController,super(key: key);

  @override
  State<RoundBox1> createState() {
    return _RoundBox1State();
  }

}

class _RoundBox1State extends State<RoundBox1>{
  TextEditingController? textEditingController;
  bool toggle = true;

  @override
  void initState(){
    super.initState();
    toggle = true;
    if(widget.textEditingController == null){
      print("what null");
      textEditingController = TextEditingController(text: 'hello hello');
    }
    else{
      textEditingController = widget.textEditingController;
      textEditingController!.text = widget.str;
    }
    //textEditingController = widget.textEditingController;
    //textEditingController!.text = widget.str;
  }

  @override
  void dispose(){

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapToggle,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 116.0,
        //width: 130.0,
        child: RBox(toggle: toggle),
      ),
    );
  }

  void onTapToggle(){
    setState(() {
      toggle = !toggle;
    });
  }

  Widget RBox({required bool toggle}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 25,
          child: Text(widget.label),
        ),
        SizedBox(
          width: 350,
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(55),
                )
            ),
            controller: textEditingController!,
            readOnly: widget.onlyRead,
            obscureText: widget.obscureText,
            maxLength: 50,
          ),
        ),

      ],
    );

  }
}

class RoundBox2 extends StatefulWidget{
  //GestureTapCallback onTap;
  String str;
  String label;
  bool obscureText = true;
  bool onlyRead = true;
  TextEditingController? textEditingController;

  RoundBox2({
    Key? key,
    required this.str,
    required this.label,
    //required this.onTap,
    required this.obscureText,
    required this.onlyRead,
    required TextEditingController? textEditingController,
  }):this.textEditingController = textEditingController,super(key: key);

  @override
  State<RoundBox2> createState() {
    return _RoundBox2State();
  }

}

class _RoundBox2State extends State<RoundBox2>{
  TextEditingController? textEditingController;
  bool toggle = true;

  @override
  void initState(){
    super.initState();
    toggle = true;
    if(widget.textEditingController == null){
      textEditingController = TextEditingController(text: widget.str);
    }
    else{
      textEditingController = widget.textEditingController;
      textEditingController!.text = widget.str;
    }

  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapToggle,
      child: RBox(toggle: toggle),
    );
  }

  void onTapToggle(){
    setState(() {
      toggle = !toggle;
    });
  }

  Widget RBox({required bool toggle}){
    if(toggle){
      return Container(
        margin: EdgeInsets.all(5),
        height: 115.0,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 25,
              child: Text(widget.label),
            ),
            SizedBox(
              width: 350,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(55),
                    )
                ),
                controller: textEditingController,
                readOnly: widget.onlyRead,
                obscureText: widget.obscureText,
                maxLength: 50,
              ),
            ),

          ],
        ),
      );
    }
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height/2,
      //width: 130.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 25,
            child: Text(widget.label),
          ),
          SizedBox(
            width: 350,
            height: MediaQuery.of(context).size.height/2.2,
            child: Align(
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(55),
                    )
                ),
                controller: textEditingController,
                readOnly: widget.onlyRead,
                obscureText: widget.obscureText,
                maxLength: 500000,
                expands: true,
                minLines: null,
                maxLines: null,
              ),
            )
          ),

        ],
      ),
    );
  }
}

class RoundBox3 extends StatefulWidget{
  //GestureTapCallback onTap;
  String str;
  String label;
  bool obscureText = true;
  bool onlyRead = true;
  TextEditingController? textEditingController;

  RoundBox3({
    Key? key,
    required this.str,
    required this.label,
    //required this.onTap,
    required this.obscureText,
    required this.onlyRead,
    required TextEditingController? textEditingController,
  }):this.textEditingController = textEditingController,super(key: key);

  @override
  State<RoundBox3> createState() {
    return _RoundBox3State();
  }

}

class _RoundBox3State extends State<RoundBox3>{
  TextEditingController? textEditingController;
  bool toggle = true;

  @override
  void initState(){
    super.initState();
    toggle = true;
    if(widget.textEditingController == null){
      textEditingController = TextEditingController(text: widget.str);
    }
    else{
      textEditingController = widget.textEditingController;
      textEditingController!.text = widget.str;
    }

  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapToggle,
      child: RBox(toggle: toggle),
    );
  }

  void onTapToggle(){
    setState(() {
      toggle = !toggle;
    });
  }

  Widget RBox({required bool toggle}){
    if(toggle){
      return Container(
        margin: EdgeInsets.all(5),
        height: 115.0,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 25,
              child: Text(widget.label),
            ),
            Stack(
              children: [
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55),
                        )
                    ),
                    controller: textEditingController,
                    readOnly: true,
                    obscureText: widget.obscureText,
                    maxLength: 50,
                  ),
                ),
                Positioned(
                  //left: 0,
                  right: 5,
                  top: 20,
                  height: 25.0,
                  width: 50.0,
                  child: EButton(
                    text: '삭제',
                    onPressed: (){},
                  ),
                ),

              ],
            )

          ],
        ),
      );
    }
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height/2,
      //width: 130.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 25,
            child: Text(widget.label),
          ),
          SizedBox(
              width: 350,
              height: MediaQuery.of(context).size.height/2.2,
              child: Align(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                      )
                  ),
                  controller: textEditingController,
                  readOnly: widget.onlyRead,
                  obscureText: widget.obscureText,
                  maxLength: 500000,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                ),
              )
          ),

        ],
      ),
    );
  }
}

class RoundBox4 extends StatefulWidget{
  //GestureTapCallback onTap;
  String str;
  String label;
  bool obscureText = true;
  bool onlyRead = true;
  TextEditingController? textEditingController;

  RoundBox4({
    Key? key,
    required this.str,
    required this.label,
    //required this.onTap,
    required this.obscureText,
    required this.onlyRead,
    required TextEditingController? textEditingController,
  }):this.textEditingController = textEditingController,super(key: key);

  @override
  State<RoundBox4> createState() {
    return _RoundBox4State();
  }

}

class _RoundBox4State extends State<RoundBox4>{
  TextEditingController? textEditingController;
  bool toggle = true;

  @override
  void initState(){
    super.initState();
    toggle = true;
    if(widget.textEditingController == null){
      print("what null");
      textEditingController = TextEditingController(text: widget.str);
    }
    else{
      textEditingController = widget.textEditingController;
      textEditingController!.text = widget.str;
    }
    //textEditingController = widget.textEditingController;
    //textEditingController!.text = widget.str;
  }

  @override
  void dispose(){

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapToggle,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 116.0,
        //width: 130.0,
        child: RBox(toggle: toggle),
      ),
    );
  }

  void onTapToggle(){
    setState(() {
      toggle = !toggle;
    });
  }

  Widget RBox({required bool toggle}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 25,
          child: Text(widget.label),
        ),
        SizedBox(
          width: 350,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(55),
                )
            ),
            controller: textEditingController!,
            readOnly: widget.onlyRead,
            obscureText: widget.obscureText,
            maxLength: 50,
          ),
        ),

      ],
    );

  }
}


class RoundBox5 extends StatefulWidget{
  //GestureTapCallback onTap;
  String str;
  String label;
  bool obscureText = true;
  bool onlyRead = true;
  TextEditingController? textEditingController;

  RoundBox5({
    Key? key,
    required this.str,
    required this.label,
    //required this.onTap,
    required this.obscureText,
    required this.onlyRead,
    required TextEditingController? textEditingController,
  }):this.textEditingController = textEditingController,super(key: key);

  @override
  State<RoundBox5> createState() {
    return _RoundBox5State();
  }

}

class _RoundBox5State extends State<RoundBox5>{
  TextEditingController? textEditingController;
  bool toggle = true;

  @override
  void initState(){
    super.initState();
    toggle = true;
    if(widget.textEditingController == null){
      textEditingController = TextEditingController(text: widget.str);
    }
    else{
      textEditingController = widget.textEditingController;
      textEditingController!.text = widget.str;
    }

  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},//onTapToggle,
      child: RBox(toggle: false),
    );
  }

  // void onTapToggle(){
  //   setState(() {
  //     toggle = !toggle;
  //   });
  // }

  Widget RBox({required bool toggle}){
    if(toggle){
      return Container(
        margin: EdgeInsets.all(5),
        height: 115.0,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 25,
              child: Text(widget.label),
            ),
            SizedBox(
              width: 350,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(55),
                    )
                ),
                controller: textEditingController,
                readOnly: widget.onlyRead,
                obscureText: widget.obscureText,
                maxLength: 50,
              ),
            ),

          ],
        ),
      );
    }
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height/2.2,
      //width: 130.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 25,
            child: Text(widget.label),
          ),
          SizedBox(
              width: 350,
              height: MediaQuery.of(context).size.height/2.5,
              child: Align(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                      )
                  ),
                  controller: textEditingController,
                  readOnly: widget.onlyRead,
                  obscureText: widget.obscureText,
                  maxLength: 500000,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                ),
              )
          ),

        ],
      ),
    );
  }
}