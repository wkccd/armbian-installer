# armbian-installer
它是一个基于Debian Live系统的img镜像安装器。采用github action构建打包。目前实现了在x86-64设备上 快速安装armbian和openwrt的功能。 

## 背景解读
- 嵌入式设备的系统通常采用img格式,一般出现在ARM设备中，安装方式通常是线刷、烧录SD卡等方式。
- 但近年来，openwrt 和 armbian 也逐渐兼容适配通用型x86-64设备,随着软路由和NAS虚拟机逐渐普及。
- 显然针对ARM设备的烧录方法 不太适合x86-64设备（含虚拟机）。无论是借助PE还是借助dd 都需要传递固件文件。显得低效和复杂。
- 如何让openwrt/armbian/LibreELEC等小众x86-64的Linux系统 像安装普通系统一样简单呢 希望本项目给你一个满意的答案。

## 使用方式
1. 虚拟机使用：各种虚拟机直接选择iso即可
2. 物理机使用：建议将iso放入ventoy的U盘中
3. https://www.ventoy.net/cn/download.html
4. 视频教学：[![YouTube](https://img.shields.io/badge/YouTube-123456?logo=youtube&labelColor=ff0000)](https://youtu.be/6FWyACrNQIg)
[![Bilibili](https://img.shields.io/badge/Bilibili-123456?logo=bilibili&logoColor=fff&labelColor=fb7299)](https://www.bilibili.com/video/BV1DQXVYFENr)
- 【第二集】https://youtu.be/RRBFc58SwXQ
- https://www.bilibili.com/video/BV1gPXCYyEc2
6. 具体的操作方法是:在安装器所在系统里输入 `ddd` 命令 方可调出安装菜单
   ![localhost lan - VMware ESXi 2025-03-20 10-14-45](https://github.com/user-attachments/assets/ddae80a0-9ff5-4d63-83b5-1f49da18b008)


## 项目说明和相关Feature
1. 此项目生成的ISO同时 支持物理机 和 虚拟机
2. 此项目可分别生成armbian 和 openwrt 两种安装器
3. 其中OpenWrt分为istoreos、immortalwrt、EzOpWrt、eSirOpenWrt 安装器。实际上安装任意一种即可，因为换固件可在网页里随时换。
4. istoreos 在虚拟机上并没有安装器,因此本项目算是一种补充。（物理机安装istoreos就可以忽略本项目了）
5. armbian 安装器 目前构建2种 一种是minimal 一种是标准版 较低配置的x86-64设备建议使用minimal 比如（wyse3040瘦客户机）
6. 未来可能融入自编译armbian的流程



## ISO自动制作流程
本项目也是基于开源项目[debian-live](https://github.com/dpowers86/debian-live)制作.因此我的代码也是全程开源 MIT协议不变。
1. 首先构建一个debian live系统 该系统带EFI引导。
2. 在该系统内融入我们需要的img镜像和自己制作的dd写盘脚本。一起打包到filesystem.squashfs文件系统中。该过程包含了压缩,从而保证了最终的体积较小。
3. 最后将新的squashfs文件和相关文件一起打包为ISO

## 项目参考
- https://willhaley.com/blog/custom-debian-live-environment/
- https://github.com/dpowers86/debian-live
- https://github.com/sirpdboy/openwrt/releases
- https://github.com/esirplayground

### DONATE&支持⬆️
[助力按钮](https://wkdaily.cpolar.top/01)
