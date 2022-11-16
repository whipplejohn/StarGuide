
void setup() {
  Serial.begin(115200);
  
}

void loop() {
   String command = "";

    char data [20];
    int number_of_bytes_received;
    
    if(Serial.available() > 0)
    {
        //number_of_bytes_received = Serial.readBytesUntil (13,data,20); // read bytes (max. 20) from buffer, untill <CR> (13). store bytes in data. count the bytes recieved.
        //data[number_of_bytes_received] = 0; // add a 0 terminator to the char array
        number_of_bytes_received = Serial.readBytesUntil('\n',data,20);
        data[number_of_bytes_received] = 0;
        command= data;
        Serial.println(data);
        //Serial.println(strlen(data));
        
        if(command == "UP"){
          Serial.println("success");
        }
        if(command == "DOWN"){
          Serial.println("success");
        }
        if(command == "LEFT"){
          Serial.println("success");
        }
        if(command == "RIGHT"){
          Serial.println("success");
        }
        if(command == "zack"){
          Serial.println("is awesome");
        }
        memset(data, 0, sizeof(data));
        command = "";
        
     }
      
 }
    

    
/*    
 if (Serial.available()) {
    character = Serial.read();
    command.concat(character);
    command.trim();
    Serial.println(command);
   
  }*/
