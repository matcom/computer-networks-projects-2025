#!/usr/bin/env python3
# CLI mínima de arranque (solo stdlib)
import sys

def main():
    print("l2msg CLI — placeholder")
    print("Comandos esperados: discover | peers | listen | chat <MAC> <msg> | send <MAC> <path>")
    return 0

if __name__ == "__main__":
    sys.exit(main())
