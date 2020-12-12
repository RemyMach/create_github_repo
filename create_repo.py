import sys
import os
from pathlib import PurePath
from github import Github
from dotenv import load_dotenv

load_dotenv()
username = os.getenv("USERNAME_GITHUB")
password = os.getenv("PASSWORD_GITHUB")

def create():

    folderName = str(sys.argv[1])
    path = PurePath(str(sys.argv[2]))
    arg_scope = PurePath(str(sys.argv[3]))
    arg_licence = PurePath(str(sys.argv[4]))
    if path.name != folderName:
        os.makedirs(str(path) + folderName, exist_ok=True)
    user = Github(username, password).get_user()
    scope = getScopeRepo(arg_scope)
    repo = createRepo(user, arg_licence, scope, folderName)
    print("Succesfully created repository {}".format(folderName))


def getScopeRepo(arg_scope):

    if arg_scope == "private":
        return True
    return False

def createRepo(user, licence, scope, folderName):
    
    if str(licence) == "None":
        return user.create_repo(folderName, private=scope)
    return user.create_repo(folderName, private=scope, license_template=licence)

if __name__ == "__main__":
    create()