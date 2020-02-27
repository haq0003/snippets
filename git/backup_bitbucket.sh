#!/bin/bash

#Bitbucket credentials
bitbucket_user='xxxxxx'
bitbucket_pass='xxxxxx'
backup_folder_name=`date +%F_%H_%M`

check_dependencies() {
dpkg -s jq &> /dev/null
if [ $? -eq 0 ]; then
    echo "jq is installed!"
else
    echo "jq is NOT installed!"
    echo "please install jq with `sudo apt install -y jq`"
    # or for windwos download https://stedolan.github.io/jq/ jq.exe
    exit 1
fi
}

bitbucket_get_urls () {
rm -f bitbucketurls
curl --user ${bitbucket_user}:${bitbucket_pass} https://api.bitbucket.org/2.0/repositories/xxxxxx?pagelen=100 > bitbucket.1
./jq.exe '.values[].links.clone[] | select(.name=="ssh") | .href' bitbucket.1 > bitbucketurls
sed -i 's#"##g' bitbucketurls
sed -i 's#git@#https://xxxxxx@#g' bitbucketurls
sed -i 's/:xxxxxx/\/xxxxxx/'  bitbucketurls

}

bb_backup () {
echo ${backup_folder_name} > VERSION
mkdir ${backup_folder_name}
cd ${backup_folder_name}

#bare clone
for repo in `cat ../bitbucketurls` ; do
echo "========== Cloning $repo =========="
git clone --bare $repo
done
}

#Backup Starts here

#check_dependencies
bitbucket_get_urls
bb_backup
