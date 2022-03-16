#!/bin/bash

#Purpose: perform the NCO/DCA module deployment experiment
# $1 = number of trials
# $2 = clear built table each round of hosts: yes/no



# ************** STANDARD PARAMS MUST GO HERE ****************
GIT_DIR=/home/vagrant/software_defined_customization
NCO_DIR=/home/vagrant/software_defined_customization/NCO
EXP_SCRIPT_DIR=/home/vagrant/software_defined_customization/experiment_scripts
EXP_MOD_DIR=/home/vagrant/software_defined_customization/experiment_modules
SIMPLE_SERVER_DIR=/home/vagrant/software_defined_customization/experiment_scripts/client_server
DCA_KERNEL_DIR=/home/vagrant/software_defined_customization/DCA_kernel
DCA_USER_DIR=/home/vagrant/software_defined_customization/DCA_user

SERVER_IP=10.0.0.20
SERVER_PASSWD=vagrant
CLIENT_IP=10.0.0.40
CLIENT_PASSWD=vagrant




# ************** STANDARD PARAMS MUST GO HERE ****************


for hosts in 250 175 100 50 10
do
  echo "*************** Performing Experiment with $hosts Hosts ***************"
  $EXP_SCRIPT_DIR/nco_dca_experiment.sh $1 $hosts $2
done


echo generating plot

python3 nco_dca_plot.py
