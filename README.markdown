Smokefit
===

This application is based on spree 0.50.0

Before running this application it is necessary to create the database, run the migrations and run the 
seed file.

This application is hosted on webbynode and you need certain credentials for deploying.

After doing a

    wn push
    
All the files will be uploaded to the server, but in order to see the application we need to ssh to the 
server and restart enginx.

    sudo /etc/init.d/nginx restart

You wont be able to restart nginx unless you provide the ssl passphrase which is:

    smokefit passphrase certificate

The password for the ssl is:

    pass : Druxec4e
    
SSH credentials
===
The webbynode app is a rapp so the ssh access is over the git user. Be sure to read webbynode support
about this:

    http://guides.webbynode.com/articles/rapidapps/security.html


SSL
===

The files for generating the SSL certificate of this server are located in

    /var/rapp

Those files are:

    server.csr
    server.key
    server.key.secure

They where generated following this ubuntu's help guide:

    https://help.ubuntu.com/10.04/serverguide/C/certificates-and-security.html

The information used for generating the CSR file follows:

    THE PASSPHRASE FOR GODADDY SSL is: ezeesm0ke p7oduction ce7tific@te
    password for ssl certificate: Druxec4e*
  
    Country Name (2 letter code) [AU]:US
    State or Province Name (full name) [Some-State]:New York
    Locality Name (eg, city) []:Brooklyn
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:Ezeesmoke
    Organizational Unit Name (eg, section) []:Sales
    Common Name (eg, YOUR name) []:www.ezeesmoke.com                           
    Email Address []:simon@ezeesmoke.com
  
    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:Druxec4e*
    An optional company name []:.
      
The SSL certificate generated on godaddy is located in /var/rapp/ezeesmoke.tar.gz

Inside this file there are two files godaddy gives. The certificate and the chain certificates. We need to 
concatenate the primary certificate and intermediate certificate.

    cat gd_bundle.crt >> ezeesmoke.com.crt
    







