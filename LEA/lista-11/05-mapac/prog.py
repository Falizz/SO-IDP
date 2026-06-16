#!/usr/bin/env python3
import pexpect
import re
import sys

child = pexpect.spawn('/desafio/exercicio', encoding='utf-8', timeout=10)
child.logfile_read = sys.stdout

for _ in range(3):
    child.expect(r'\[>\] Resposta:')
    block = child.before

    unit_match = re.search(r'Unidade de aloca.*?(\d+) bytes', block)
    unit = int(unit_match.group(1))

    bitmap_lines = re.findall(r'([01]{8,})', block)
    bitmap = ''.join(bitmap_lines)

    zeros = bitmap.count('0')
    answer = zeros * unit

    child.sendline(str(answer))

child.expect(pexpect.EOF)
print(child.before)