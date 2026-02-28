# 🕵️‍♂️ FaisalSQLi - The Forbidden Deduction Edition 🕵️‍♂️

<p align="center">
  <img src="https://a.storyblok.com/f/178900/1920x1080/b29a84a87a/ron-kamonohashi-s-forbidden-deductions.jpg/m/1200x0/filters:quality(95)format(webp)" alt="FaisalSQLi Forbidden Deduction" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Version-1.0.0-blue.svg?style=flat-square" alt="Version">
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/Platform-Linux%20%7C%20Termux-orange.svg?style=flat-square" alt="Platform">
  <img src="https://img.shields.io/badge/WAF_Bypass-Enabled-red.svg?style=flat-square" alt="WAF Bypass">
</p>

---

## 🌐 Language / اللغة 🌐
- [🇺🇸 English Description](#🇺🇸-english-description)
- [🇸🇦 وصف الأداة بالعربية](#🇸🇦-وصف-الأداة-بالعربية)
- [🛠️ Installation / طريقة التثبيت](#🛠️-installation--طريقة-التثبيت)
- [⚠️ Disclaimer / إخلاء مسؤولية](#⚠️-disclaimer--إخلاء-مسؤولية-⚠️)

---

## 🇺🇸 English Description

### 🎯 Target Platforms (Bug Bounty)
This tool is highly effective for security researchers on:
- 🛡️ **HackerOne**
- 🛡️ **Bugcrowd**
- 🛡️ **Intigriti**

### ✨ Features
- **🛡️ Advanced WAF Bypass:** Custom headers and 7+ tamper scripts.
- **🔍 Auto-Discovery:** Instant URL fetching from Wayback Machine.
- **🎯 Smart Filtering:** Precise targeting using `GF` patterns.
- **🚀 No Proxy Needed:** High-speed stealth connections.

---

## 🇸🇦 وصف الأداة بالعربية

### 🎯 منصات الاستهداف (Bug Bounty)
الأداة مثالية للباحثين الأمنيين في برامج المكافآت مثل:
- 🛡️ **HackerOne**
- 🛡️ **Bugcrowd**
- 🛡️ **Intigriti**

### ✨ المميزات
- **🛡️ تخطي الحماية (WAF Bypass):** تزوير الهوية الرقمية والتمويه المتقدم.
- **🔍 سحب الروابط:** البحث في أرشيف الإنترنت التاريخي تلقائياً.
- **🎯 الفلترة الذكية:** استخدام أنماط `GF` للتركيز على الروابط المصابة فقط.
- **🚀 بدون بروكسي:** سرعة عالية في الحقن مع الحفاظ على التخفي.

---

## 🛠️ Installation / طريقة التثبيت

### 🐧 On Linux (Kali/Ubuntu) | لنظام اللينكس
انسخ الأوامر التالية لتثبيت المتطلبات:
```bash
# Update System
sudo apt update && sudo apt upgrade -y

# Install SQLMap
sudo apt install sqlmap -y

# Install Golang (Required for Waybackurls & GF)
sudo apt install golang -y

# Install Waybackurls
go install [github.com/tomnomnom/waybackurls@latest](https://github.com/tomnomnom/waybackurls@latest)
sudo cp ~/go/bin/waybackurls /usr/local/bin/

# Install GF
go install [github.com/tomnomnom/gf@latest](https://github.com/tomnomnom/gf@latest)
sudo cp ~/go/bin/gf /usr/local/bin/

# Setup GF Patterns (Important)
mkdir .gf
git clone [https://github.com/1ndianl33t/Gf-Patterns](https://github.com/1ndianl33t/Gf-Patterns)
mv Gf-Patterns/*.json ~/.gf/
