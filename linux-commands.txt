sudo chmod -R 777 ./*
sudo chown -R $USER:$USER ./*

sudo chmod -R 777 /var/www/

sudo chown -R $USER:$USER /var/www/




# Change Drive format to exfat:- exfat
sudo apt update
sudo apt install exfatprogs

sudo mkfs.exfat -n MyDriveName /dev/sdc1