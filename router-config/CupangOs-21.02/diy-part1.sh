#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/openwrt/openwrt / Branch: 21.02
#========================================================================================================================

# add feed for theme thano
# sed -i '$a src-git system https://github.com/riyuejz/system.git;main' feeds.conf.default

# Clone Lean's feeds
sed -i '$a src-git lean_packages https://github.com/coolsnowwolf/packages' feeds.conf.default
sed -i '$a src-git lean_luci https://github.com/coolsnowwolf/luci' feeds.conf.default

# Add a cupangOs-packages feed source
#sed -i '$a src-git small https://github.com/kenzok78/small-package' feeds.conf.default
sed -i '$a src-git cupangOs_packages https://github.com/thecupangin/cupangOs-packages' feeds.conf.default

# other
#rm -rf package/lean/{samba4,luci-app-samba4,*docker*}
#rm -rf package/{samba4,luci-app-samba4,*docker*,luci-app-control*,*timecontrol*}
