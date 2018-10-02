## Install neofetch on Debian

1. Add the 3rd party repo

`echo "deb http://dl.bintray.com/dawidd6/neofetch stretch main" | sudo tee -a /etc/apt/sources.list`

2. Add public key (you need to have curl and gnupg installed)

`curl "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" | sudo apt-key add -`

3. Update repositories

`sudo apt-get update`

4. Install the package

`sudo apt-get install neofetch`