#!/bin/bash
python3 - <<'EOF'

import json

def get_total_books_count(series):
    total_books_count = 0
    for work in series['works']:
        total_books_count += int(work['books_count'])
    return total_books_count

def main():
    series_with_total_books_count = []

    with open('series.json', 'r') as file:
        for line in file:
                series = json.loads(line)
                total_count = get_total_books_count(series)
                series_with_total_books_count.append({
                    'id': series['id'],
                    'title': series['title'],
                    'total_books_count': total_count
                })    
    series_with_total_books_count.sort(key=lambda series: series['total_books_count'], reverse=True)

    print("----------------------------------------------------------")
    print("id          title                       total_books_count")
    print("----------------------------------------------------------")
    for series in series_with_total_books_count[:5]:
        print(f'{series["id"]} | {series["title"]} | {series["total_books_count"]}')
    print("----------------------------------------------------------")

if __name__ == '__main__':
    main()

EOF
