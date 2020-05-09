import 'package:flutter/material.dart';
import 'package:search_india/mpage.dart';
import 'package:search_india/selectLocation/selectDistrict.dart';

import '../main_page.dart';

var america = [
  "All in America",
  "Alabama",
  "Alaska",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming",
];
var indiaList = [
  "Andaman and Nicobar",
  "Andhra Pradesh",
  "Arunachal Pradesh",
  "Assam",
  "Bihar",
  "Chandigarh",
  "Chhattisgarh",
  "Dadra and Nagar Haveli",
  "Daman and Diu",
  "Goa",
  "Gujarat",
  "Haryana",
  "Himachal Pradesh",
  "Jammu and Kashmir",
  "Jharkhand",
  "Karnataka",
  "Kerala",
  "Laccadives",
  "Madhya Pradesh",
  "Maharashtra",
  "Manipur",
  "Meghalaya",
  "Mizoram",
  "Nagaland",
  "NCT",
  "Odisha",
  "Puducherry",
  "Punjab",

  "Rajasthan",
  "Sikkim",
  "Tamil Nadu",
  "Telangana",
  "Tripura",
  "Uttar Pradesh",
  "Uttarakhand",
  "West Bengal",

];

var brazil=[
  "All in Brazil",
"Acre",
"Alagoas",
"Amazonas",
"Amapá",
"Bahia",
"Ceará",
"Distrito Federal",
"Espírito Santo",
"Goiás",
"Maranhão",
"Minas Gerais",
"Mato Grosso do Sul",
"Mato Grosso",
"Pará",
"Paraíba",
 "Pernambuco",
"Piauí",
 "Paraná",
"Rio de Janeiro",
"Rio Grande do Norte",
"Rondônia",
"Roraima",
"Rio Grande do Sul",
"Santa Catarina",
"Sergipe",
"São Paulo",
"Tocantins",
];

var canada=[
  "All in Canada",
"Alberta", "British Columbia", "Manitoba", "New Brunswick", "Newfoundland and Labrador"," Nova Scotia"," Ontario", "Prince Edward Island"," Quebec","Saskatchewan",
];
var uae=[
  "All in UAE",
  "Abu Dhabi",
  "Dubai",
  "Sharjah",
  "Umm al Khaimah",
  "Ajman",
  "Ras Al Khaimah",
  "Fujairah",
];
var england=[
"Bedfordshire",
"Berkshire",
    "Buckinghamshire",
    "Cambridgeshire",
    "Cheshire",
    "Cornwall",
    "Cumbria",
"Derbyshire",
"Devon",
"Dorset",
"Durham",
"East Riding",
"East Sussex",
"East Yorkshire"
"Essex",

"Gloucestershire",
"Greater London",
 "Hampshire",
    "Hertfordshire",
    "Huntingdonshire",
    "Kent",
    "Lancashire",
    "Leicestershire",
    "Lincolnshire",
    "Merseyside",
"Middlesex",
"Norfolk",
"Northamptonshire",
"Northumberland",
"Nottinghamshire",
"Oxfordshire",
"Rutland",
"Shropshire",
"Somerset",
"South Yorkshire",
    "Staffordshire",
    "Suffolk",
    "Surrey",
    "Tyne and Wear",
"Warwickshire",
"Westmorland",
"Wiltshire",
"Worcestershire",
"West Sussex",
"West Yorkshire",
];

var france=[
  "Auvergne - Rhône-Alpes",
  "Bretagne (Brittany)",
  "Bourgogne - Franche-Comté",
  "Corse (Corsica)",
  "Centre - Val de Loire",
  "Grand Est ",
  "Hauts de France ",
  "Ile de France (Paris)",
  "Nouvelle Aquitaine ",
  "Normandie",
  "Occitanie",
  "Pays de la Loire",
  "Provence - Cote d'Azur",
];
var germany=[
  "Baden-Württemberg","Bavaria","Berlin",	"Brandenburg",
  "Bremen","Hamburg","Hesse","Lower Saxony",
 "Mecklenburg-Western Pomerania"," North Rhine-Westphalia","Rhineland-Palatinate"	,"Saarland",
  " Saxony","Saxony-Anhalt","Schleswig-Holstein","Thuringia",
];
var selectcountry=[
  america,brazil,canada,uae,england,france,germany,indiaList
];


class SelectState extends StatefulWidget {
  final int selectedCountry;

  SelectState(this.selectedCountry);

  @override
  _SelectStateState createState() => _SelectStateState();
}

class _SelectStateState extends State<SelectState> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select State"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              ListView.builder(

                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: selectcountry[widget.selectedCountry].length,
                  itemBuilder: (_, int index) {
                    var item=selectcountry[widget.selectedCountry];
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: InkWell(
                            onTap: () {
                              if(widget.selectedCountry==7) {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectDistrict(index)
                                ));
                              }
                               else{
                              setState(() {
                                currentLocation=item[index];
                                addressSet=true;
                              });
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MainPage()), (route) => false);
                               }
                               },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(item[index]),
                                Icon(Icons.navigate_next)
                              ],
                            ),
                          ),
                        ),
                        Divider()
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
