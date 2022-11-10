#include <ESP8266WiFi.h>
#include <ESPAsyncTCP.h>
#include <ESPAsyncWebServer.h>


AsyncWebServer server(80);

const char* ssid = "starguide"; /* Add your router's SSID */
const char* password = ""; /*Add the password */
IPAddress ip(192,168,1,6);
IPAddress gateway(192,168,1,1);
IPAddress subnet(255,255,255,0);

const char* PARAM_INPUT_1 = "Enter Command";
const char* PARAM_INPUT_2 = "Up";
const char* PARAM_INPUT_3 = "Down";
const char* PARAM_INPUT_4 = "Left";
const char* PARAM_INPUT_5 = "Right";
const char* PARAM_INPUT_6 = "Big Dipper";
const char* PARAM_INPUT_7 = "Little Dipper";

// HTML web page to handle 3 input fields (input1, input2, input3)
const char index_html[] PROGMEM = R"rawliteral(
<!DOCTYPE HTML><html><head>
    <title>Star Guide Control</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
      body {background-color: #414a4c; color: white;}
      h1 {
        color: red; width: 50%; margin-left: 25%; text-align: center; font-size: 26px; display: inline-block;padding: 15px;
      }
      form {
          border: none;
          color: white;
          width: 50%;
          margin-left: 25%;
          padding: 15px ;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 16px;
        }
    </style>
    </head><body>
    <h1>Control Room</h1><br>
    <form action="/get">
      <p style="font-size: 20px;">Enter Command:</p>
      <input type="text" name="Enter Command">
      <input type="submit" value="Send">
    </form><br>
    <form action="/get"> 
      <input  type="submit" value="UP" name="Up">
      
    </form><br>
    <form action="/get"> 
      <input type="submit" value="LEFT" name="Left">
      
    </form>
    <form action="/get"> 
      <input type="submit" value="RIGHT" name="Right">
      
    </form><br>
    <form action="/get"> 
      <input type="submit" value="DOWN" name="Down">
      
    </form><br>
    <form action="/get">
        <p style="font-size: 20px;">Point to Little Dipper:</p> 
      <input type="submit" value="Little Dipper" name="Little Dipper">
      
    </form>
    <form action="/get">
        <p style="font-size: 20px;">Point to Big Dipper:</p> 
      <input type="submit" value="Big Dipper" name="Big Dipper">
      
    </form><br>
  </body></html>)rawliteral";

void notFound(AsyncWebServerRequest *request) {
  request->send(404, "text/plain", "Not found");
}
    String inputMessage;
    String inputParam;
void setup() {
  Serial.begin(115200);
  
  WiFi.softAP(ssid, password);
  
  Serial.println();
  Serial.print("IP Address: ");
  Serial.println(WiFi.softAPIP());

  // Send web page with input fields to client
  server.on("/", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send_P(200, "text/html", index_html);
  });

  // Send a GET request to <ESP_IP>/get?input1=<inputMessage>
  server.on("/get", HTTP_GET, [] (AsyncWebServerRequest *request) {
    
    // GET input1 value on <ESP_IP>/get?input1=<inputMessage>
    if (request->hasParam(PARAM_INPUT_1)) {
      inputMessage = request->getParam(PARAM_INPUT_1)->value();
      inputParam = PARAM_INPUT_1;
    }
    // GET input2 value on <ESP_IP>/get?input2=<inputMessage>
    else if (request->hasParam(PARAM_INPUT_2)) {
      inputMessage = "UP";//request->getParam(PARAM_INPUT_2)->value();
      inputParam = PARAM_INPUT_2;
    }
    // GET input3 value on <ESP_IP>/get?input3=<inputMessage>
    else if (request->hasParam(PARAM_INPUT_3)) {
      inputMessage = request->getParam(PARAM_INPUT_3)->value();
      inputParam = PARAM_INPUT_3;
    }
    else if (request->hasParam(PARAM_INPUT_4)) {
      inputMessage = request->getParam(PARAM_INPUT_4)->value();
      inputParam = PARAM_INPUT_4;
    }
    else if (request->hasParam(PARAM_INPUT_5)) {
      inputMessage = request->getParam(PARAM_INPUT_5)->value();
      inputParam = PARAM_INPUT_5;
    }
    else if (request->hasParam(PARAM_INPUT_6)) {
      inputMessage = request->getParam(PARAM_INPUT_6)->value();
      inputParam = PARAM_INPUT_6;
    }
    else if (request->hasParam(PARAM_INPUT_7)) {
      inputMessage = request->getParam(PARAM_INPUT_7)->value();
      inputParam = PARAM_INPUT_7;
    }
    else {
      inputMessage = "No message sent";
      inputParam = "none";
    }
    Serial.println(inputMessage);
    request->send(200, "text/html", /*"HTTP GET request sent to your ESP on input field (" 
                                     + inputParam + ") with value: " + inputMessage +
                                     "<br><a href=\"/\">Return to Home Page</a>"*/index_html);
  });
  server.onNotFound(notFound);
  server.begin();
}

void loop() {
  
    //Serial.println(inputMessage);
   // delay(10000);  
  
}
