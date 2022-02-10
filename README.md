<div align="center">
<h1 align="center" style="font-weight: bold">CupangOs Firmware instructions</h1>

| SoC  | Device | [ Kernel Version ](https://github.com/ophub/kernel/tree/main/pub/stable) | CupangOs Firmware |
| ---- | ---- | ---- | ---- |
| s905x | [HG680P], [B860H] | 5.4.178_5.10.99_5.15.22_5.16.8 | CupangOs_k*.img |


<h1 align="center" style="font-weight: bold">Firmware information</h1>

| Name | Value |
| ---- | ---- |
| Default IP | 192.168.1.1 |
| Default username | root |
| Default password | root |
| Default WIFI name | CupangOs |
| Default WIFI password | none |

<h1 align="center" style="font-weight: bold">Bypass gateway settings</h1>

If used as a bypass gateway, you can add custom firewall rules as needed (Network → Firewall → Custom Rules):

```yaml
iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE        #If the interface is eth0.
iptables -t nat -I POSTROUTING -o br-lan -j MASQUERADE      #If the interface is br-lan bridged.
```

<h1 align="center" style="font-weight: bold">CupangOs by thecupangin</h1>
<img src="https://img.shields.io/github/issues/thecupangin/cupang?color=green">
<img src="https://img.shields.io/github/stars/thecupangin/cupang?color=yellow">
<img src="https://img.shields.io/github/forks/thecupangin/cupang?color=orange">
<img src="https://img.shields.io/github/license/thecupangin/cupang?color=ff69b4">
<img src="https://img.shields.io/github/languages/code-size/thecupangin/cupang?color=blueviolet">
</div>

