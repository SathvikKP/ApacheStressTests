# Detailed README

## Overview
This repository contains:
1. **Tomcat configuration files** (`server.xml`, `web.xml`, and related)  
2. **JMeter configuration** for stress testing  
3. **Benchmark scripts** (for Apache Bench and JMeter)  
4. **A toy web application** with five pages  
5. **Output statistics** from JMeter stress tests  
6. **An existing README** with high-level instructions  

Use these files to explore how Apache Tomcat is configured and how performance/stress tests are run with Apache JMeter, all within a Linux/Ubuntu environment.

---

## Requirements
1. **Ubuntu / Linux** environment  
2. **Java** (OpenJDK or any JDK based on Tomcat version)  
3. **Apache Tomcat** (install following official docs referenced as [1])  
4. **Apache JMeter** (install following official docs referenced as [2])  

---

## Setup and Installation
1. **Install Java**  
   - For Ubuntu-based systems:  
     ```bash
     sudo apt-get update
     sudo apt-get install openjdk-22-jdk
     ```
2. **Install Tomcat**  
   - Follow the official Tomcat installation steps. (Note: This involves downloading, de-compressing the tar using tar-xvzf, then adding the binaries to the $PATH) 
   - Replace or merge the provided config files (`server.xml`, `web.xml`, `context.xml` and `tomcat-users.xml`) in your Tomcat `conf` directory as needed.  
   - context.html and web.xml has 2 versions depending on if you require cache or not.
3. **Install JMeter**  
   - Follow the official JMeter instructions [2].  
   - Use the provided JMeter config scripts (e.g., `.jmx` files) to run the tests that I configured.
   - You can change the test configs by the JMeter GUI app, it is very simple and easy to understand.  
4. **Install Apache benchmark**
   - For Ubuntu-based systems:  
     ```bash
     sudo apt-get install apache2-utils
     ```
---

## Directory Structure 
- **tomcat_configs/**
  - `server.xml_changed` - Use this to change the server properties such as number of threads etc
  - `web.xml_cache` - Use this for cache enabled
  - `web.xml_orig` - Use this for cache disabled
  - `context.xml_cache` - Use this for cache enabled
  - `context.xml_orig` - Use this for cache disabled
  - `tomcat-users.xml_changed` - Use this to create users with permissions to access the web app
  - `*.sh` - Some scripts to start, restart server and quick cache enable/disable.
- **apache_benchmark_scripts/**
  - Various `.sh` scripts with templates for testing server using apache Benchmark
- **myapp/**
  - Simple application with images of 5 different countries for testing purposes. It contains 5 web pages, one index pages and 25 images each. Place this directory inside the webapps directory of the Apache Tomcat installation location.
- **jmeter_scripts**  
  - Contains the test configuration that I used for JMeter, scripts to run JMeter tests and to generate reports. 
- **jmeter_results and plots**  
  - Contains results for JMeter tests that I executed (for 50, 100, 250 and 500 threads with and without cache).
- **README.md**  
  - Contains usage instructions and references  

---

## Usage
1. **Configure Tomcat**  
   - Copy the modified Tomcat config files into your `TOMCAT_HOME/conf` folder (adjust as needed).  
2. **Start Tomcat**  
   - Typical command on Linux:  
     ```bash
     cd /path/to/tomcat
     ./bin/startup.sh
     ```
3. **Verify Web App**  
   - Place the toy web application in Tomcat’s `webapps/` directory.  
   - Go to `http://localhost:9090/<toy_web_app_name>` and confirm the pages load.  
   - Note: you may need to change the port based on your system.
4. **Run the Apache Benchmark Tests**
   - Run the templates present in the apache_benchmark_scripts
5. **Run JMeter Tests**  
   - Open the JMeter GUI or CLI.  
   - Load the provided `.jmx` file.  
   - Execute and monitor test results.  

---

## How to Enable / Disable the Cache
- You need to change the web.xml and context.xml files to enable / disable the cache.
- For cache enabled, use the configurations present in `web.xml_cache` and `context.xml_cache`
- For cache disabled, use the configurations present in `web.xml_orig` and `context.xml_orig`
- Restart the Tomcat server after enabling / disabling cache to see effects.
--

## Notes
- The included scripts show how to run **Apache Bench** (`ab`) or **JMeter** from a Linux shell.  
- The JMeter output statistics are generated in a .jtl file. You need to convert it into proper report using the jmeter_scripts/gen_report.sh script.  
- All modifications to the default Tomcat configs are showcased in the provided files.  

---

## References
- [1] [Official Apache Tomcat Documentation ](https://tomcat.apache.org/) 
- [2] [Official Apache JMeter Documentation](https://jmeter.apache.org/)
