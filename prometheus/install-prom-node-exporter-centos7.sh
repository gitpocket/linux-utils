#Prepare user
sudo useradd --no-create-home --shell /bin/false node_exporter

#Download and install binary
mkdir /root/download/
cd /root/download/
curl -LO https://github.com/prometheus/node_exporter/releases/download/v0.15.0/node_exporter-0.15.0.linux-amd64.tar.gz
tar -xzf /root/download/node_exporter*
cp node_exporter-*/node_exporter /usr/local/bin
chown node_exporter:node_exporter /usr/local/bin/node_exporter
rm -rf node_exporter-*

#Install systemd script
cp ../init-scripts/centos7/node_exporter.service /etc/systemd/system/

systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter
sleep 5
systemctl status node_exporter