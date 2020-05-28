

import 'package:flutter/material.dart';
import 'package:search_india/mpage.dart';

import '../main_page.dart';
var andhra=[
  "All in Andhra Pradesh",
  "Ananthapur",
  "Chitoor",
  "Cuddapah",
  "East Godavari",
  "Guntur",
  "Krishna",
  "Kurnool",
  "Nellore",
  "Prakasham",
  "Srikalulam",
  "Vishakapatnam",
  "Vizianagaram District",
  "West Godavari"
];
var arunanchal=[
  "All in Arunanchal Pradesh",
  "Anjaw",
  "Changlang",
  "Dibang Valley",
  "East Kameng",
  "East Siang",
  "Kurung Kumey",
  "Lohit District",
  "Lower Dibang Valley",
  "Lower Subansiri",
  "Papem pare",
  "Tawang",
  "Tirap",
  "Upper Siang",
  "Upper Subansiri",
  "West Kameng",
  "West Siang"
];
var assam=[
  "All in Assam",
  "Baksa",
  "Barpeta",
  "Bongaigon",
  "Cachar",
  "Chirang",
  "Darrang",
  "Dhemaji",
  "Dhubri",
  "Dibrugarh",
  "Dima Hasao District",
  "Goalpara",
  "Golaghat",
  "Hailakandi",
  "Jorhat",
  "Kamrup",
  "Kamrup Metropolitan",
  "Karbi Anglong",
  "Karimganj",
  "Kokrajhar",
  "Lakhimpur",
  "Morigaon",
  "Nagaon",
  "Nalbari",
  "Sibsagar",
  "Sonitpur",
  "Tinsuka",
  "Udalguri"
];
var andaman=[
  "All in Andaman and Nicobar"
  "Nicobar",
  "North & Middle Andaman",
  "South Andaman"
];
var bihar=[
  "All in Bihar",
  "Araria",
  "Madhepura",

  "Arwal",
  "Madhubani"

  "Aurangabad",
  "Monghyr",

  "Banka",
  "Muzaffarpur",

  "Begusarai",
  "Nalanda",

  "Bhagalpur",
  "Nawada",

  "Bhojpur",
  "Patna",

  "Buxar",
  "Purnea",

  "Darbhanga",
  "Rohtas",

 " East Champaran",
  "Saharsa",

  "Gaya",
  "Samastipur",

  "Gopalganj",
  "Saran",

  "Jamui",
  "Shiekhpura",

  "Jehanabad",
  "Sheohar",

  "Kaimur",
  "Sitamarhi",

  "Katihar",
  "Siwan",

  "Khagaria",
  "Supaul",

  "Kishanganj",
  "Vaishali",

  "Lakhisarai",
 " West Champaran",
];
var chandigarh=[
  "All in Chandigarh",
  "Chandigarh",
];

var chhattisgarh=[
  "All in Chhattisgarh",
   "Baloda Bazar",
  "Balrampur",
  "Bastar" ,
  "Bemetara",
  "Bijapur",
  "Bilaspur",
  "Dantewada",
  "Dhamtari",
  " Durg",
  "Gariyaband ",
  "Janjgir-champa ",
 "Jashpur",
  "Kabirdham ",
  "Kanker",
  "Kondagaon",
  "Korba",
  "Koriya",
  "Mahasamund",
  "Mungeli",
  "Narayanpur",
  "Raigarh",
  "Raipur",
  "Rajnandgaon",
  "Sukma ",
  "Surajpur ",
  "Surguja",
];
var dnnh=[
  "All in Dadra and Nagar Haveli",
"Dadra and Nagar Haveli"

];
var dnd=[
  "All in Daman and Diu",
  "Daman District",
  "Diu",
];
var goa=[
  "All in Goa",
  "North Goa",
  "South Goa",
];

var gujarat=[
  "All in Gujarat",
  "Ahmedabad",
  "Amreli",
  "Anand",
  "Aravalli",
  "Banaskantha",
  "Bharuch",
  "Bhavnagar",

  "Botad",
  "Chhotaudepur",
  "Dahod",
  "Devbhumi Dwarka",
  "Gandhinagar",
  "Gir Somnath",
  "Jamnagar",
  "Junagadh",
  "Kachchh",
  "Kheda",
  "Mahesana",
  "Mahisagar",
  "Morbi",
  "Narmada",
  "Navsari",
  "Panchmahals",
  'Patan',
  "Porbandar",
  "Rajkot",
  "Sabarkantha",
  "Surat",
  "Surendra Nagar",
  "Tapi",
  "The Dangs",
  "Vadodara",
  "Valsad",

];

var haryana=[
  "All in Haryana",
  "Ambala",
  "Bhiwani",
  "Faridabad",
  "Fatehabad",
  "Gurgaon",
  "Hisar",
  "Jhajjar",
  "Jind",
  "Kaithal",
  "Karnal",
  "Kurukshetra",
  "Mahendragarh",
  "Mewat",
  "Palwal",
  "Panchkula",
  "Panipat",
  "Rewari",
  "Rohtak",
  "Sirsa",
  "Sonipat",
  "Yamuna Nagar",

];

var himachal=[
  "All in Himachal Pradesh",
  "Bilaspur",
  "Chamba",
  "Hamirpur",
  "Kangra",
  "Kullu",
  "Mandi",
  "Shimla",
  "Sirmaur",
  "Solan",
  "Una",

];
 var jnk=[
   "All in Jammu and Kashmir",
   "Anantnag",
   "Badgam",
   "Bandipore",
   "Baramula",
   "Doda",
   "Ganderbal",
   "Jammu",
   "Kargil",
   "Kathua",
   "Kishtwar",
   "Kulgam",
   "Kupwara",
   "Leh",
   "Pulwama",
   "Punch",
   "Rajouri",
   "Ramban",
   "Reasi",
   "Samba",
   "Shupiyan",
   "Srinagar",
   "Udhampur",

 ];

 var jharkand=[
   "All in Jharkhand",
   "Bokaro",
   "Chatra",
   "Deoghar",
   "Dhanbad",
   "Dumka",
   "East Singhbhum",
   "Garhwa",
   "Giridih",
   "Godda",
   "Gumla",
   "Hazaribagh",
   "Jamtara",
   "Khunti",
   "Koderma",
   "Latehar",
   "Lohardaga",
   "Pakur",
   "Palamu",
   "Ramgarh",
   "Ranchi",
   "Sahebganj",
   "Seraikela-Kharsawan",
   "Simdega",
   "West Singhbhum",

 ];

 var karnataka=[
   "All in Karnataka",
   "Bagalkot",
   "Bangalore",
   "Bangalore Rural",
   "Belgaum",
   "Bellary",
   "Bidar",
   "Bijapur",
   "Chamrajanagar",
   "Chickmagalur",
   "Chikkaballapur",
   "Chitradurga",
   "Dakshina Kannada",
   "Davangere",
   "Dharwad",
   "Gadag",
   "Gulbarga",
   "Hassan",
   "Haveri",
   "Kodagu",
   "Kolar",
   "Koppal",
   "Mandya",
   "Raichur",
   "Ramanagar",
   "Shimoga",
   "Udupi",
   "Uttara_Kannada",
   "Yadgir",
 ];

 var kerala=[
   "All in Kerala",
   "Alappuzha",
   "Ernakulam",
   "Idukki",
   "Kannur",
   "Kasaragod",
   "Kollam",
   "Kottayam",
   "Kozhikode",
   "Malappuram",
   "Palakkad",
   "Pathanamthitta",
   "Thiruvananthapuram",
   "Thrissur",
   "Wayanad",

 ];

 var laccadives=[
   "All in Laccadives",
   "Lakshadweep",
 ];

 var mp=[
   "All in Madhaya Pradesh",
   "Agar",
   "Alirajpur",
   "Anuppur",
   "Ashok_Nagar",
   "Balaghat",
   "Barwani",
   "Betul",
   "Bhind",
   "Bhopal",
   "Chhatarpur",
   "Chhindwara",
   "Damoh",
   "Datia",
   "Dewas",
   "Dhar",
   "Dindori",
   "Guna",
   "Gwalior",
   "Indore",
   "Jabalpur",
   "Jhabua",
   "Katni",
   "Khargone",
   "Mandla",
   "Mandsaur",
   "Morena",
   "Narsinghpur",
   "Neemuch",
   "Panna",
   "Raisen",
   "Rajgarh",
   "Ratlam",
   "Rewa",
   "Sagar",
   "Satna",
   "Sehore",
   "Seoni",
   "Shahdol",
   "Shajapur",
   "Sheopur",
   "Shivpuri",
   "Sidhi",
   "Singrauli",
   "Tikamgarh",
   "Ujjain",
   "Umaria",
   "Vidisha",

 ];
  var maha=[
    "All in Maharastra",
    "Ahmadnagar",
    "Akola",
    "Aurangabad(MH)",
    "Beed",
    "Bhandara",
    "Buldhana",
    "Chandrapur",
    "Dhule",
    "Gadchiroli",
    "Gondiya",
    "Hingoli",
    "Jalgaon",
    "Jalna",
    "Kolhapur",
    "Latur",
    "Mumbai",
    "Mumbai Suburban",
    "Nagpur",
    "Nanded",
    "Nandurbar",
    "Nashik",
    "Osmanabad",
    "Palghar",
    "Parbhani",
    "Pune",
    "Raigarh(MH)",
    "Ratnagiri",
    "Sangli",
    "Satara",
    "Sindhudurg",
    "Solapur",
    "Thane",
    "Washim",
    "Yavatmal",

  ];
 var manipur=[
   "All in Manipur",
   "Bishnupur",
   "Chandel",
   "Churachandpur",
   "Imphal East",
   "Imphal West",
   "Senapati",
   "Tamenglong",
   "Thoubal",
   "Ukhrul",
 ];

 var meghalaya=[
   "East Jaintia Hills",
   "East Garo Hills",
   "East Khasi Hills",
   "North Garo Hills",
   "Ri Bhoi",
   "South West garo Hills",
   "South West Khasi Hills",
   "South Garo Hills",
   "West Jaintia Hills",
   "West Garo Hills",
   "West Khasi Hills",

 ];

 var mizoram=[
   "All in Mizoram",
   "Aizawl",
   "Champhai",
   "Kolasib",
   "Lawngtlai",
   "Lunglei",
   "Mammit",
   "Saiha",
   "Serchhip",
 ];

 var nagaland=[
   "All in Nagaland",
   "Dimapur",
   "Kiphire",
   "Kohima",
   "Longleng",
   "Mokokchung",
   "Mon",
   "Peren",
   "Phek",
   "Tuensang",
   "Wokha",
   "Zunheboto",
 ];

 var nct=[
   "All in NCT",
   "Central Delhi",
   "East Delhi",
   "New Delhi",
   "North Delhi",
   "North East Delhi",
   "North West Delhi",
   "South Delhi",
   "South West Delhi",
   "West Delhi"
 ];

 var odisha=[
   "All in Odisha",
   "Angulbo",
   "Balangir",
   "Baleswar",
   "Bargarh",
   "Bhadrak",
   "Boudh",
   "Cuttack",
   "Debagarh",
   "Dhenkanal",
   "Gajapati",
   "Ganjam",
   "Jagatsinghapur",
   "Jajapur",
   "Jharsuguda",
   "Kalahandi",
   "Kandhamal",
   "Kendrapara",
   "Kendujhar",
   "Khorda",
   "Koraput",
   "Malkangiri",
   "Mayurbhanj",
   "Nabarangapur",
   "Nayagarh",
   "Nuapada",
   "Puri",
   "Rayagada",
   "Sambalpur",
   "Sonapur",
   "Sundergarh",
 ];

 var pondi=[
   "All in Puducherry",
   "Karaikal",
   "Mahe",
   "Puducherry",
   "Yanam",
 ];

 var punjab=[
   "All in Pubjab",
   "Ajit Garh",
   "Amritsar",
   "Bathinda",
   "Fazilka",
   "Barnala",
   "Faridkot",
   "Fatehgarh_Sahib",
   "Jalandhar",
   "Ludhiana",
   "Nawanshahr",

   "Ferozepur",
   "Gurdaspur",
   "Hoshiarpur",
   "Kapurthala",
   "Mansa",
   "Moga",
   "Pathankot",
   "Patiala",
   "Rupnagar",
   "Sangrur",
   "Sri Muktsar Sahib",
   "Tarn Taran",
 ];

 var raj=[
   "All in Rajasthan",
   "Ajmer",
   "Alwar",
   "Banswara",
   "Baran",
   "Barmer",
   "Bharatpur",
   "Bhilwara",
   "Bikaner",
   "Bundi",
   "Chittorgarh",
   "Churu",
   "Dausa",
   "Dholpur",
   "Dungarpur",
   "Ganganagar",
   "Hanumangarh",
   "Jaipur",
   "Jaisalmer",
   "Jalor",
   "Jhalawar",
   "Jhunjhunun",
   "Jodhpur",
   "Karauli",
   "Kota",
   "Nagaur",
   "Pali",


   "Pratapgarh",
   "Rajsamand",
   "Sawai_Madhopur",
 "Sirohi",
   "Tonk",
   "Udaipur",
 ];

 var sikkim=[
   "All in Sikkim",
   "East Sikkim",
   "North Sikkim",
   "South Sikkim",
 ];

 var tn=[
   "All in Tamil Nadu"
   "Ariyalur",
   "Chennai",
   "Coimbatore",
   "Cuddalore",
   "Dharmapuri",
   "Dindigul",
   "Erode",
   "Kancheepuram",
   "Kanyakumari",
   "Karur",
   "Krishnagiri",
   "Madurai",
   "Nagapattinam",
   "Namakkal",
   "Nilgiris",
   "Perambalur",
   "Pudukkottai",
   "Ramanathapuram",
   "Salem",
   "Sivaganga",
   "Thanjavur",
   "Theni",
   "Thiruvarur",
   "Thoothukkudi",
   "Tiruchirappalli",
   "Tirunelveli",
   "Tirupur",
   "Tiruvallur",
   "Tiruvannamalai",
   "Vellore",
   "Villupuram",
   "Virudhunagar",
 ];

 var tg=[
   "All in Telangana",
   "Adilabad",
   "Hyderabad",
   "Rangareddy",
   "Karimnagar",
   "Khammam",
   "Mahbubnagar",
   "Medak",
   "Nalgonda",
   "Nizamabad",
   "Warangal",
 ];

 var tripura=[
"All in Tripura",
   "Dhalai",
   "Gomati",
   "Khowai",
   "North Tripura",
   "Sepahijala",
   "South Tripura",
   "Unakoti",
   "West Tripura",

 ];
 var up=[
   "All in Uttar Pradesh",
   "Agra",
   "Aligarh",
   "Allahabad",
   "Ambedkar Nagar",
   "Amethi"
   "Amroha",
   "Auraiya",
   "Azamgarh",
   "Baghpat",
   "Bahraich",
   "Ballia",
   "Balrampur(UP) ",
   "Banda",
   "Bara Banki",
   "Bareilly",
   "Basti",
   "Bijnor",
   "Budaun",
   "Bulandshahr",
   "Chandauli",
   "Chitrakoot",
   "Deoria",
   "Etah",
   "Etawah",
   "Faizabad",
   "Farrukhabad",
   "Fatehpur",
   "Firozabad",
   "Gautam Buddha Nagar",
   "Ghaziabad",
   "Ghazipur",
   "Gonda",
   "Gorakhpur",
   "Hamirpur(UP)",
   "Hapur",
   "Hardoi",
   "Hathras",
   "Jalaun",
   "Jaunpur",
   "Jhansi",
   "Kannauj",
   "Kanpur Dehat",
   "Kanpur Nagar",
   "Kashiram Nagar",
"   Kaushambi",
   "Kushinagar",
   "Lakhimpur Kheri",
   "Lalitpur",
   "Lucknow",
   "Maharajganj",
   "Mahoba",
   "Mainpuri",
   "Mathura",
   "Mau",
   "Meerut",
   "Mirzapur",
   "Moradabad",
   "Muzaffarnagar",
   "Pilibhit",
   'Pratapgarh(UP)',
   'Rae_Bareli',
   'Rampur',
   'Saharanpur',
   'Sambhal',
   'Sant Kabir Nagar',
   'Sant Ravidas Nagar',
   'Shahjahanpur',
   'Shamli',
   'Shrawasti',
   'Siddharthnagar',
   'Sitapur',
   'Sonbhadra',
   'Sultanpur',
   'Unnao',
   'Varanasi',
 ];

 var uttharkand=[
   "All in Uttarkhand",
   'Almora',
   'Bageshwar',
   'Chamoli',
   'Champawat',
   'Dehradun',
   'Haridwar',
   'Nainital',
   'Pauri_Garhwal',
   'Pithoragarh',
   'Rudraprayag',
   'Tehri_Garhwal',
   'Udham_Singh_Nagar',
   'Uttarkashi',

 ];
 var wb=[
   "All in West Bengal",
   "Alipurduar",
   "Bankura",
   "Barddhaman",
   "Birbhum",
   'Cooch_Behar',
   'Dakshin_Dinajpur',
   'Darjeeling',
   'Hooghly',
   "Howrah",
   "Jalpaiguri",
   "Kolkata",
   "Malda",
   "Murshidabad",
   "Nadia",
   "North_24_Parganas",
   "Paschim_Medinipur",
   "Purba_Medinipur",
   "Puruliya",
   "South 24 Parganas",
   "Uttar Dinajpur",

 ];
var select=[
  andaman,andhra,arunanchal,assam,bihar,chandigarh,chhattisgarh,dnnh,dnd,goa,gujarat,haryana,himachal,jnk,jharkand,karnataka,kerala,
  laccadives,mp,maha,manipur,meghalaya,mizoram,nagaland,nct,odisha,pondi,punjab,raj,sikkim,tn,tg,tripura,
  up,uttharkand,wb,
];

List<List<String>> selection;

getCityList(){
  List<String> citylist=[];
  for(int i=0;i<select.length;i++){
     List<String> temp=select[i];
     for(int j=0;j<temp.length;j++){
       citylist.add(temp[j]);
     }
  }
  return citylist;
}


class SelectDistrict extends StatefulWidget {
  final int selectedState;

  SelectDistrict(this.selectedState);
  @override
  _SelectDistrictState createState() => _SelectDistrictState();
}

class _SelectDistrictState extends State<SelectDistrict> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select District"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: select[widget.selectedState].length,
                itemBuilder: (_,int index){
                  var text=select[widget.selectedState];
                  return Column(
                    children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            currentLocation=text[index];
                            addressSet=true;
                          });
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MainPage()), (route) => false);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(text[index]),
                            Icon(Icons.done),
                          ],
                        ),
                      ),
                    ),
                      Divider()
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}




