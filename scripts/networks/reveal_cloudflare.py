cloudflare_ranges_ipv4 = ( '103.21.244.0/22', '103.22.200.0/22', '103.31.4.0/22', '104.16.0.0/13', '104.24.0.0/14', '108.162.192.0/18', '131.0.72.0/22', '141.101.64.0/18', '162.158.0.0/15', '172.64.0.0/13', '173.245.48.0/20', '188.114.96.0/20', '190.93.240.0/20', '197.234.240.0/22', '198.41.128.0/17' )

cloudflare_ranges_ipv6 =( '2400:cb00::/32', '2606:4700::/32', '2803:f800::/32', '2405:b500::/32', '2405:8100::/32', '2a06:98c0::/29', '2c0f:f248::/32' )

def main(argv):
    inputfile = ''
    outputfile = ''
    try:
        opts, args = getopt.getopt(argv, "hi:o:",["input=","output="])
    except getopt.GetoptError:
        print('cf_filter.py -i <input-file> -o <output-file>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print('cf_filter.py -i <input-file> -o <output-file>')
            sys.exit()
        elif opt in ("-i", "--input"):
            inputfile = arg
        elif opt in ("-o", "--output"):
            outputfile = arg
    try:
        input_file = open(inputfile, "r")
        ip_list = input_file.readlines()
    except Exception as error:
        print(f"{error} has occurred. exiting")
        sys.exit(1)
    ipv4_list = []
    ipv6_list = []
    for ip in ip_list:
        ip = ip.replace('\n','')
        try:
            if type(ipaddress.ip_address(ip)) == type(ipaddress.ip_address('192.168.1.1')):
                ipv4_list.append(ip)
            elif type(ipaddress.ip_address(ip)) == type(ipaddress.ip_adress('2c0f:f248::/32')):
                ipv6_list.append(ip)
        except Exception as error:
            print("ip is of type "+str(type(ipaddress.ip_address(ip))))
            print(error)
    non_cf_ipv4 = []
    non_cf_ipv6 = []
    if len(ipv4_list) != 0:
        for ipv4_addr in ipv4_list:
            is_cloudflare = False
            for cf_ipv4_network in cloudflare_ranges_ipv4:
                ipv4_network = ipaddress.ip_network(cf_ipv4_network.replace('\n', ''))
                ipv4_address = ipaddress.ip_address(ipv4_addr.replace('\n', ''))
                if ipv4_address in ipv4_network:
                    is_cloudflare = True
                else:
                    continue
            if is_cloudflare is False:
              non_cf_ipv4.append(ipv4_addr.replace('\n', ''))

           

    if len(ipv6_list) != 0:
        for ipv6_addr in ipv6_list:
            is_cloudflare = False
            for cf_ipv6_network in cloudflare_ranges_ipv6:
                ipv6_network = ipaddress.ip_network(cf_ipv6_network.replace('\n', ''))
                ipv6_address = ipaddress.ip_address(ipv6_addr.replace('\n', ''))
                if ipv6_address in ipv6_network:
                    is_cloudflare = True
                else:
                    continue
            if is_cloudflare is False:
              non_cf_ipv6.append(ipv6_addr.replace('\n', ''))
    output_file = open(outputfile, "a")
    if len(non_cf_ipv4) != 0:
        for ipv4 in non_cf_ipv4:
            output_file.write(ipv4)
            output_file.write('\n')
    if len(non_cf_ipv6) != 0:
        for ipv6 in non_cf_ipv6:
            output_file.write(ipv6)
            output_file.write('\n')
    output_file.close()
main(sys.argv[1:])
