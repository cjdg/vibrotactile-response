#!/bin/bash

current_dir="${PWD##*/}"

if [ -d linux-aarch64 ]; then
	mv linux-aarch64 "$current_dir-linux-aarch64"
fi

if [ -d linux-arm ]; then
	mv linux-arm "$current_dir-linux-arm"
fi

if [ -d linux-amd64 ]; then
	mv linux-amd64 "$current_dir-linux-amd64"
fi

if [ -d windows-amd64 ]; then
	mv windows-amd64 "$current_dir-windows-amd64"
fi

if [ -d "$current_dir-linux-aarch64" ]; then
	echo "Compressing linux-aarch64..."
	tar cvfzR "$current_dir-linux-aarch64.tar.gz" "$current_dir-linux-aarch64/"
fi

if [ -d "$current_dir-linux-amd64" ]; then
	echo "Compressing linux-amd64..."
	tar cvfzR "$current_dir-linux-amd64.tar.gz" "$current_dir-linux-amd64/"
fi

if [ -d "$current_dir-linux-arm" ]; then
	echo "Compressing linux-arm..."
	tar cvfzR "$current_dir-linux-arm.tar.gz" "$current_dir-linux-arm/"
fi

if [ -d "$current_dir-windows-amd64" ]; then
	echo "Compressing windows-amd64..."
	tar cvfzR "$current_dir-windows-amd64.zip" "$current_dir-windows-amd64/"
fi

rm -Rv "$current_dir-linux-aarch64/"
rm -Rv "$current_dir-linux-amd64/"
rm -Rv "$current_dir-linux-arm/"
rm -Rv "$current_dir-windows-amd64/"
