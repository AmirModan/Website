import RPi.GPIO as GPIO
import os
from http.server import BaseHTTPRequestHandler, HTTPServer

host_name = '192.168.1.194'    # Change this to your Raspberry Pi IP address
host_port = 8080

BreachPin = 17

class MyServer(BaseHTTPRequestHandler):
    """ A special implementation of BaseHTTPRequestHander for reading data from
        and control GPIO of a Raspberry Pi
    """
    #Configure GPIO
    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)
    GPIO.setup(BreachPin, GPIO.IN)

    def do_HEAD(self):
        """ do_HEAD() can be tested use curl command
            'curl -I http://server-ip-address:port'
        """

    def do_GET(self):
        """ do_GET() can be tested using curl command
            'curl http://server-ip-address:port'
        """
        breach = GPIO.input(BreachPin);
        self.do_HEAD()
        html = ''''''
        status = ''
        if self.path=='/Camera':	#Take Picture, save to Camera.jpg, and Display to User
            os.system("fswebcam Camera.jpg")
            f = open('/home/pi/Security_System/Camera.jpg', 'rb')
            self.send_response(200)
            self.send_header('Content-type', 'image/jpg')
            self.end_headers()
            self.wfile.write(f.read())
            f.close()
        elif self.path=='/Burglar':	#Retrieve most recent Burglar.jpg Image and Display to User
            f = open('/home/pi/Security_System/Burglar.jpg', 'rb')
            self.send_response(200)
            self.send_header('Content-type', 'image/jpg')
            self.end_headers()
            self.wfile.write(f.read())
            f.close()
                
if __name__ == '__main__':
    http_server = HTTPServer((host_name, host_port), MyServer)
    print("Server Starts - %s:%s" % (host_name, host_port))
    try:
        http_server.serve_forever()
        print(1)
    except KeyboardInterrupt:
        http_server.server_close()

