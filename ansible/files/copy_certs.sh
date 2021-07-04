mordiscos=`ls -lt /etc/letsencrypt/live/ | sed -n 2p | cut -d":" -f 2 | cut -d" " -f 2`
cat /etc/letsencrypt/live/$mordiscos/fullchain.pem /etc/letsencrypt/live/$mordiscos/privkey.pem | sudo tee /mnt/certificados/mordiscos/mordiscos.ovh.pem
cp /etc/letsencrypt/live/$mordiscos/fullchain.pem /mnt/certificados/mordiscos/ssl/fullchain.pem
cp /etc/letsencrypt/live/$mordiscos/privkey.pem /mnt/certificados/mordiscos/ssl/privkey.pem
