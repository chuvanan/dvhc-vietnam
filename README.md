

### Dữ liệu danh mục hành chính Việt Nam

* `dvhc-vietnam.xml`

* `dvhc-vietnam.csv`

* `dvhc-vietnam.json`


### Sử dụng

```console
curl https://raw.githubusercontent.com/chuvanan/dvhc-vietnam/master/dvhc-vietnam.xml -o dvhc-vietnam.xml
# or
curl https://raw.githubusercontent.com/chuvanan/dvhc-vietnam/master/dvhc-vietnam.csv -o dvhc-vietnam.csv
# or
curl https://raw.githubusercontent.com/chuvanan/dvhc-vietnam/master/dvhc-vietnam.json -o dvhc-vietnam.json
```

### Chuyển đổi XML sang CSV/JSON

```console
./converter.r dvhc-vietnam.xml csv
./converter.r dvhc-vietnam.xml json
```

### Nguồn

* http://qcvn109.gov.vn/ap-dung/du-lieu-xml-danh-muc-don-vi-hanh-chinh-viet-nam.html
