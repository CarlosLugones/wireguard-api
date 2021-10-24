import os
import subprocess
from fastapi import FastAPI
from pydantic import BaseModel
from dotenv import load_dotenv

# We load the env vars from a .env file
load_dotenv()

# Token uses by master to send commands to this node
TOKEN = os.getenv('API_TOKEN')


class Command(BaseModel):
    token: str
    command: str


app = FastAPI()


@app.post("/")
async def run_command(command: Command):
    if command.token == TOKEN:
        try:
            status = subprocess.check_output(
                command.command,
                shell=True,
                stderr=subprocess.STDOUT
            )

        except Exception as e:
            status = str(e)
        return {"status": status}
    return {"status": "forbidden"}
