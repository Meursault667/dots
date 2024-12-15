### Example with JQ

```json
[
  { "name": "Alice", "score": 85 },
  { "name": "Bob", "score": 92 },
  { "name": "Charlie", "score": 78 }
]
```

```bash
  jq -r '.[] | "| \(.name) | \(.score) |"' daten.json
```

```bash
  echo "| Name       | Score |"
  echo "|------------|-------|"
  jq -r '.[] | "| \(.name) | \(.score) |"' daten.json
```

### w/ sql

```bash
  sqlite3 datenbank.db -header -csv "SELECT name, score FROM students;" | awk -F, 'BEGIN {print "| Name       | Score |"; print "|------------|-------|"} {print "| " $1 " | " $2 " |"}'
```
