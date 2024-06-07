#####################################################
###################### SET SSH KEY ##################
#####################################################

ssh-keygen -f ~/$ssh_key_filename -o -t rsa -b 4096 -C $vm_user"_vm"

# eval $(ssh-agent -s)
# ssh-add /home/vagrant/.ssh/$ssh_key_filename

mv ~/$ssh_key_filename $home_path/.ssh/
mv ~/$ssh_key_filename.pub $home_path/.ssh/
touch $home_path/.ssh/config
chown -R $vm_user:$vm_user $home_path/.ssh/