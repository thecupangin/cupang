## OpenWrt Firmware instructions

| SoC  | Device | [Optional kernel](https://github.com/ophub/kernel/tree/main/pub/stable) | OpenWrt Firmware |
| ---- | ---- | ---- | ---- |
| s905x | [HG680P], [B860H] | 5.4.170 | CupangOs_k5.4.170.img |
| s905x2 | [X96Max-4G], [X96Max-2G] | soon | CupangOs_k*.img |
| s905x3 | [X96-Max+], [HK1-Box], [H96-Max-X3], [Ugoos-X3], [X96-Air], [A95XF3-Air] | soon | CupangOs_k*.img |

## Firmware information

| Name | Value |
| ---- | ---- |
| Default IP | 192.168.1.1 |
| Default username | root |
| Default password | root |
| Default WIFI name | CupangOs |
| Default WIFI password | none |

## Bypass gateway settings

If used as a bypass gateway, you can add custom firewall rules as needed (Network → Firewall → Custom Rules):

```yaml
iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE        #If the interface is eth0.
iptables -t nat -I POSTROUTING -o br-lan -j MASQUERADE      #If the interface is br-lan bridged.
```
<div align="center">
<h1 align="center">CupangOs by thecupangin</h1>
<img src="https://img.shields.io/github/issues/thecupangin/cupang?color=green">
<img src="https://img.shields.io/github/stars/thecupangin/cupang?color=yellow">
<img src="https://img.shields.io/github/forks/thecupangin/cupang?color=orange">
<img src="https://img.shields.io/github/license/thecupangin/cupang?color=ff69b4">
<img src="https://img.shields.io/github/languages/code-size/thecupangin/cupang?color=blueviolet">
</div>

