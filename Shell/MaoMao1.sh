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
TIME l "安装yarn"
npm install -g yarn --force
npm install -g npm tunnel@0.0.6 jsdom@20.0.0 sync-request@6.1.0 https-proxy-agent@5.0.1 crypto-js@4.1.1 http-proxy-agent@5.0.0 xmldom@0.6.0 qs@6.10.3 moment@2.29.1 @babel/parser@7.18.11 sablejs@1.0.8 got@11.8.2 readline-sync@1.4.10 bytenode@1.3.6 tough-cookie@4.0.0 axios@0.22.0 node-rsa@1.1.1 socks-proxy-agent@6.2.0 urlencode@1.1.0 websocket@1.0.30 xpath@0.0.32 babel@6.23.0 tough-cookie@4.1.2 iconv-lite node-machine-id

pnpm install -g js-base64 qrcode-terminal silly-datetime

pip3 install requests
cd /ql/scripts/ && apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && npm i && npm i -S ts-node typescript @types/node date-fns axios png-js canvas --build-from-source
cd /ql
apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && cd scripts && npm install canvas --build-from-source
cd /ql
TIME l "安装python3"
apk add python3 zlib-dev gcc jpeg-dev python3-dev musl-dev freetype-dev
cd /ql
echo
TIME g "依赖安装完毕..."
echo
exit 0
