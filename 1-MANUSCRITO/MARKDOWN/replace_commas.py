import re
import os

print("Current dir:", os.getcwd())
print("Files:", os.listdir('.'))

with open('artigo.md', 'r', encoding='utf-8') as f:
    content = f.read()

print("Lines with 9,87:")
print([line for line in content.split('\n') if '9,87' in line])

print("All matches:")
matches = re.findall(r'\d+,\d+', content)
print(matches)

content = re.sub(r'(\d+),(\d+)', r'\1.\2', content)

with open('artigo.md', 'w', encoding='utf-8') as f:
    f.write(content)

print("Replaced all decimal commas with periods.")