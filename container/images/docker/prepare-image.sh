if [ -z "$LABEL" ]
then
        export LABEL="rel"
fi

mkdir -p staging
mkdir -p staging/binaries
mkdir -p staging/binaries/ntr90
mkdir -p staging/scripts

# Clean the staging area
# Copy the SDS
echo Copying sds ...
cp -rf ../../../../../../sds/binaries/sds staging/binaries/
cd staging/binaries/
tar cvf sds.tar sds
gzip sds.tar
rm -rf sds
cd ../../

# Copy the SDS5G
echo Copying sds5g ...
cp -rf ../../../../../../sds5g staging/binaries/
cd staging/binaries/
tar cvf sds5g.tar sds5g
gzip sds5g.tar
rm -rf sds5g
cd ../../

# Copy the SORAF
echo Copying soraf ...
cp -rf ../../../../binaries/ntr90/soraf staging/binaries/ntr90/
cd staging/binaries/ntr90/
tar cvf soraf.tar soraf
gzip soraf.tar
rm -rf soraf
cd ../../../

# Copy the scripts
echo Copying scripts ...
cp -rf ../../../../scripts/operations staging/scripts/

# replace delete 'nohup' and '$' from the StartSoRAF.sh file.
sed 's/nohup//' staging/scripts/operations/ntr90/StartSoRAF.sh > taging/scripts/perations/ntr90/StartSoRAF.sh_bkp
sed 's/&//' staging/scripts/operations/ntr90/StartSoRAF.sh_bkp > staging/scripts/operations/ntr90/StartSoRAF.sh

cd staging/scripts/
tar cvf operations.tar operations
gzip operations.tar
rm -rf operations
cd ../../

echo Done. Build the image now.

echo docker build . -f Dockerfile.ubi8 -t soraf-ubi8-$LABEL
