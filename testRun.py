
ips='''31.204.28.29:5432:u9iy6:tdcg3sad
31.204.29.151:5432:u9iy6:tdcg3sad
31.204.31.6:5432:u9iy6:tdcg3sad
31.204.31.248:5432:u9iy6:tdcg3sad
46.3.40.21:5432:u9iy6:tdcg3sad
46.3.41.25:5432:u9iy6:tdcg3sad
46.3.42.57:5432:u9iy6:tdcg3sad
46.3.43.89:5432:u9iy6:tdcg3sad
46.3.45.31:5432:u9iy6:tdcg3sad
46.3.46.129:5432:u9iy6:tdcg3sad
46.3.47.253:5432:u9iy6:tdcg3sad
46.3.48.30:5432:u9iy6:tdcg3sad
46.3.49.69:5432:u9iy6:tdcg3sad
46.3.50.66:5432:u9iy6:tdcg3sad
46.3.51.55:5432:u9iy6:tdcg3sad
46.3.52.119:5432:u9iy6:tdcg3sad
46.3.53.157:5432:u9iy6:tdcg3sad
46.3.54.213:5432:u9iy6:tdcg3sad
46.3.55.210:5432:u9iy6:tdcg3sad
46.3.57.6:5432:u9iy6:tdcg3sad
46.3.58.167:5432:u9iy6:tdcg3sad
46.3.59.208:5432:u9iy6:tdcg3sad
46.3.61.125:5432:u9iy6:tdcg3sad
46.3.62.232:5432:u9iy6:tdcg3sad
46.3.63.205:5432:u9iy6:tdcg3sad
46.3.77.14:5432:u9iy6:tdcg3sad
46.3.78.30:5432:u9iy6:tdcg3sad
46.3.79.16:5432:u9iy6:tdcg3sad
46.3.79.241:5432:u9iy6:tdcg3sad
46.3.79.249:5432:u9iy6:tdcg3sad
46.3.128.20:5432:u9iy6:tdcg3sad
46.3.129.19:5432:u9iy6:tdcg3sad
46.3.130.67:5432:u9iy6:tdcg3sad
46.3.131.56:5432:u9iy6:tdcg3sad
46.3.131.245:5432:u9iy6:tdcg3sad
46.3.135.29:5432:u9iy6:tdcg3sad
46.3.156.77:5432:u9iy6:tdcg3sad
46.3.157.126:5432:u9iy6:tdcg3sad
46.3.157.142:5432:u9iy6:tdcg3sad
46.3.169.41:5432:u9iy6:tdcg3sad
46.3.170.74:5432:u9iy6:tdcg3sad
46.3.171.138:5432:u9iy6:tdcg3sad
46.3.172.127:5432:u9iy6:tdcg3sad
46.3.173.183:5432:u9iy6:tdcg3sad
46.3.174.156:5432:u9iy6:tdcg3sad
46.3.175.136:5432:u9iy6:tdcg3sad
46.3.205.159:5432:u9iy6:tdcg3sad
46.232.21.224:5432:u9iy6:tdcg3sad
46.232.23.36:5432:u9iy6:tdcg3sad
46.232.24.245:5432:u9iy6:tdcg3sad
46.232.25.174:5432:u9iy6:tdcg3sad
46.232.112.84:5432:u9iy6:tdcg3sad
46.232.113.57:5432:u9iy6:tdcg3sad
46.232.114.52:5432:u9iy6:tdcg3sad
46.232.114.223:5432:u9iy6:tdcg3sad
46.232.115.211:5432:u9iy6:tdcg3sad
89.185.79.204:5432:u9iy6:tdcg3sad
92.240.217.135:5432:u9iy6:tdcg3sad
158.46.160.30:5432:u9iy6:tdcg3sad
158.46.161.35:5432:u9iy6:tdcg3sad
178.171.92.76:5432:u9iy6:tdcg3sad
178.171.93.57:5432:u9iy6:tdcg3sad
'''

proxy_ip="31.204.28.29"
proxy_port="5432"
proxy_user="u9iy6"
proxy_password="tdcg3sad"


for idx,ip in enumerate(ips.split('\n')):
    if ip:
        ip=ip.split(':')
        # print(ip)
        # print('docker run --privileged -itd -e PROXY_IP={} -e PROXY_PORT={} -e PROXY_USER={} -e PROXY_PASS={} --name earnapp_{} jee23/jeevan06:69'.format(ip[0],ip[1],ip[2],ip[3],idx+1))
        print('docker run --privileged -itd -e proxy_ip={} -e proxy_port={} -e proxy_user={} -e proxy_password={} --name earnapp_{} earnapp:vps'.format(ip[0],ip[1],ip[2],ip[3],idx+1))
#docker run --privileged -itd -e proxy_ip={} -e proxy_port={} -e proxy_user={} -r proxy_password={} --name earnapp_testing earnapp:test

