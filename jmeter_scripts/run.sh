rm -r ./report
rm jmeter.log
rm results.jtl

jmeter -n -t ./stress_test.jmx -l results.jtl

#pid=$!

#sleep 10

#kill -SIGINT $pid

#jmeter -g results.jtl -o report

# file:///home/satkp/Server/apache-jmeter-5.6.3/report/index.html
