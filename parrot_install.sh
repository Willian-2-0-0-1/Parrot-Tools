#!/bin/bash
# System Updates
sudo apt-get update -y
sudo apt-get full-upgrade --fix-missing -y
sudo apt-get autoremove -y
sudo parrot-upgrade

mkdir Tools
cd Tools

# Binary database updates
wpscan --update
sudo sqlmap --update
nuclei --update

# Rock you
gunzip -d /usr/share/wordlists/rockyou.txt.gz && rm /usr/share/wordlists/rockyou.txt.gz

# Seclists
git clone https://github.com/danielmiessler/SecLists.git

# Go
go install github.com/OJ/gobuster/v3@latest
go get -u -v github.com/ffuf/ffuf
go get -u -v github.com/Emoe/kxss
go get -u -v github.com/tomnomnom/meg
go get -u -v github.com/tomnomnom/assetfinder
go get -u -v github.com/tomnomnom/gf
go get -u -v github.com/tomnomnom/gron
go get -u -v github.com/tomnomnom/httprobe
go get -u -v github.com/tomnomnom/unfurl
go get -u -v github.com/tomnomnom/qsreplace
go get -u -v github.com/tomnomnom/anew
go get -u -v github.com/tomnomnom/waybackurls
GO111MODULE=on go get -u -v github.com/lc/gau
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
GO111MODULE=on go get -u -v github.com/projectdiscovery/chaos-client/cmd/chaos
GO111MODULE=on go get -u -v github.com/jaeles-project/gospider
GO111MODULE=on go get -u -v github.com/jaeles-project/jaeles

echo "export PATH=$PATH:/home/jack/go/bin" >> /home/jack/.bashrc

# Apt
sudo apt-get install amass -y
sudo apt-get install virtualbox-guest-utils -y
sudo apt-get -y install exploitdb
sudo apt-get -y install ripgrep

#Pip
pip3 install search-that-hash

# Github
mkdir Github
cd Github
# Asn lookup
git clone https://github.com/yassineaboukir/Asnlookup && cd Asnlookup && pip3 install -r requirements.txt && cd ..
# Responder 
git clone https://github.com/lgandx/Responder.git
# XSS Strike
git clone https://github.com/s0md3v/XSStrike.git && cd XSStrike && pip3 install -r requirements.txt && cd ..
# Smuggler
git clone https://github.com/defparam/smuggler.git
# Malicious PDF Generator
git clone https://github.com/jonaslejon/malicious-pdf.git
# Fuxsploiter
git clone https://github.com/almandin/fuxploider.git && cd fuxploider && pip3 install -r requirements.txt && cd ..

# AWS
mkdir AWS
cd AWS
git clone https://github.com/nahamsec/lazys3.git
git clone https://github.com/0xSearches/sandcastle.git
git clone https://github.com/sa7mon/S3Scanner.git && cd S3Scanner && pip3 install -r requirements.txt && cd ..
cd ..

# Linux priv esc
mkdir Linux-Priv-Esc
git clone https://github.com/Anon-Exploiter/SUID3NUM.git
git clone https://github.com/mzet-/linux-exploit-suggester.git
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
git clone https://github.com/carlospolop/PEASS-ng.git
git clone https://github.com/rebootuser/LinEnum.git
git clone https://github.com/sleventyeleven/linuxprivchecker.git && cd linuxprivchecker && pip3 install -r requirements.txt && cd ..
git clone https://github.com/spencerdodd/kernelpop.git
cd ..

# POSSIBLY OUT OF DATE
# Rust scan
wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
# Ghidra
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.0.2_build/ghidra_10.0.2_PUBLIC_20210804.zip
# Burp
https://portswigger.net/burp/releases/download?product=community&version=2021.8.1&type=Linux
chmod +x burpsuite_community_linux_v2021_8_1.sh
./burpsuite_community_linux_v2021_8_1.sh
# Ysoserial
wget https://jitpack.io/com/github/frohoff/ysoserial/master-SNAPSHOT/ysoserial-master-SNAPSHOT.jar
# Gowitness
wget https://github-releases.githubusercontent.com/108967484/e675ce80-b94e-11eb-829d-482dee0f45fe?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20210818%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210818T023233Z&X-Amz-Expires=300&X-Amz-Signature=57dc3d33447358d199e7561e8a90fff6ca89b77af09921c06cc6f24730badace&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=108967484&response-content-disposition=attachment%3B%20filename%3Dgowitness-2.3.6-linux-amd64&response-content-type=application%2Foctet-stream


# Firefox Extensions
nohup firefox &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/cookie-quick-manager/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/shodan-addon/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/dotgit/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/open-multiple-urls/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/s3-bucket-list/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/link-gopher/" &
firefox -new-tab "https://addons.mozilla.org/en-US/firefox/addon/security-txt/" &

# Update all git repos
find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull origin master" \;
# Update all go packages
#go get -u all

sudo chown -R jack .