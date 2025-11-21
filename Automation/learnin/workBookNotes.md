
## 1. What is OpenPyXL

* A Python library to work with Excel files
* You read, write, update, and format Excel sheets
* Works with `.xlsx` files
* No need to open Excel


## 2. How to import

```
import openpyxl
from openpyxl import Workbook, load_workbook
```

* `Workbook()` creates a new Excel file
* `load_workbook()` opens an existing Excel file


## 3. Create a new workbook

```
wb = Workbook()
ws = wb.active
ws.title = "Data"
wb.save("file.xlsx")
```

Key points

* `active` gives you the default sheet
* `title` changes sheet name
* `save()` writes the file


## 4. Load an existing workbook

```
wb = load_workbook("Grades.xlsx")
ws = wb.active
```

* Opens the file
* Selects the active sheet


## 5. Read specific cells

```
print(ws["A1"].value)
print(ws["B1"].value)
```

* `"A1"` means column A, row 1
* `.value` gives the content


## 6. Write into a cell

```
ws["A1"] = "Name"
wb.save("Grades.xlsx")
```

* Changes the value
* Must save, or the change is lost


## 7. List all sheet names

```
print(wb.sheetnames)
```

Shows all sheets in the file.


## 8. Access a specific sheet

```
ws = wb["Sheet1"]
```

Use the sheet name to select it.


## 9. Create a new sheet

```
wb.create_sheet("S_openpyxl")
wb.save("Grades.xlsx")
```

Creates a new sheet in the file.


## 10. Append a new row

```
ws.append(["Tim", "is", "nice"])
```

Adds a full row at the bottom.


## 11. Access multiple cells with loops

```
from openpyxl.utils import get_column_letter

for row in range(1,6):
    for col in range(1,6):
        cell = get_column_letter(col) + str(row)
        ws[cell] = cell
```

Points

* `get_column_letter(1)` returns `A`
* You fill coordinates like A1, B1, C1, etc.


## 12. Insert and delete rows

```
ws.insert_rows(5)
ws.delete_rows(3)
```


## 13. Insert and delete columns

```
ws.insert_cols(2)
ws.delete_cols(4)
```


## 14. Merge and unmerge

```
ws.merge_cells("A1:C1")
ws["A1"] = "Heading"

ws.unmerge_cells("A1:C1")
```

After unmerge

* A1 keeps the value
* B1, C1 become empty


## 15. Save changes always

```
wb.save("file.xlsx")
```

If you forget this, nothing updates.


# Your teaching summary

Here is a clean set of bullet points you can speak while teaching:

* OpenPyXL lets you automate Excel using Python
* Load an existing file using `load_workbook`
* Create a new file using `Workbook()`
* Use `.active` to get the main sheet
* Read and write cells using `"A1"` style
* Use `.append` to add rows
* Use `.sheetnames` to see all sheets
* Create sheets with `.create_sheet()`
* Change sheet title with `.title`
* Insert and delete rows and columns
* Merge and unmerge cells
* Use `get_column_letter` when looping
* Always save at the end

This is simple, structured, and easy to teach.

If you want, I can convert this into a **10-minute teaching script** you can speak word-for-word.
