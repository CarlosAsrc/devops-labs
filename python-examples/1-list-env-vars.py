import os
from flask import Flask
app = Flask(__name__)

@app.route("/conf/env")
def get_env_vars():
    return os.popen('printenv').read()


if __name__ == '__main__':
  app.run(host='localhost', port=8080)