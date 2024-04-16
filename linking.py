from earnapp import earnapp

import requests 


auth : str = ''

ips='''
'''

uuids='''
'''

# for container_id in $(docker ps --format "{{.ID}}"); do
#     docker exec $container_id earnapp showid
# done

def parseIps():
    ips=ips.split('\n')
    ips = [
        ip.split(':') for ip in ips if ip
    ]

def parseUuids():
    uuids=uuids.split('\n')
    uuids = [
        uuid for uuid in uuids if uuid
    ]