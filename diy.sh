#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: Lunseil
#=================================================
#1. Change IP
sed -i 's/192.168.1.1/10.10.10.1/g' openwrt/package/base-files/files/bin/config_generate

#2. Change Hostname
sed -i '/uci commit system/i\uci set system.@system[0].hostname='CupangOs'' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Change Default Password
sed -i '$1$wOheR5zg$7LWQZUwOPIkCB8M9WoTfo1' openwrt/package/lean/default-settings/files/zzz-default-settings

#4. Display a name in the version number
sed -i "s/OpenWrt /CupangOs build $(TZ=WIB-7 date "+%Y.%m.%d") @ OpenWrt /g" openwrt/package/lean/default-settings/files/zzz-default-settings

#5. Modify the WAN port to PPPOE
#sed -i 's/username/5161851ST@MYADSL/g' openwrt/package/base-files/files/bin/config_generate
#sed -i 's/password/？？？？？？/g' openwrt/package/base-files/files/bin/config_generate
