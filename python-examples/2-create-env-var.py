import os
from flask import Flask
from flask import request

app = Flask(__name__)

@app.route("/env/<env_name>/<env_var>", methods = ['POST'])
def create_env_var(env_name, env_var):
    os.environ[env_name] = env_var
    return os.environ[env_name]


if __name__ == '__main__':
  app.run(host='localhost', port=8080)