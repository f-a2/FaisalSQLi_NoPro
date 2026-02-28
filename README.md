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

## 🌍 Language / اللغة 🌍
- [🇺🇸 English Description](#🇺🇸-english-description)
- [🇸🇦 وصف الأداة بالعربية](#🇸🇦-وصف-الأداة-بالعربية)
- [🛠️ Installation / طريقة التثبيت](#🛠️-installation--طريقة-التثبيت)
- [⚙️ How it Works / كيف تعمل الأداة](#-كيف-تعمل-الأداة-Technical-Deep-Dive)
- [⚠️ Disclaimer / إخلاء مسؤولية](#️-disclaimer--إخلاء-مسؤولية-️)

---

## 🇺🇸 English Description

### 🎯 Target Platforms (Bug Bounty)
This tool is optimized for security researchers on:
- 🛡️ **HackerOne**
- 🛡️ **Bugcrowd**
- 🛡️ **Intigriti**

### ✨ Main Features
- **🛡️ Advanced WAF Bypass:** Custom headers and 7+ tamper scripts.
- **🔍 Auto-Discovery:** Instant URL fetching from Wayback Machine.
- **🎯 Smart Filtering:** Precise targeting using `GF` patterns to save time.
- **💻 Interactive Mode:** Full control over Database, Table, and Data Dumping.
- **🚀 No Proxy Needed:** High-speed stealth connections via Header Spoofing.

---

## 🇸🇦 وصف الأداة بالعربية

### 🎯 منصات الاستهداف (Bug Bounty)
الأداة مثالية للباحثين الأمنيين في برامج مكافآت الثغرات مثل:
- 🛡️ **HackerOne**
- 🛡️ **Bugcrowd**
- 🛡️ **Intigriti**

### ✨ المميزات الرئيسية
- **🛡️ تخطي الحماية (WAF Bypass):** تزوير الهوية الرقمية والتمويه المتقدم للأوامر.
- **🔍 سحب الروابط:** البحث في أرشيف الإنترنت التاريخي للموقع تلقائياً.
- **🎯 الفلترة الذكية:** استخدام أنماط `GF` للتركيز على الروابط المصابة فعلياً.
- **💻 نظام تفاعلي:** تحكم كامل في اختيار قاعدة البيانات، الجداول، وسحب البيانات.
- **🚀 بدون بروكسي:** سرعة عالية في الحقن مع الحفاظ على التخفي عبر تزوير الـ Headers.

---

## ⚙️ كيف تعمل الأداة؟ (Technical Deep Dive)

### 1️⃣ سحب الروابط الأرشيفية (Waybackurls) 🔍
* **العربية:** تقوم بالبحث عن الروابط القديمة والمؤرشفة للموقع والتي غالباً ما تحتوي على برمجيات قديمة وضعيفة.
* **English:** Fetches historical URLs from the Wayback Machine to find forgotten, vulnerable legacy pages.

### 2️⃣ الفلترة الذكية (GF Patterns) 🎯
* **العربية:** تصفية آلاف الروابط للتركيز فقط على التي تحتوي على متغيرات (Parameters) مثل `id=` و `cat=`.
* **English:** Filters noise and focuses on URLs with injectable parameters using precise patterns.

### 3️⃣ تخطي جدران الحماية (WAF Bypass) 🛡️
* **Tamper Scripts:** تحويل الأوامر (مثل `space2comment`) لخدع أنظمة الحماية.
* **Header Spoofing:** تزوير الـ IP عبر `X-Forwarded-For` لإيهام السيرفر أن الطلب داخلي وموثوق.
* **Session Control:** استخدام `--drop-set-cookie` لمنع تتبع بصمتك الرقمية أثناء الفحص.

---

## 🛠️ Installation / طريقة التثبيت

### 🐧 On Linux (Kali/Ubuntu) | لنظام اللينكس
```bash
# Update System
sudo apt update && sudo apt upgrade -y

# Install SQLMap
sudo apt install sqlmap -y

# Install Golang
sudo apt install golang -y

# Install Waybackurls
go install [github.com/tomnomnom/waybackurls@latest](https://github.com/tomnomnom/waybackurls@latest)
sudo cp ~/go/bin/waybackurls /usr/local/bin/

# Install GF & Patterns
go install [github.com/tomnomnom/gf@latest](https://github.com/tomnomnom/gf@latest)
sudo cp ~/go/bin/gf /usr/local/bin/
mkdir -p ~/.gf
git clone [https://github.com/1ndianl33t/Gf-Patterns](https://github.com/1ndianl33t/Gf-Patterns)
mv Gf-Patterns/*.json ~/.gf/
