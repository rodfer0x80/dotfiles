#!/usr/bin/env python
import glob
import cv2
import pandas as pd
import pathlib
import sys


def read_qrcode(filename: str):
    try:    
        img = cv2.imread(filename)
        detect = cv2.QRCodeDetector()
        value, points, straight_qrcode = detect.detectAndDecode(img)
        return value
    except:
        return -2


def read_dir_qrcodes(fmt: 'jpg'):
    df = pd.DataFrame(columns=['filename', 'qr'])
    files = glob.glob(f'data/*.{fmt}')
    for file in files:
        qr = read_qr_code(file)
        row = {'filename': file, 'qr': qr}
        df = df.append(row, ignore_index=True)
    return df.head()


def main():
    if len(sys.argv) != 2:
        return -1
    else:
        filename = sys.argv[1]
    value = read_qrcode(filename)
    if value != -2:
        sys.stdout.write(value)
    else:
        return -2
    return 0

if __name__ == '__main__':
    sys.exit(main())
