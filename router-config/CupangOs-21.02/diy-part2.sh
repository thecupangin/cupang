#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/openwrt/openwrt / Branch: 21.02
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-tano）
sed -i 's/luci-theme-bootstrap/luci-theme-tano/g' feeds/luci/collections/luci/Makefile

# change password to "root"
sed -i "s/root::0:0:99999:7:::/root:$1$Px5lfQdL$suWhpQngCSnh9DlbQsC0N/:18936:0:99999:7:::/g" package/base-files/files/etc/shadow

# change ssid
sed -i "s/OpenWrt/CupangOs/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# change hostname
sed -i "s/ImmortalWrt/CupangOs/g" package/base-files/files/bin/config_generate

# change banner
rm -rf ./package/emortal/default-settings/files/openwrt_banner
svn export https://github.com/thecupangin/cupang/trunk/amlogic-s9xxx/common-files/files/etc/banner package/emortal/default-settings/files/openwrt_banner

# change timezone
sed -i -e "s/CST-8/UTC+7/g" -e "s/Shanghai/Jakarta/g" package/emortal/default-settings/files/99-default-settings-chinese

# change shell
sed -i "s/\/bin\/ash/\/usr\/bin\/zsh/g" package/base-files/files/etc/passwd

# translate luci-app-wrtbwmon
# sed -i -e "s/客户端/Host/g" -e "s/下载带宽/DL Speed/g" -e "s/上传带宽/UL Speed/g" -e "s/总下载流量/Download/g" -e "s/总上传流量/Upload/g" -e "s/流量合计/Total/g" -e "s/首次上线时间/First Seen/g" -e "s/最后上线时间/Last Seen/g" -e "s/总计/TOTAL/g" -e "s/数据更新时间/Last updated/g" -e "s/倒数/Updating again in/g" -e "s/秒后刷新./seconds./g" feeds/luci/applications/luci-app-wrtbwmon/htdocs/luci-static/wrtbwmon.js

# fix luci-app-nlbwmon
# sed -i "s|services/||g" feeds/luci/applications/luci-app-nlbwmon/root/usr/share/luci/menu.d/luci-app-nlbwmon.json

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='CupangOs '" >>package/base-files/files/etc/openwrt_release

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
# sed -i 's/192.168.1.1/192.168.31.4/g' package/base-files/files/bin/config_generate

#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk package/luci-app-amlogic

# Add p7zip
svn co https://github.com/hubutui/p7zip-lede/trunk package/lean/p7zip

# Add luci-app-3ginfo-lite
# svn co https://github.com/4IceG/luci-app-3ginfo-lite/trunk package/luci-app-3ginfo-lite

# oh-my-zsh
mkdir -p files/root
pushd files/root
git clone https://github.com/robbyrussell/oh-my-zsh ./.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ./.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ./.oh-my-zsh/custom/plugins/zsh-completions
cp $GITHUB_WORKSPACE/amlogic-s9xxx/common-files/patches/zsh/.zshrc .
cp $GITHUB_WORKSPACE/amlogic-s9xxx/common-files/patches/zsh/example.zsh ./.oh-my-zsh/custom/example.zsh
popd

# add theme luci-theme-neobird
# git clone --dept 1 https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird

# add lrdrdn/my-opkg-repo
#sed -i 's/option check_signature/# option check_signature/g' /etc/opkg.conf
#echo "src/gz custom_generic https://raw.githubusercontent.com/lrdrdn/my-opkg-repo/main/generic" >> /etc/opkg/customfeeds.conf
#echo "src/gz custom_arch https://raw.githubusercontent.com/lrdrdn/my-opkg-repo/main/$(cat /etc/os-release | grep OPENWRT_ARCH | awk -F '"' '{print $2}')" >> /etc/opkg/customfeeds.conf
#popd

# Add autocore
# svn co https://github.com/ophub/amlogic-s9xxx-openwrt/trunk/amlogic-s9xxx/common-files/patches/autocore package/lean/autocore

# coolsnowwolf default software package replaced with Lienol related software package
# rm -rf feeds/packages/utils/{containerd,libnetwork,runc,tini}
# svn co https://github.com/Lienol/openwrt-packages/trunk/utils/{containerd,libnetwork,runc,tini} feeds/packages/utils

# Add third-party software packages (The entire repository)
# git clone https://github.com/libremesh/lime-packages.git package/lime-packages
# Add third-party software packages (Specify the package)
# svn co https://github.com/libremesh/lime-packages/trunk/packages/{shared-state-pirania,pirania-app,pirania} package/lime-packages/packages
# Add to compile options (Add related dependencies according to the requirements of the third-party software package Makefile)
# sed -i "/DEFAULT_PACKAGES/ s/$/ pirania-app pirania ip6tables-mod-nat ipset shared-state-pirania uhttpd-mod-lua/" target/linux/armvirt/Makefile

# Apply patch
# git apply ../router-config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------