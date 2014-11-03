#
# Cookbook Name:: databag-postfix
# Recipe:: default
#
# Copyright (C) 2014 Rackspace
#
# All rights reserved - Do Not Redistribute
#

postfix_creds = Chef::EncryptedDataBagItem.load("secrets","postfix")

node.override[:postfix][:sasl][:smtp_sasl_user_name] = postfix_creds['user']
node.override[:postfix][:sasl][:smtp_sasl_passwd]    = postfix_creds['passwd']

include_recipe "postfix"
