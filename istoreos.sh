#!/bin/bash
mkdir -p openwrt

REPO="wukongdaily/armbian-installer"
TAG="2025-03-12"
FILE_NAME="istoreos-24.10.0-2025041811-x86-64-squashfs-combined-efi.img.gz"
OUTPUT_PATH="openwrt/istoreos.img.gz"
DOWNLOAD_URL=$(curl -s https://api.github.com/repos/$REPO/releases/tags/$TAG | jq -r '.assets[] | select(.name == "'"$FILE_NAME"'") | .browser_download_url')

if [[ -z "$DOWNLOAD_URL" ]]; then
  echo "错误：未找到文件 $FILE_NAME"
  exit 1
fi

echo "下载地址: $DOWNLOAD_URL"
echo "下载文件: $FILE_NAME -> $OUTPUT_PATH"
curl -L -o "$OUTPUT_PATH" "$DOWNLOAD_URL"

if [[ $? -eq 0 ]]; then
  echo "下载istoreos成功!"
  echo "正在解压为:istoreos.img"
  gzip -d openwrt/istoreos.img.gz
  ls -lh openwrt/
  echo "准备合成 istoreos 安装器"
else
  echo "下载失败！"
  exit 1
fi

mkdir -p output
docker run --privileged --rm \
        -v $(pwd)/output:/output \
        -v $(pwd)/supportFiles:/supportFiles:ro \
        -v $(pwd)/openwrt/istoreos.img:/mnt/istoreos.img \
        debian:buster \
        /supportFiles/istoreos/build.sh
