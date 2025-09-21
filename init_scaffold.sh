#!/usr/bin/env bash
# Uso: ./init_scaffold.sh [nombre_proyecto]
set -euo pipefail

PROJ="${1:-l2-messenger}"

mkdir -p "$PROJ"/{src/l2msg/{cli,core,net,discovery,session,transfer,storage,utils},tests/{unit,integration},scripts,bin,docs,configs,docker/{virtual-lab,macvlan}}

# Archivos base
cat > "$PROJ/README.md" <<'MD'
# L2 Messenger (stdlib Python)
Mensajería y transferencia de archivos en Capa de Enlace (Ethernet) usando solo biblioteca estándar.
MD

cat > "$PROJ/.gitignore" <<'GI'
__pycache__/
*.pyc
.env
/.venv
/dist
/build
GI

# Paquete Python
touch "$PROJ/src/l2msg/__init__.py"

cat > "$PROJ/src/l2msg/cli/__main__.py" <<'PY'
#!/usr/bin/env python3
# CLI mínima de arranque (solo stdlib)
import sys

def main():
    print("l2msg CLI — placeholder")
    print("Comandos esperados: discover | peers | listen | chat <MAC> <msg> | send <MAC> <path>")
    return 0

if __name__ == "__main__":
    sys.exit(main())
PY
chmod +x "$PROJ/src/l2msg/cli/__main__.py"

# Stubs de módulos (solo nombres; implementar luego)
for f in protocol frame codec crypto; do
  cat > "$PROJ/src/l2msg/core/${f}.py" <<PY
# ${f}.py — stub (definir MAGIC, VERSION, tipos de mensaje, headers, CRC, etc.)
PY
done

for f in raw_socket iface filter; do
  cat > "$PROJ/src/l2msg/net/${f}.py" <<PY
# ${f}.py — stub (AF_PACKET, bind a interfaz, selección por EtherType, etc.)
PY
done

for d in discovery session transfer storage utils; do
  cat > "$PROJ/src/l2msg/${d}/__init__.py" <<PY
# ${d} — paquete
PY
done

# Tests base (unittest del stdlib)
cat > "$PROJ/tests/unit/test_smoke.py" <<'PY'
import unittest

class SmokeTest(unittest.TestCase):
    def test_truth(self):
        self.assertTrue(True)

if __name__ == "__main__":
    unittest.main()
PY

# Scripts útiles
cat > "$PROJ/bin/run-node" <<'SH'
#!/usr/bin/env bash
set -euo pipefail
# Ejecuta el "daemon/CLI" temporal (placeholder)
python3 -m l2msg.cli
SH
chmod +x "$PROJ/bin/run-node"

# Docker (laboratorio virtual)
cat > "$PROJ/docker/virtual-lab/compose.yml" <<'YML'
services:
  node1:
    build: ../..
    command: ["python","-m","l2msg.cli"]
    cap_add: [ "NET_RAW", "NET_ADMIN" ]
    networks: [ "l2lab" ]
  node2:
    build: ../..
    command: ["python","-m","l2msg.cli"]
    cap_add: [ "NET_RAW", "NET_ADMIN" ]
    networks: [ "l2lab" ]

networks:
  l2lab:
    driver: bridge
YML

cat > "$PROJ/docker/Dockerfile" <<'DOCKER'
FROM python:3.12-slim
WORKDIR /app
COPY src ./src
ENV PYTHONPATH=/app/src
CMD ["python","-m","l2msg.cli"]
DOCKER

# Docker (macvlan) — guía
cat > "$PROJ/docker/macvlan/README.md" <<'MD'
**macvlan**: crea una red con `docker network create -d macvlan ... -o parent=eth0`.
Asigna contenedores a esa red para pruebas sobre la LAN física. Añade `cap_add: [NET_RAW, NET_ADMIN]`.
MD

# Configs
cat > "$PROJ/configs/app.example.toml" <<'TOML'
[app]
ether_type = "0x88B5"   # experimental/local use
iface = "eth0"          # adapta a tu entorno
mtu_safe = 1400
TOML

echo "✅ Estructura creada en: $PROJ"
