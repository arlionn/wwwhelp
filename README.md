## ihelp and wwwhelp commands

> Chen Yongli, **Lian Yujun***.Browse and cite Stata manuals easily: the wwwhelp command. **Stata Journal**, 2024, 24 (1): 161–168. [-PDF-](https://file-lianxh.oss-cn-shenzhen.aliyuncs.com/Refs/LianPub/Chen-Lian-2024-SJ-wwwhelp-ihelp.pdf), [Link](https://doi.org/10.1177/1536867X241233676), [Google](<https://scholar.google.com/scholar?q=Browse and cite Stata manuals easily: The wwwhelp command>), [-Appendix-](https://github.com/arlionn/wwwhelp/blob/main/docs/Chen-Lian-2024-wwwhelp-SJ-online_appendix.pdf)

Note: This document is transfered from **ihelp.sthlp** using ChatGPT 4o. [Click here](https://chatgpt.com/share/98f90cfa-5890-463b-9fd6-a4ed89724234) to view the Prompts.


## Description

`ihelp` is a wrapper for the `help` command, offering a quick and convenient way to access online **HTML** or **PDF** versions of Stata's official **help files**. `ihelp` is a shorter version of `wwwhelp`, offering the same functionality but easier to remember and type. 

- Simply type `ihelp xtreg`, and Stata will open [xtreg.pdf](https://www.stata.com/manuals/xtxtreg.pdf).
- Type `ihelp xtreg, md`, and it will generate and copy the Markdown text `[**[XT]** xtreg](https://www.stata.com/manuals/xtxtreg.pdf)` to your clipboard. You can then paste it into your Markdown editor with `Ctrl+V`.

### why ihelp?
The default `help` command in Stata only displays help files within the Stata interface, which is not ideal for sharing. `ihelp` allows these files to be accessed and used outside of Stata. 

`ihelp` also offers various formatting options, including `markdown`, `txt`, `ms`, `latex`, `texfull`, and `format(#)`. These formats provide web links to the online help files and automatically copy the desired format to the clipboard. Additionally, `ihelp` can handle command abbreviations and list similar commands when an abbreviation is ambiguous.

In short, just add `i` or `www` before `help`, and you can enjoy Stata's extensive help resources online.

### Install

The `ihelp` command can be installed from SSC, while `wwwhelp` is hosted on the Stata Journal server. 

To install `ihelp` from SSC:
  ```stata
  ssc install ihelp
  ```

To install `wwwhelp` from the Stata Journal server:
  ```stata
  net install pr0079.pkg, replace all
  ```
which will download the following files:
  ```stata
. net des pr0079.pkg

package pr0079 from http://www.stata-journal.com/software/sj24-1

TITLE
      SJ24-1 pr0079. Open the online help file or PDF ...
      DOI:  10.1177/1536867X241233676

INSTALLATION FILES              (type net install pr0079)
      pr0079/hhelp.ado
      pr0079/hhelp.sthlp
      pr0079/wwwhelp.ado
      pr0079/wwwhelp_cn.sthlp
      pr0079/wwwhelp.sthlp

ANCILLARY FILES                 (type net get pr0079)
      pr0079/online_appendix.pdf
      pr0079/wwwhelp.do
  ```


## Syntax

```Stata 
ihelp command_name [, 
      web markdown txt ms 
      texfull latex 
      format(#) clipoff]
```

- `web`: Quickly open a simple HTML version, which by default opens a detailed PDF document.
- `markdown`: Provide the web link to the online help document in Markdown format.
- `txt`: Provide the web link in plain text format, which can be pasted into the dialog box of Facebook or WeChat for Chinese users.
- `ms`: Copy rich text punctuated with links to the clipboard, which can be pasted into Microsoft documents.
- `texfull`: Provide the web link in LaTeX full syntax format.
- `latex`: Provide the web link in LaTeX compact format.
- `format(#)`: Provide the web link in preset formats, including three modes.
- `clipoff`: Do not copy the link to the clipboard.


## Options

### Main Options

- `web`: Quickly open a simple HTML version, which by default opens a detailed PDF document.

### Formatting Options

Provide web links to online help documents, which can be put into specific formats and automatically copied to the clipboard.

- `markdown`: Display the web link in Markdown format. For example, `ihelp regress, markdown` displays the text in the following format:
  ```Markdown
  [**[R]** regress](https://www.stata.com/manuals/rregress.pdf)
  ```
  It can be copied to a Markdown file and displayed as a clickable link as:  
  > [**[R]** regress](https://www.stata.com/manuals/rregress.pdf)

- `txt`: Display the web link in text (command:URL) format. For example, `ihelp regress, txt` displays the text in the following format:
  ```Markdown 
  [R] regress: https://www.stata.com/manuals/rregress.pdf
  ```
  It can be copied to the dialog box of Facebook or WeChat for Chinese users as:
  > [R] regress: https://www.stata.com/manuals/rregress.pdf
  

- `ms`: Send a rich text punctuated with links to the clipboard, which can be pasted easily into Microsoft Word. For example, `ihelp regress, ms` will appear as a clickable link when pasted into Microsoft Word.
  ```
  [R] regress: https://www.stata.com/manuals/rregress.pdf
  ```
  Note: This option requires Stata 16 or newer and Python installed, and is currently only available for Windows systems.

- `texfull`: Display the web link in full TeX text format. For example, `ihelp regress, texfull` displays the text in the following format:
  ```
  \href{https://www.stata.com/manuals/rregress.pdf}{\bfseries{[\MakeUppercase{r}] regress}}
  ```
  It can be inserted into a **.tex** document and displayed as a clickable link in the PDF file when compiled using a TeX editor as:
  > [**[R]** regress](https://www.stata.com/manuals/rregress.pdf)

- `latex`: Display the web link in LaTeX format. For example, `ihelp regress, latex` displays the text in the following format:
  ```
  \stihelp[r]{regress}
  ```
  It can be inserted into a .tex document and displayed as a clickable link in the PDF file when compiled using a TeX editor.
  Note: `\stihelp` is a user-defined command that needs to be defined in the introductory section of the .tex document:
  ```
  \newcommand{\stihelp}[2][r]{\href{https://www.stata.com/manuals/#1#2.pdf}{\bfseries{[\MakeUppercase{#1}] #2}}}
  ```

- `format(#)`: Display web links in three supporting Markdown preset formats.
  - `format(1)` renders as `[**[R]** regress](https://www.stata.com/manuals/rregress.pdf)`
  - `format(2)` renders as `[regress](https://www.stata.com/manuals/rregress.pdf)`
  - `format(3)` renders as `[help regress](https://www.stata.com/manuals/rregress.pdf)`

- `clipoff`: Deselect copying to the clipboard.

---

## Examples

**Basic use**: Open help document
  ```stata
  . ihelp pwcorr
  . ihelp clip(), web
  . ihelp mata function
  . ihelp twoway scatter, web
  . ihelp sum
  ```

**Auxiliary use**: Provide web link
  ```stata
  . ihelp twoway scatter, m
  . ihelp import excel, w web
  . ihelp xtreg, latex
  . ihelp xtreg, tex
  . ihelp xtreg, f(2)
  . ihelp xtreg, f(3) clipoff
  ```

## Stored Results

You can view the stored results through `return list` (see `help return`) after using `ihelp`:

- `r(link)`: Web links (URLs) to PDF help documents
- `r(link_web)`: Web links (URLs) to web versions of help documents
- `r(link_m)`: Markdown formatted web link text
- `r(link_txt)`: Command:URL formatted web link text
- `r(link_l1)`: LaTeX raw formatted web link text
- `r(link_l2)`: LaTeX custom-formatted web link text
- `r(link_f1)`: First pre-formatted web link text
- `r(link_f2)`: Second pre-formatted web link text
- `r(link_f3)`: Third pre-formatted web link text


## Author

- **Yujun Lian (连玉君)**
  - Lingnan College, Sun Yat-Sen University, China.
  - E-mail: [arlionn@163.com](mailto:arlionn@163.com)
  - Blog: [lianxh.cn](https://www.lianxh.cn)

- **Yongli Chen (陈勇吏)**
  - Antai College of Economics and Management, Shanghai Jiao Tong University, China.
  - E-mail: [yongli_chan@163.com](mailto:yongli_chan@163.com)



## Citation

- Chen Yongli, **Lian Yujun***.Browse and cite Stata manuals easily: the wwwhelp command. **Stata Journal**, 2024, 24 (1): 161–168. [-PDF-](https://file-lianxh.oss-cn-shenzhen.aliyuncs.com/Refs/LianPub/Chen-Lian-2024-SJ-wwwhelp-ihelp.pdf), [Link](https://doi.org/10.1177/1536867X241233676), [Google](<https://scholar.google.com/scholar?q=Browse and cite Stata manuals easily: The wwwhelp command>), [-Appendix-](https://github.com/arlionn/wwwhelp/blob/main/docs/Chen-Lian-2024-wwwhelp-SJ-online_appendix.pdf)



## Also See

- Online: `help`, `findit`, `search`
