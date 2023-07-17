/**
in aurdino uno , there is physical serial
which is 0 , 1 which you can access Directly through Serial class .

but sometimes we need to create our software serial port , so we will use :
**********
#include<SoftwareSerial.h>
const byte rxBlue = 11; // rx in bluetooth module .
const byte txBlue = 10; // tx in bluetooth module .
SoftwareSerial mySerial(txBlue, rxBlue); // Tx, Rx in bluetooth module .
**********
and inside setup we will use : 
**********
 // to make pin 11 is output in aurd , input in bluetooth mdoule
  pinMode(rxBlue, OUTPUT); // output in aurdino is input in bluetooth so we put rx with output
  pinMode(txBlue, INPUT);
**********
*/

#include<SoftwareSerial.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <Servo.h>

Servo servo_plastic;
Servo servo_cans;
  // create servo object to control a servo
// Serial3 Serial3(txCamera, rxCamera); // Tx, Rx in bluetooth module .
// const byte rxCamera = 39; // rx in bluetooth module .
// const byte txCamera = 38; // tx in bluetooth module .


// "Plastic" Ultrasonic sensor pins
const int trigPin_plasticUltra = 31;
const int echoPin_plasticUltra = 30;

// "Plastic" Ultrasonic sensor pins
const int trigPin_cansUltra = 33;
const int echoPin_cansUltra = 32;
// Define the detection distance (in centimeters)
const int detectionDistance = 25;

void setup() {
  // to make pin 11 is output in aurd , input in bluetooth mdoule
  // pinMode(rxCamera, OUTPUT); // output in aurdino is input in bluetooth so we put rx with output
  // pinMode(txCamera, INPUT);
  /**
  begin my software serial
  */
  Serial.begin(9600);
  // Camera bluetooth on Serial 3 .
  Serial3.begin(9600);
  // Screen Bluetooth on Serial 2.
  Serial2.begin(9600);
  // Set up the plastic_ultrasonic sensor pins
  pinMode(trigPin_plasticUltra, OUTPUT);
  pinMode(echoPin_plasticUltra, INPUT);

   // Set up the cans_ultrasonic sensor pins
  pinMode(trigPin_cansUltra, OUTPUT);
  pinMode(echoPin_cansUltra, INPUT);
  ////////// Servo init ///////////
  initServo();
  Serial3.println("Arduino here, command me!");
}

void initServo(){
// plastic servo motor in attached on digital pin -> 3 .
servo_plastic.attach(3);
// cans servo motor in attached on digital pin -> 4 .
servo_cans.attach(4);
servo_plastic.write(10);
servo_cans.write(10);
}

String message="";

void open_plastic_hole() {
  // Open the plastic servo
  servo_plastic.write(90);
  int temp = 0;
  bool objectDetected = false;
  while (temp <=600) {
    // Measure the distance to the nearest object
    int distance = getDistance_plastic();
    // Check if plastic ultrasonic detect something, then open the motor
    // and send the signal to the tablet.
      // Serial.println("current Distance : ");
      // Serial.println(distance);
      Serial.println("Temp : ");
      Serial.println(temp);
      if(distance <= detectionDistance){
        delay(500);
        objectDetected=true;
        break;
      }else{
      delay(100);
      temp += 10;
      }
  }
  if(objectDetected == true){
 // send signal to tablet.
  Serial2.println(message);
  servo_plastic.write(0); // 90 degrees (or any other angle you prefer)
  }else{
     servo_plastic.write(0); // 90 degrees (or any other angle you prefer)
  }
 
}

void open_cans_hole(){
 // Open the cans servo
  servo_cans.write(90);
  int temp = 0;
  bool objectDetected = false;
  while (temp <=600) {
    // Measure the distance to the nearest object
    int distance = getDistance_cans();
    // Check if plastic ultrasonic detect something, then open the motor
    // and send the signal to the tablet.
      // Serial.println("current Distance : ");
      // Serial.println(distance);
      Serial.println("Temp : ");
      Serial.println(temp);
      if(distance <= detectionDistance){
        delay(500);
        objectDetected=true;
        break;
      }else{
      delay(100);
      temp += 10;
      }
  }
  if(objectDetected == true){
 // send signal to tablet.
  Serial2.println(message);
  servo_cans.write(0); // 90 degrees (or any other angle you prefer)
  }else{
     servo_cans.write(0); // 90 degrees (or any other angle you prefer)
  }
}

// this method is used to get data in message and analyze it .
void split_coming_message(char* message, int* numTokens) {
  char** tokens = NULL;
  char* token = strtok(message, ",");
  int count = 0;
  while (token != NULL) {
    tokens = realloc(tokens, sizeof(char*) * (count + 1));
    tokens[count] = token;
    count++;
    token = strtok(NULL, ",");
  }
  *numTokens = count;
  /**
  *********************************
  *********************************
    * tokens is char[] that hold all variables that sent in message .
    ********************************
    ********************************
      atoi(tokens[0]) can be 1 / 2 
      1 mean this message sent to tablet .
      2 mean this message sent to camera .
      ********************************
    ********************************
    atoi(tokens[1]) can be only 1 :
    this mean camera detect plastic and open plastic hole .
      ********************************
    ********************************
    atoi(tokens[2]) can be only 1 :
    this mean camera detect cans and open cans hole .
  */
  int destination_device =atoi(tokens[0]);
  for(int i=0;i<3;i++){
    Serial3.println(tokens[i]);
  }
  // check the destination of the message .
  if(destination_device == 1) Serial3.println("Message Sent to tablet");
  else if(destination_device ==2) Serial3.println("Message Sent to Camera");

  // if signal coming plastic and cans together , then open both holes :
   if(atoi(tokens[1])==1&&atoi(tokens[2])==1){
    Serial3.println("Open both plastic and cans hole");
    open_plastic_hole();
    open_cans_hole();
     // i make it here wait for 1 second for lower power consumbtion .
   // to not make arduino items power off and need to connect again .
    // delay(1000);
  }
  // check plastic and cans signal to open or close .
  else if(atoi(tokens[1])==1){
    Serial3.println("Open plastic hole");
    open_plastic_hole();
     // i make it here wait for 1 second for lower power consumbtion .
   // to not make arduino items power off and need to connect again .
    // delay(1000);
  }
  else if(atoi(tokens[2])==1){
    Serial3.println("open Cans hole");
    open_cans_hole();
   // i make it here wait for 1 second for lower power consumbtion .
   // to not make arduino items power off and need to connect again .
    // delay(1000);
  }
}

void loop() { 
 while(Serial3.available()>0){  
   char message_in_char_array[25];
   char data = (char) Serial3.read();
   message +=data;
   if(data=='\n'){
     for(int i =1;i<message.length()-1;i++){
       // to remove first double quotes from the message "1,0,1";
       message_in_char_array[i-1]=message.charAt(i);
     }
     split_coming_message(message_in_char_array,0);
     message="";
   }
 }
}

int getDistance_plastic() {
  digitalWrite(trigPin_plasticUltra, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin_plasticUltra, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin_plasticUltra, LOW);
  long duration = pulseIn(echoPin_plasticUltra, HIGH);
  int distance = duration * 0.0344 / 2;
  return distance;
}

int getDistance_cans() {
  digitalWrite(trigPin_cansUltra, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin_cansUltra, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin_cansUltra, LOW);
  long duration = pulseIn(echoPin_cansUltra, HIGH);
  int distance = duration * 0.0344 / 2;
  return distance;
}