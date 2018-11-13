# output_util
This repository is to help output study logs for junior engineers ( except for "me" ! )

Mainly implemented at least cost for "my usecase", so feel free to customize it if needed.

## Scrapbox to markdown converter
```
$ git clone https://github.com/KIRAryo1/output_util.git
$ cd output_util
$ ruby sb2md.rb YOUR_FILE_NAME.in
```

You will obtain `YOUR_FILE_NAME.out` with Markdown style.

(Numerical formula can be used only in supported web sites)

- Headline (size is taken over)
- Inline bold style
- Numerical formula (both inline and one line)
  - Both inline and one line
  - Subscript _ is interpreted
- Embedded Gyazo
- Embedded picture
