# Create Repository on Github

# Setup project
```
# install dependencies
pip install -r requirements.txt
# create environment file
touch .env
```

### .env file
```
USERNAME_GITHUB="YourGithubUsername"
PASSWORD_GITHUB="accessToken"
FILEPATH="FileWhereCreateEmptyLocalRepo"
```
for accessToken look [tuto](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token)

## Setup .bashrc or .zshrc to run a simple command from anywhere
```
#.zshrc

alias create_repo="/ProjectPath/create_repo/create_repo.sh"
alias create_repo_exist="/ProjectPath/create_repo/create_repo_existing_project.sh"
```

# Usage

## What the project do
- **With create_repo.sh**
- you can create a local repository with a github repository from nothing in the FILEPATH locate ine the .env
- **With create_repo_existing_project.sh**
- you can add a github repository with all the files in your working directory

## Examples
- a new private github repo with the name newRepo and a local repo with the name newRepo
```
create_repo -n newRepo -s private
```

- a new public github repo with the name newRepo and a local repo with the name newRepo and a mit licence
```
create_repo -n newRepo -s public -l mit
```

- a new public github repo with what is in your PWD with a mit licence
```
create_repo_exist -n newRepoExist -s public -l mit
```
