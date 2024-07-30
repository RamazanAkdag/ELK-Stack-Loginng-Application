import requests
import json
import time

logstash_url = 'http://logstash:5044'  # Logstash HTTP input URL
log_count = 0  # Gönderilecek log sayısı

while True:
    log_data = {
        "message": f"Log entry {log_count}",
        "level": "info",
        "timestamp": "2024-07-30T12:34:56"
    }
    response = requests.post(logstash_url, data=json.dumps(log_data), headers={'Content-Type': 'application/json'})
    if response.status_code == 200:
        print(f"Log {log_count} successfully sent to Logstash")
    else:
        print(f"Failed to send log {i} to Logstash, status code: {response.status_code}")
    time.sleep(3)
    log_count = log_count + 1

