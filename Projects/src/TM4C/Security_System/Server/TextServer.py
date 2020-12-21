import RPi.GPIO as GPIO
import os
from http.server import BaseHTTPRequestHandler, HTTPServer

host_name = '192.168.1.194'    # Change this to your Raspberry Pi IP address
host_port = 8000

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
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        """ do_GET() can be tested using curl command
            'curl http://server-ip-address:port'
        """
        breach = GPIO.input(BreachPin);
        self.do_HEAD()
        html = ''''''
        status = ''
        if breach == 1:	#Setup warning webpage with Red Background
            html = '''
            <html>
            <body style="width:960px; background-color: #FF0000; margin: 20px auto;">
            <h1>Security Breach Detected</h1>
            <h2><a href="http://192.168.1.194:8080/Camera">View Current Camera Status</a></h2>
            <h2><a href="http://192.168.1.194:8080/Burglar">Check Burglary Image</a></h2>
            </body>
            </html>
            '''
            self.wfile.write(html.format(0, status).encode("utf-8"))
        else:		#Setup normal webpage with Green Background
            html = '''
            <html>
            <body style="width:960px; background-color: #00FF00; margin: 20px auto;">
            <h1>No Breach Detected</h1>
            <h2><a href="http://192.168.1.194:8080/Camera">View Current Camera Status</a></h2>
            <h2><a href="http://192.168.1.194:8080/Burglar">Check Most Recent Burglary Image</a></h2>
            </body>
            </html>
            '''
            self.wfile.write(html.format(0, status).encode("utf-8"))
        
if __name__ == '__main__':
    http_server = HTTPServer((host_name, host_port), MyServer)
    print("Server Starts - %s:%s" % (host_name, host_port))
    try:
        http_server.serve_forever()
        print(1)
    except KeyboardInterrupt:
        http_server.server_close()
