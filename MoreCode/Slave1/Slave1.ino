/*
this is the source code for the slave module of Star Track
Required Libraries:
http://www.airspayce.com/mikem/arduino/AccelStepper/AccelStepper-1.51.zip
Created 20 July 2016 by Görkem Bozkurt
 */
#include <AccelStepper.h>
#define HALFSTEP 8
#include <Wire.h>
// Motor pin definitions
#define motorPin1  2     // IN1 on the ULN2003 driver 1
#define motorPin2  3     // IN2 on the ULN2003 driver 1
#define motorPin3  4     // IN3 on the ULN2003 driver 1
#define motorPin4  5     // IN4 on the ULN2003 driver 1


#define motorPin5  A0     // IN1 on the ULN2003 driver 1
#define motorPin6  A1     // IN2 on the ULN2003 driver 1
#define motorPin7  A2     // IN3 on the ULN2003 driver 1
#define motorPin8  A3     // IN4 on the ULN2003 driver 1
// Initialize with pin sequence IN1-IN3-IN2-IN4 for using the AccelStepper with 28BYJ-48
AccelStepper stepper1(HALFSTEP, motorPin1, motorPin3, motorPin2, motorPin4);
AccelStepper stepper2(HALFSTEP, motorPin5, motorPin7, motorPin6, motorPin8);


int stahp = 7,stahp2=10;
int cw = 6,cw2 = 11;
int ccw = 8,ccw2=9;
int ca = 12; //calibrate


boolean stopped = false;
boolean stopped2 = false;
void setup() {
    stepper1.setMaxSpeed(1000.0);
    stepper2.setMaxSpeed(1000.0);
    pinMode(stahp2,INPUT);
    pinMode(cw2,INPUT);
    pinMode(ccw2,INPUT);
    pinMode(stahp,INPUT);
    pinMode(cw,INPUT);
    pinMode(ccw,INPUT);
    pinMode(ca, OUTPUT); //calibrate
}//--(end setup )---
void loop()
{
    motor_pitch();
    motor_roll();

    if(stopped==false){
        stepper1.run();
    }
    if(stopped2==false){
        stepper2.run();
    }
    String command = "";

    char data [21];
    int number_of_bytes_received;
    
    if(Serial.available() > 0)
    {
        number_of_bytes_received = Serial.readBytesUntil ('\n',data,20); // read bytes (max. 20) from buffer, untill <CR> (13). store bytes in data. count the bytes recieved.
        data[number_of_bytes_received] = 0; // add a 0 terminator to the char array
        command=data;
        //Serial.println(command);
    }

    if(command == "MANUAL")
    {
      boolean done = false;
      while(done == false)
      {
        Serial.println("MANUAL MODE");
        String command2 = "";

        char data2 [21];
        int number_of_bytes_received2;
        
        if(Serial.available() > 0)
        {
            number_of_bytes_received2 = Serial.readBytesUntil ('\n',data2,20); // read bytes (max. 20) from buffer, untill <CR> (13). store bytes in data. count the bytes recieved.
            data2[number_of_bytes_received2] = 0; // add a 0 terminator to the char array
            command2=data;
            if(command2 == "CALIBRATE")
            {
              digitalWrite(ca, HIGH);
              delay(100);
              digitalWrite(ca, LOW);
            }
            if(command2 == "UP")
            {
              
            }
            if(command2 == "DOWN")
            {
              
            }
            if(command2 == "RIGHT")
            {
              
            }
            if(command2 == "LEFT")
            {
              
            }
             
            //Serial.println(command);
        }
        
      }
    }
}
void motor_roll(){
    if(digitalRead(stahp)==HIGH){
        stopped = true;
    }else{ if(digitalRead(cw)==HIGH){
            stepper1.setSpeed(100);
            stopped = false;
        }
        if(digitalRead(ccw)==HIGH){
            stepper1.setSpeed(-100);
            stopped = false;
        }
    }
}

void motor_pitch(){
    if(digitalRead(stahp2)==HIGH){
        stopped2 = true;
    }else{ if(digitalRead(cw2)==HIGH){
            stepper2.setSpeed(100);
            stopped2 = false;
        }
        if(digitalRead(ccw2)==HIGH){
            stepper2.setSpeed(-100);
            stopped2 = false;
        }
    }

}
