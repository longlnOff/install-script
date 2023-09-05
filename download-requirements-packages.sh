wget -P 'software' 'https://az764295.vo.msecnd.net/stable/6c3e3dba23e8fadc360aed75ce363ba185c49794/code_1.81.1-1691620686_amd64.deb'
wget -P 'software' 'https://download.anydesk.com/linux/anydesk_6.3.0-1_amd64.deb'

for filename in ./software/*.deb;do
	dpkg -i $filename
done
