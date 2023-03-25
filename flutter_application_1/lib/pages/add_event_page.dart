import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPages extends StatefulWidget {
  const AddEventPages({super.key});

  @override
  State<AddEventPages> createState() => _AddEventPagesState();
}

class _AddEventPagesState extends State<AddEventPages> {
  final _formKey = GlobalKey<FormState>();
  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedConfType = 'talk';
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {

    confNameController.dispose();
    speakerNameController.dispose(); 
  
  }
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nom conférence',
                    hintText: 'Entrer le nom ',
                    border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if ( value == null || value.isEmpty){
                      return "Tu dois complèté ce texte ";
                    }
                    return null;
                  },
                  controller: confNameController,
                ),
            ),
             Container(
              margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nom du speaker',
                    hintText: 'Entrer le nom du speaker',
                    border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if ( value == null || value.isEmpty){
                      return "Tu dois complèté ce texte ";
                    }
                    return null;
                  },
                  controller: speakerNameController,
                ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: 
                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(value: 'talk', child: Text("Talk show")),
                    DropdownMenuItem(value: 'demo', child: Text("Demo code")),
                    DropdownMenuItem(value: 'partner', child: Text("Partner"))
                  ],

                  decoration: InputDecoration(
                    border: OutlineInputBorder()
                  ),
                  value: selectedConfType,
                  onChanged: (value){
                    setState(() {
                      selectedConfType = value!;
                    });
                  }
                  ),
              
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: 
                DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Choisir une date ',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  setState(() {
                    selectedConfDate = value;
                  });
                },
          ),
              
            ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()){

                        final confName = confNameController.text;
                        final speakerName =  speakerNameController.text;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Envoi en cours..."))
                        );
                        //Pour faire partir le clavier après envoi de form
                        FocusScope.of(context).requestFocus(FocusNode());
                        print("Ajout de la conf $confName par le speaker $speakerName Type de condérence $selectedConfType à la date $selectedConfDate");
                      }
                    },
                    child: Text("Envoyer") 
                    ),
                )
             
            
          ],
        ) ),
    );
  }
}