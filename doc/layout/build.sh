#!/bin/bash
# build.sh - レイアウト図をビルドしてPNGを生成
#
# 使用方法:
#   ./build.sh
#
# 必要なツール:
#   - LuaLaTeX
#   - ImageMagick (magick コマンド)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "=== レイアウト図ビルド ==="

# layout.texをビルド
echo "layout.texをビルド中..."
lualatex -interaction=nonstopmode layout.tex
rm -f layout.aux layout.log

# PDFからPNGを生成（白背景、透明なし）
echo "PNGを生成中..."
magick -density 150 'layout.pdf[0]' -alpha remove -alpha off -quality 90 layout.png

echo "完了: layout.png"
