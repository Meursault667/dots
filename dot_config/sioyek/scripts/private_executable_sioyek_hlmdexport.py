import pathlib
import json
import sys


def parse_document(document, base_name):
    lines = [f"# Highlights from {base_name}\n\n"]
    for highlight in document["highlights"]:
        page_number = highlight.get("page_number", "unknown")
        description = highlight["description"].strip()
        lines.append(f"- **Page {page_number}**: {description}\n")
    return lines


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(
            "Usage: python sioyek_highlight_export.py /path/to/sioyek/export/data.json"
        )
        sys.exit(1)

    sioyek_export_data = pathlib.Path(sys.argv[1])
    assert (
        sioyek_export_data.exists()
    ), f"The Sioyek export data JSON file does not exist at {sioyek_export_data}"

    with open(sioyek_export_data, "r") as f:
        data = json.load(f)

    current_pdf = data["current_file"]
    documents = [doc for doc in data["documents"] if doc["path"] == current_pdf]
    if not documents:
        print("No highlights found for the current file.")
        sys.exit(1)

    document = documents[0]
    pdf_path = pathlib.Path(document["path"])
    output_path = pdf_path.with_name(pdf_path.stem + "_hl.md")

    lines = parse_document(document, pdf_path.name)
    with open(output_path, "w") as f:
        f.writelines(lines)

    print(f"Highlights saved to {output_path}")
