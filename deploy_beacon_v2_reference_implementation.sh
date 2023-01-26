#################################################################
## Deploys the beacon reference implementation programmatically. 
##################################################################

mkdir data
cd data

################################################################
## Get BFF files
################################################################

wget ftp://FTPuser:FTPusersPassword@xfer13.crg.eu:221/external_files/ECCB_demo/*.json
wget ftp://FTPuser:FTPusersPassword@xfer13.crg.eu:221/external_files/ECCB_demo/genomicVariationsVcf.json.gz
gunzip -k -d genomicVariationsVcf.json.gz

cd ..

###################################################################
## Clone API repo
###################################################################

git clone https://github.com/MauricioMoldes/beacon2-ri-api
cd beacon2-ri-api/deploy

#####################################################################
## Start DB Container
#####################################################################

docker-compose up -d db

#####################################################################
## Import test data
#####################################################################

cd ../../data

mongoimport --jsonArray --uri "mongodb://root:example@127.0.0.1:27017/beacon?authSource=admin" --file analyses.json --collection analyses
mongoimport --jsonArray --uri "mongodb://root:example@127.0.0.1:27017/beacon?authSource=admin" --file biosamples.json --collection biosamples
mongoimport --jsonArray --uri "mongodb://root:example@127.0.0.1:27017/beacon?authSource=admin" --file cohorts.json --collection cohorts
mongoimport --jsonArray --uri "mongodb://root:example@127.0.0.1:27017/beacon?authSource=admin" --file datasets.json --collection datasets
mongoimport --jsonArray --uri "mongodb://root:example@127.0.0.1:27017/beacon?authSource=admin" --file individuals.json --collection individuals
mongoimport --jsonArray --uri "mongodb://root:example@127.0.0.1:27017/beacon?authSource=admin" --file runs.json --collection runs
mongoimport --jsonArray --uri "mongodb://root:example@127.0.0.1:27017/beacon?authSource=admin" --file genomicVariationsVcf.json --collection genomicVariations 

cd ../beacon2-ri-api/deploy

#####################################################################
## Start Beacon-ri Containers
#####################################################################

docker-compose up -d mongo-express
docker-compose up -d beacon
docker-compose up -d training-ui
#docker-compose up -d beacon-ri-tools
