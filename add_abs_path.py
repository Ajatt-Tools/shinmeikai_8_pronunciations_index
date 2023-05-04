import sys
import json

json_path, media_dir_abs = sys.argv[1:]

with open(json_path, encoding='utf8') as f:
    data = json.load(f)

data['meta']['media_dir_abs'] = media_dir_abs

with open(json_path, 'w', encoding='utf8') as f:
    json.dump(data, f, indent=4, ensure_ascii=False)
