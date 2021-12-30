

#include <ESP8266WiFi.h>

#include <FirebaseArduino.h>


// Set these to run example. 
//FirebaseData firebaseData;
#define FIREBASE_HOST "wifi-lamp.firebaseio.com" 
#define FIREBASE_AUTH "bW1Z1DlLY6KrL36TRwsuMuunZ6PcL54RUourPSa6" 
#define WIFI_SSID "Adam_Vittis_Phone" 
#define WIFI_PASSWORD "helloadam" 
//#define WIFI_SSID "Vitti101" 
//#define WIFI_PASSWORD "8188428422" 

/*int flag1;
int potentiometerBrightness;

int flag2;
int phoneBrightness;
*/

void setup() { 
 Serial.begin(115200); 
 pinMode(LED_BUILTIN, OUTPUT);
 
 pinMode(D0, OUTPUT); //red
 pinMode(D1, OUTPUT); //blue
 pinMode(D2, OUTPUT); //green

 // connect to wifi. 
 WiFi.begin(WIFI_SSID, WIFI_PASSWORD); 
 Serial.print("connecting"); 

 while (WiFi.status() != WL_CONNECTED) { 
   Serial.print("."); 
   delay(500); 
 } 
 
 Serial.println(); 
 Serial.print("connected: "); 
 Serial.println(WiFi.localIP()); 


 
 Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH); 
 

 
} 



void loop(){

 //get RGB values
 int redValue = Firebase.getInt("redValue");
 int blueValue = Firebase.getInt("blueValue");
 int greenValue = Firebase.getInt("greenValue");

  //set LEDColor
    analogWrite(D0, redValue);
    analogWrite(D1, blueValue);
    analogWrite(D2, greenValue);
    
}

  
  //ANOTHER STATMENT ON PHONE SIDE THAT SETS flag1 = 0 and flag 2 = 1!!! To know phone input

  //Get/set potentiometer value
 /* if(Firebase.getInt("flag1") == 1){
  Firebase.setInt("LED1", potentiometerBrightness);
  Firebase.setInt("phoneBrightness", potentiometerBrightness);
  //if(Firebase.getInt("LED1")){
    //digitalWrite(LED_BUILTIN,HIGH);
    analogWrite(D0, potentiometerBrightness);
    
     Serial.println("Got PTBrightness STATUS:");
     Serial.println(Firebase.getInt("LED1"));
  } 
  */
  



    
