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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: IconButton(icon:Icon(Icons.logout),onPressed: (){
         Auth().signOut();
        },),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              width: 500,
           child: ListView.builder(
            itemCount: User().userList.length,
            itemBuilder: (context, index) {
               UserModel user = User().userList[index];
               print(user.name);
               return Card(
                color: Colors.red,
                child: ListTile(
                  title: Text(user.name!),
                  subtitle: Text(user.phone!),
                  // trailing: IconButton(onPressed: (){
                  //   User().deleteUser(user.id);
                  //   }, icon: Icon(Icons.delete),)
                    ));
            } ,
            ),
            ),
            FloatingActionButton(onPressed: (){
              showDialog(context: context, builder:(context) => AlertDialog(
                title: Text('Add User'),
                content: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter User Name',
                        border: OutlineInputBorder()
                        ),
                        onChanged: (value) => print(value),
                        ),
                        TextField(
                          controller: phoneController,
                            decoration: InputDecoration(
                                hintText: 'Enter Phone',
                                border: OutlineInputBorder()),
                            onChanged: (value) => print(value),
                          ),
                          ElevatedButton(onPressed: (){
                            User().addUserToDB(nameController.text, phoneController.text.toString());
                          }, child:Text('submit'))
                  ],
                ),
              ),);
            },
            child: Icon(Icons.add),)
          ],
        ),
      )

    );
  }
}