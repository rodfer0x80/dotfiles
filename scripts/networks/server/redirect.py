#!/usr/bin/python3


import sys
from http.server import HTTPServer, BaseHTTPRequestHandler


class Redirect(BaseHTTPRequestHandler):
    def do_GET(self):
        if len(sys.argv) != 2:
            sys.stdout.write(f"Usage {sys.argv[0]} <url>\n")
            sys.exit(-1)
        self.url = sys.argv[1]
        self.send_response(302)
        self.send_header('Location', self.url)
        self.end_headers()

if __name__ == '__main__':
    HTTPServer(("0.0.0.0", 80), Redirect).serve_forever()
    sys.exit(0)
