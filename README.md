# 🛡️ FaisalSQLi - Advanced WAF Bypass Edition

<p align="center">
  <img src="https://img.shields.io/badge/Version-1.0.0-blue.svg" alt="Version">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License">
  <img src="https://img.shields.io/badge/Platform-Linux-orange.svg" alt="Platform">
</p>



---

## 🌍 Language / اللغة
- [English](#english-description)
- [العربية](#وصف-الأداة-بالعربية)

---

## English Description
**FaisalSQLi** is a high-performance, automated SQL injection tool designed to bypass modern WAFs (Web Application Firewalls) without the need for proxies. It uses advanced header spoofing and multiple tamper scripts to hide its identity while scanning targets from the Wayback Machine.

### ✨ Features
- **WAF Bypass:** Utilizes 7+ tamper scripts and custom HTTP headers.
- **Auto-Discovery:** Fetches historical URLs via `Waybackurls`.
- **Smart Filtering:** Uses `GF` to find high-potential SQLi targets.
- **Interactive Mode:** Full control over Database, Table, and Data Dumping.
- **No Proxy Needed:** Optimized for direct connection with high stealth.

### 🛠️ Requirements
- `sqlmap`
- `waybackurls`
- `gf` (with SQLi patterns)

### 🚀 How to Run
```bash
git clone [https://github.com/f-a2/FaisalSQLi.git](https://github.com/f-a2/FaisalSQLi.git)
cd FaisalSQLi
chmod +x FaisalSQLi_NoPro.sh
./FaisalSQLi_NoPro.sh
