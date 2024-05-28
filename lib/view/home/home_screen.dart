import 'package:auth_app_user/controller/auth.dart';
import 'package:auth_app_user/controller/user_db_helper.dart';
import 'package:auth_app_user/model/user_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
 final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

@override
  void initState() {
    User().getUsersFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        leading: IconButton(icon:const Icon(Icons.logout),onPressed: (){
         Auth().signOut();
        },),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              width: 500,
           child: 
           userList.isEmpty?const Text('dddddd'):
          
           ListView.builder(
            itemCount:userList.length,
            itemBuilder: (context, index) {
               UserModel user = userList[index];
               return  Card(
                 child: ListTile(
                   title: Text(user.name!),
                   subtitle: Text(user.phone!),
                   trailing: IconButton(onPressed: (){
                     User().deleteUserFromDB(user.id!);
                     }, icon: const Icon(Icons.delete),)
                     ),
               );
            } ,
            ),
            ),
            FloatingActionButton(onPressed: (){
              showDialog(context: context, builder:(context) => AlertDialog(
                title: const Text('Add User'),
                content: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter User Name',
                        border: OutlineInputBorder()
                        ),
                        ),
                        TextField(
                          controller: phoneController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Phone',
                                border: OutlineInputBorder()),
                          ),
                          ElevatedButton(onPressed: ()async{
                           await User().addUserToDB(nameController.text, phoneController.text.toString());
                            setState(() {
                              nameController.clear();
                              phoneController.clear();
                              User().getUsersFromDB();
                            });
                            
                          }, child:const Text('submit'))
                  ],
                ),
              ),);
            },
            child: const Icon(Icons.add),)
          ],
        ),
      )

    );
  }
}