
void setup() {
  Serial.begin(115200);
  
}

void loop() {
   String command = "";

    char data [21];
    int number_of_bytes_received;
    
    if(Serial.available() > 0)
    {
        number_of_bytes_received = Serial.readBytesUntil (13,data,20); // read bytes (max. 20) from buffer, untill <CR> (13). store bytes in data. count the bytes recieved.
        data[number_of_bytes_received] = 0; // add a 0 terminator to the char array
        command=data;
        Serial.println(command);
    }
    

    
/*    
 if (Serial.available()) {
    character = Serial.read();
    command.concat(character);
    command.trim();
    Serial.println(command);
   
  }*/
}
