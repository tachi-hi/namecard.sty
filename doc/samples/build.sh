#!/bin/bash
# build.sh - サンプルをビルドしてPNGを生成
#
# 使用方法:
#   ./build.sh
#
# 必要なツール:
#   - LuaLaTeX
#   - ImageMagick (magick コマンド)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

cd "$ROOT_DIR"

echo "=== サンプルビルド ==="

# sample.texをビルド
echo "sample.texをビルド中..."
lualatex -interaction=nonstopmode sample.tex
rm -f sample.aux sample.log

# PDFをdoc/samples/にコピー
cp sample.pdf "$SCRIPT_DIR/"

# PNGを生成（白背景、透明なし）
cd "$SCRIPT_DIR"
echo "PNGを生成中..."
magick -density 150 'sample.pdf[0]' -alpha remove -alpha off -quality 90 sample.png

echo "完了: sample.png"
