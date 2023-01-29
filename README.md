# Nginx

## Self signed SSL
```bash
apt install openssl

# no prompt
cat << EOF >> ssl.cnf
[req]
distinguished_name = req_distinguished_name
prompt = no

[req_distinguished_name]
countryName             = UK
stateOrProvinceName     = around the world
localityName            = surprise
organizationName        = Power Ranger
organizationalUnitName  = IT
emailAddress            = wherever@whatever.com
EOF
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -config ssl.cnf

openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 4096
```

## Load balancing
By default nginx will use round robin load balancing method. [Read more](https://nginx.org/en/docs/http/load_balancing.html#nginx_load_balancing_methods)

### Supported load balancing methods
The following load balancing mechanisms (or methods) are supported in nginx:

- `round-robin` — requests to the application servers are distributed in a round-robin fashion,
- `least-connected` — next request is assigned to the server with the least number of active connections,
- `ip-hash` — a hash-function is used to determine what server should be selected for the next request (based on the client’s IP address).

## Reverse proxy

## Common configuration

### client_max_body_size size;
By default Nginx limit the upload file size to 1m. We can modify this within http, server, location context.

```nginx
server {
    ...
    client_max_body_size 100m;
    ...
}
```

### Timeout
Proxy module can be used when using http protocol. FastCGI module can be used when using FastCGI protocol
#### proxy_connect_timeout size;
#### proxy_read_timeout size;
#### proxy_send_timeout size;
#### fastcgi_read_timeout size;
#### fastcgi_request_buffering option;

## Troubleshooting
### Error when uploading file
- [client_max_body_size](#client_max_body_size)
- [Timeout](#timeout)

