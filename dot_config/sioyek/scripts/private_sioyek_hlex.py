import sqlite3
from pathlib import Path
import sys


def export_highlights(db_path, pdf_path):
    # Verbindung zur SQLite-Datenbank herstellen
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    # Highlights für die spezifische PDF-Datei abfragen
    query = """
    SELECT page_number, description 
    FROM highlights 
    WHERE document_path = ? 
    ORDER BY page_number;
    """
    cursor.execute(query, (pdf_path,))
    highlights = cursor.fetchall()
    conn.close()

    # Sicherstellen, dass Highlights vorhanden sind
    if not highlights:
        print(f"No highlights found for {pdf_path}")
        return

    # Markdown-Datei im gleichen Ordner wie die PDF erstellen
    pdf = Path(pdf_path)
    output_path = pdf.with_name(pdf.stem + "_hl.md")
    with open(output_path, "w") as f:
        f.write(f"# Highlights from {pdf.name}\n\n")
        for page, description in highlights:
            f.write(f"- **Page {page}**: {description.strip()}\n")

    print(f"Highlights saved to {output_path}")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(
            "Usage: python sioyek_export_highlights.py /path/to/data.db /path/to/document.pdf"
        )
        sys.exit(1)

    db_path = sys.argv[1]
    pdf_path = sys.argv[2]

    if not Path(db_path).exists():
        print(f"Database file not found: {db_path}")
        sys.exit(1)
    if not Path(pdf_path).exists():
        print(f"PDF file not found: {pdf_path}")
        sys.exit(1)

    export_highlights(db_path, pdf_path)
