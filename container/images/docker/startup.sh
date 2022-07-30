echo running startup.sh script...

cd /opt/Roamware/binaries/
if [ -f sds.tar.gz ]
then
	echo Extracting sds...
	tar zxf sds.tar.gz
	rm -f sds.tar.gz
fi

cd /opt/Roamware/binaries/
if [ -f sds5g.tar.gz ]
then
	echo Extracting sds5g...
	tar zxf sds5g.tar.gz
	rm -f sds5g.tar.gz
fi

cd /opt/Roamware/binaries/ntr90/
if [ -f soraf.tar.gz ]
then
	echo Extracting soraf...
	tar zxf soraf.tar.gz
	rm -f soraf.tar.gz
fi

cd /opt/Roamware/scripts
if [ -f operations.tar.gz ]
then
	echo Extracting scripts/operations...
	tar zxf operations.tar.gz
	rm -f operations.tar.gz
fi

cd /opt/Roamware/
chmod +x scripts/operations/ntr90/StartSoRAF.sh

cp /opt/Roamware/binaries/sds/config/snmp.acl /opt/Roamware/binaries/ntr90/soraf/config

echo running StartSoRAF.sh script...

#./scripts/operations/ntr90/StartSoRAF.sh
