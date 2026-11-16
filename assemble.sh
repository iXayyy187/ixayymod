#!/usr/bin/env bash
# Baut aus dem offiziellen Fabric-Beispielprojekt (Branch 26.2) + unserem Addon-Code ein Gradle-Projekt in _proj/.
# So stimmen Loom-, Gradle- und Fabric-API-Versionen automatisch.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/_proj"
rm -rf "$OUT"

git clone --depth 1 --branch 26.2 https://github.com/FabricMC/fabric-example-mod "$OUT" \
  || git clone --depth 1 https://github.com/FabricMC/fabric-example-mod "$OUT"
rm -rf "$OUT/.git" "$OUT/.github" "$OUT/src"

if grep -q "splitEnvironmentSourceSets" "$OUT/build.gradle"; then
  CODE="$OUT/src/client"
  CONF="clientCompileOnly"
else
  CODE="$OUT/src/main"
  CONF="compileOnly"
fi
echo "Quellordner: $CODE  (Konfiguration: $CONF)"

mkdir -p "$CODE/java" "$CODE/resources" "$OUT/src/main/resources" "$OUT/libs"
cp -r "$ROOT/addon/java/." "$CODE/java/"
cp "$ROOT/addon/resources/namestyleplus.mixins.json" "$CODE/resources/"
cp "$ROOT/addon/resources/fabric.mod.json" "$OUT/src/main/resources/"
cp "$ROOT/libs/namestyle-1.0.0.jar" "$OUT/libs/"

cat >> "$OUT/build.gradle" <<EOF

dependencies {
	$CONF files('libs/namestyle-1.0.0.jar')
}
EOF

sed -i -E 's/^archives_base_name[[:space:]]*=.*/archives_base_name=namestyle-plus/; s/^mod_version[[:space:]]*=.*/mod_version=1.0.0/' "$OUT/gradle.properties"
chmod +x "$OUT/gradlew"
echo "Fertig. Jetzt in _proj: ./gradlew build"
