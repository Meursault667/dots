"""Export highlights made with the Sioyek PDF viewer
(https://github.com/ahrm/sioyek/) as a text document.
Copyright (C) 2024 by Paul Brodersen.
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.  See the GNU General Public License for more details. You
should have received a copy of the GNU General Public License along
with this program. If not, see <https://www.gnu.org/licenses/.
Usage
-----
1. Export Sioyek data as a JSON.
   1.1. Press ':'.
   1.2. Type 'export'.
   1.3. Press 'enter'.
   1.4. Save JSON file in a location of your choice.
2. Run this script.
   a) To save out highlights for all files:
   python /path/to/script.py /path/to/sioyek/data.json --output /path/to/output.txt
   b) To save out highlights for a single file:
   python /path/to/script.py /path/to/sioyek/data.json --file /path/to/paper.pdf --output /path/to/output.txt
Output
------
The text output file contains the highlights for all documents
highlighted with Sioyek, unless the '--file' flag is used to specify a
single document. The text output file is contains text blocks, one for
each document, separated by two new lines. The first line in each
block specifies the path to the document, subsequent lines contain the
highlighted text, with one highlight per line. For two documents with
three (a, b, c) and two highlighted sections (d, e), respectively,
this results in the following structure:
/path/to/document.pdf
aaaaa aaa aaaaaaaaaaaaa aaaa aaa aaaaaaa
bbbb bbbbb bbbbb bbbbb bbbbbbbb bbbbb
cccccc ccccccccc ccccc cccc ccc ccccc cccccccc cccccc
/path/to/another/document.pdf
ddddddddddd ddd ddddddd dddd dddddddd
eeeeeeeeeeeeeeeeeeeee eee ee eeee ee eeeee
Notes
-----
Highlights in the Sioyek data base are stored in order of their
creation, and the output text file mirrors this structure. Highlights
may thus appear to be out of order w.r.t. the original text, if they
weren't also created in that order.
"""

import pathlib
import json

from argparse import ArgumentParser


def parse_document(document):
    lines = []
    lines.append(document["path"] + "\n")
    for highlight in document["highlights"]:
        lines.append(highlight["description"] + "\n")
    return lines


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("sioyek_export_data", help="/path/to/sioyek/export/data.json")
    parser.add_argument("-f", "--file", help="/path/to/paper.pdf", default=None)
    parser.add_argument(
        "-o", "--output", help="/path/to/output.txt", default="output.txt"
    )
    args = parser.parse_args()

    sioyek_export_data = pathlib.Path(args.sioyek_export_data)
    assert sioyek_export_data.exists(), f"The sioyek export data JSON file does not exist at the given location ({sioyek_export_data})"

    with open(sioyek_export_data, "r") as f:
        data = json.load(f)

    if args.file is not None:
        documents = [
            document for document in data["documents"] if document["path"] in args.file
        ]
    else:
        documents = data["documents"]

    lines = []
    for document in documents:
        lines.extend(parse_document(document))
        lines.extend("\n\n")

    with open(args.output, "a") as f:
        f.writelines(lines)
