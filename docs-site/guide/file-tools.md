# File tools (no computer needed)

Casama bots can crop, convert, read, query, chart, compress, OCR, redact, and edit files directly on the server — without waking a computer or using computer hours. Bots without a computer can use all of these tools too.

## What runs in the worker (instant)

- **Pictures (`media.image.look`, `media.image.edit`):** crop, resize, rotate, flip, convert (PNG, JPEG, WebP), compress to a target file size (e.g. under 1 MB), strip EXIF/location metadata.
- **Reading documents (`documents.read`):** PDF, Word (`.docx`), Excel (`.xlsx`), PowerPoint (`.pptx`), CSV, Markdown, HTML, and plain text.
- **PDFs (`documents.pdf`):** combine PDFs and images, keep/reorder/drop pages, rotate, split, fill PDF forms, and stamp text, watermarks, page numbers, or signature images.
- **Creating files (`documents.make`):** PDF, Word (`.docx`), calendar invites (`.ics`), and contact cards (`.vcf`).
- **Editing Word documents (`documents.edit`):** find-and-replace text inside `.docx` files while keeping original formatting, headers, and footers.
- **Spreadsheets (`sheets.make`, `sheets.edit`):** create and edit `.xlsx` workbooks (formulas, multiple sheets, number formats) and CSV files.
- **SQL over data (`data.query`):** run read-only SQL (totals, filters, grouping, joins) over CSV, Excel, and JSON files.
- **Charts (`media.chart.make`):** render Vega-Lite charts as PNG or SVG.
- **Archives (`documents.archive`):** zip and unzip files safely with zip-bomb and path-traversal limits.
- **QR codes (`media.qr.make`, `media.qr.read`):** create and read QR codes.

## What runs in isolated job boxes

Heavy native programs run in one-shot, networkless containers that are destroyed immediately after each job:

- **Video (`media.video.edit`):** trim, cut, compress, convert (MP4, WebM, GIF), crop, rotate, speed, mute, extract/replace audio, and grab still frames (ffmpeg).
- **Audio (`media.audio.edit`):** trim, convert (MP3, M4A, WAV, OGG), loudness normalization, fade, and speed (ffmpeg).
- **Document conversion (`documents.convert`):** Word, Excel, PowerPoint, ODF, RTF, HTML ↔ PDF, and Markdown ↔ Word (LibreOffice, pandoc).
- **PDF compression (`documents.compress`):** shrink, repair, or linearize PDFs (Ghostscript, qpdf).
- **OCR (`documents.ocr`):** turn scanned PDFs into searchable PDFs and extracted text (ocrmypdf, Tesseract).
- **PDF page images & redaction (`documents.pdf_images`, `documents.redact`):** render PDF pages to PNG/JPEG or permanently black out regions so underlying text is removed (Poppler).
- **HEIC & TIFF photos (`media.image.edit`):** iPhone HEIC and TIFF photos automatically convert via libheif/ImageMagick.

## Self-hosting

Worker tools work everywhere with no extra setup. Job boxes reuse the headless computer image and supervisor; set `FILE_JOBS=off` on the supervisor to disable them (bots fall back to `files.from_chat` + `shell.exec`).
