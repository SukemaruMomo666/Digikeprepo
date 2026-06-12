import pandas as pd
import os

file_path = 'database/seeders/data/data-master/DATA MASTER_INI RIL.xlsx'
output_dir = 'database/seeders/data/csv-master'

if not os.path.exists(output_dir):
    os.makedirs(output_dir)

xl = pd.ExcelFile(file_path)

for sheet in xl.sheet_names:
    if sheet == 'Sheet1' or not sheet.strip():
        continue
    
    df = pd.read_excel(file_path, sheet_name=sheet)
    
    # Handle merged cells or empty keys by forward filling
    key_cols = {
        'Detail SDKI': ['Kode SDKI', 'Nama SDKI'],
        'Detail SLKI': ['Kode SLKI', 'Nama SLKI'],
        'Detail SIKI': ['Kode SDKI', 'Kode SIKI', 'Nama SIKI'],
        'Data Rapi': ['Kode SDKI', 'Nama SDKI', 'Kode SLKI', 'Nama SLKI']
    }
    
    if sheet in key_cols:
        for col in key_cols[sheet]:
            if col in df.columns:
                df[col] = df[col].ffill()
    
    # Remove audit columns and metadata
    cols_to_keep = [c for c in df.columns if not str(c).startswith('Column') and 'AUDIT' not in str(c) and str(c) != 'No' and str(c) != 'No.' and 'Baris' not in str(c) and 'Kolom' not in str(c) and 'Tingkat' not in str(c) and 'Masalah' not in str(c)]
    
    df_clean = df[cols_to_keep]
    
    csv_name = sheet.lower().replace(' ', '_') + '.csv'
    df_clean.to_csv(os.path.join(output_dir, csv_name), index=False)
    print(f"Converted {sheet} to {csv_name}")
