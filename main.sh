## Script 
git clone https://github.com/SuvaniErranki/Team_Mendel

# download all programs

sudo apt-get -y install git

# Python
sudo apt-get -y install python3

"""
sudo apt-get -y install clang
sudo apt-get -y install nodejs
sudo apt-get -y install csc
"""
# Java Environement
sudo apt-get -y install default-jdk
sudo apt-get -y install default-jre

# Perl Environment
sudo apt-get -y install perl

# R Environment
sudo apt-get -y install r-base

# move into the repo folder
cd Team_Mendel



files=$(ls *)
sudo rm -rf Mendel.csv
touch Mendel.csv
echo "name, email, slack_username, biostack" >> Mendel.csv

for file in $files
do
    # split files based on extension
    filename=$(basename -- $file)
    extension=${filename##*.}
    filename=${filename%.*}

    # execute based on extension and write information to txt file
    case $extension in
    "py")
        echo "Executing python file"
        python3 $file >> Mendel.csv
        ;;

    "java")
        echo "Executing Java file"
        javac $file
        java $filename >> Mendel.csv
        ;;

    "R")
        echo "Executing R file"
        Rscript $file >> Mendel.csv
        ;;

    "pl")
        echo "Executing Perl file"
        perl $file >> Mendel.csv
        ;;
    "sh")
        echo "Executing Bash file"
        chmod +x $file
        ./$file >> Mendel.csv
    esac

done

# open the file
xdg-open ./Mendel.csv