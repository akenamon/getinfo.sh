#!/bin/bash 

	###################################################################### 
	#	Script Name: getconfig.sh                                    #
	#	Script Author: Vinicius Torino                               #
	#	Author's email: vinicius.torino@protonmail.com               #
	#	Date of Creation: Wed Jul  8 11:51:00 -03 2020               #
	#	Short Description: Get info from /etc/ssswitch.conf file     #
	#	Usage: ./getinfo <database> [string]                         #
	######################################################################
	    

database=$1
string=$2

grepfy()
{
	string=$1
	file=$2
	[[ -z $string ]] && cat $file && exit
	grep "$string" "$file"
}

case $database in
	'passwd')
			grepfy "$string" '/etc/passwd'
			;;
	'group')
			grepfy "$string" '/etc/group'
			;;
	'shadow')
			export file='/etc/shadow'
			export string
			[[ -z $string ]] && sudo cat $file && exit
        		sudo grep "$string" "$file"
			;;
	'gshadow')
			export file='/etc/shadow'
			export string
			[[ -z $string ]] && sudo cat $file && exit
        		sudo grep "$string" "$file"
			;;
	'hosts')
			grepfy "$string" '/etc/hosts'
			;;
	'networks')
			grepfy "$string" '/etc/networks'
			;;
	'protocols')
       			grepfy "$string" '/etc/protocols'
			;;
	'services')
			grepfy "$string" '/etc/services'
			;;
	'ethers')
			grepfy "$string" '/etc/ethers'
			;;
	'rpc')
			grepfy "$string" '/etc/rpc'
			;;
	'netgroup')
			echo "Enumeration not supported on netgroup" 
			;;
	*)
			echo "Invalid Query"
			;;
esac

