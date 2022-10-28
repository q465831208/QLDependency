#!/usr/bin/env bash
#

TIME() {
[[ -z "$1" ]] && {
	echo -ne " "
} || {
     case $1 in
	r) export Color="\e[31;1m";;
	g) export Color="\e[32;1m";;
	b) export Color="\e[34;1m";;
	y) export Color="\e[33;1m";;
	z) export Color="\e[35;1m";;
	l) export Color="\e[36;1m";;
      esac
	[[ $# -lt 2 ]] && echo -e "\e[36m\e[0m ${1}" || {
		echo -e "\e[36m\e[0m ${Color}${2}\e[0m"
	 }
      }
}
echo
TIME l "安装依赖..."
echo
TIME y "安装依赖需要时间，请耐心等待!"
echo
sleep 2
npm config set registry https://mirrors.huaweicloud.com/repository/npm/
npm config get registry
latest_ver="$(wget -qO- -t1 -T2 "https://api.github.com/repos/npm/cli/releases/latest" |grep "tag_name" |head -n 1 |awk -F ":" '{print $2}' |sed 's/\"//g;s/,//g;s/ //g' |sed 's/^v//')"
npm install -g npm
TIME l "升级npm至${latest_ver}"
npm install -g npm@${latest_ver} --force

echo
TIME g "依赖安装完毕..."
echo
exit 0
