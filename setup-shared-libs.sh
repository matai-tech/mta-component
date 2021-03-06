TARGET="$1"
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p "$TARGET/matai-pro"
rsync -av --exclude=".*" "$ROOT/publish/" "$TARGET/matai-pro" > /dev/null 2>&1

for lib in "@angular/animations" "@angular/common" "@angular/compiler" "@angular/core" "@angular/forms" "@angular/http" "@angular/platform-browser" "@angular/platform-browser-dynamic" "@angular/router" "@angular/cli" "@angular/compiler-cli" "rxjs" "typescript" "zone.js" "core-js" "three"
do
  mkdir -p "$TARGET/$lib"
  rsync -av --exclude=".*" "$ROOT/node_modules/$lib/" "$TARGET/$lib" > /dev/null 2>&1
  rm -rf "$TARGET/$lib/node_modules"
done
