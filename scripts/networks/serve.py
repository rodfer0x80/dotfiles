#!/usr/bin/python3


from http.server import HTTPServer, BaseHTTPRequestHandler
import sys
import os


DOCS_LOCAL = "docs/"

class Serv(BaseHTTPRequestHandler):
    def do_GET(self):
       if self.path == '/':
           self.path = '/index.html'
       try:
           file_to_open = open(self.path[1:]).read()
           self.send_response(200)
       except:
           file_to_open = "File not found"
           self.send_response(404)
       self.end_headers()
       self.wfile.write(bytes(file_to_open, 'utf-8'))

def main():
    host = 'localhost'
    port = 8080
    print(f"[*] Serving on http://{host}:{port}/")
    httpd = HTTPServer((host,port),Serv)
    httpd.serve_forever()
    return 0


if __name__ == '__main__':
    os.chdir(DOCS_LOCAL)
    sys.exit(main())
