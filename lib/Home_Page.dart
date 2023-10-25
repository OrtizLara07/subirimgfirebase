import 'dart:io';

import 'package:flutter/material.dart';

import 'package:subirimgfirebase/services/select_image.dart';

class HomePage extends StatefulWidget{
  const HomePage({
   Key? key,
}): super(key:key);

  @override

  State<HomePage> createState() => HomePageState();



}
class HomePageState extends State<HomePage>  {

File? imagen_to_upload;



@override
Widget build(BuildContext context) {
return Scaffold(
     appBar: AppBar(

       title: const Text("Subir imagenes a Firebase"),
     ),

       body: ListView(
         children:[

        imagen_to_upload!=null ? Image.file(imagen_to_upload!) : Container(
             margin: const EdgeInsets.all(10),
             height: 200,
             width: double.infinity,
             color: Colors.pink

           ),



           ElevatedButton(
               onPressed: ()    async{

                 final imagen = await getImage();

                   setState(() {
                 imagen_to_upload = File(imagen!.path);
    });
    },
               child: const Text("seleccione la imagen")
           ),
           ElevatedButton(onPressed:(){},
               child: const Text("subir imagen")
           ),
         ],

         addAutomaticKeepAlives: false,
       ),


   );
  }
}

