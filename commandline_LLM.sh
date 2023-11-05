#!/bin/bash
python3 - <<'EOF'

import json

with open('series.json', 'r') as file:
    series_with_total_books_count = sorted([
        {
            'id': series['id'],
            'title': series['title'],
            'total_books_count': sum(int(work.get('books_count', 0)) for work in series.get('works', []))
        }
        for line in file
        for series in [json.loads(line)]
    ], key=lambda series: series['total_books_count'], reverse=True)[:5]

    print("----------------------------------------------------------")
    print("id          title                       total_books_count")
    print("----------------------------------------------------------")
    for series in series_with_total_books_count:
    	print(f'{series["id"]} | {series["title"]} | {series["total_books_count"]}')
    print("----------------------------------------------------------")
 
EOF
