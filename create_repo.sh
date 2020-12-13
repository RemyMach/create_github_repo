#! /bin/bash

SCRIPTPATH="/Users/remy/Scripts/create_repo"

usage() {

cat <<EOF
$(basename $0) : create a repo local with the FILEPATH in the .env,  and create github repo [public / private with a licence if you want]

SYSNOPSIS

  $(basename $0) -n repo_name -s scope [ -l license ]

    -n name : Name of the github repo

    -s scope : the scope of the repository Private or Public

    [-l licence : name of the license if you want one for your repo]

EOF

}
while getopts "n:s:l:" opt
do
    case $opt in
        n)
            name=$OPTARG
        ;;
        s)
            scope=$OPTARG
        ;;
        l)
            licence=$OPTARG
        ;;
        h)
            usage
            exit 0
        ;;
        *)
        echo "Error Unknown option"
        usage
        exit 3
    esac
done

if ([ "x$name" == "x" ] || [ "x$scope" == "x" ])
then
    echo "Error Please provide a name and a scope at least"
    usage
    exit 1
fi

if [ "x$licence" == "x" ]
then
    licence="None"
fi

source $SCRIPTPATH/.env
python3 $SCRIPTPATH/create_repo.py $name $FILEPATH $scope $licence
echo "$USERNAME_GITHUB have create $FILEPATH$name local repo and use the https://github.com/$USERNAME_GITHUB/$name.git github repo"
cd $FILEPATH$name
touch README.md
echo "# $name" >> README.md
git init
git remote add origin https://github.com/$USERNAME_GITHUB/$name.git
git add .
git commit -m "Initial commit"
git push -u origin main
code .