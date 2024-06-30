{smcl}
{* 7Sep2021}{...}
{cmd:help wwwhelp}{right: ({browse "https://doi.org/10.1177/1536867X241233676":SJ24-1: pr0079})}
{hline}

{title:Title}

{p2colset 5 16 18 2}{...}
{p2col:{hi:wwwhelp} {hline 2}}Open the online help file or PDF
documentation for a specific command using the default browser{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 16 2}
{cmd:wwwhelp} {it:command} [{cmd:,} {it:options}]

{synoptset 12}{...}
{synopthdr}
{synoptline}
{synopt:{opt web}}quickly open the online help file; default is to
open the online PDF documentation{p_end}
{synopt:{opt m:arkdown}}Markdown format{p_end}
{synopt:{opt txt}}plain text format, which can be pasted into the dialog box of Facebook or WeChat for Chinese users{p_end}
{synopt:{opt ms}}copy rich text punctuated with links to the clipboard, which
can be pasted into Microsoft Word documents{p_end}
{synopt:{opt t:exfull}}TeX full-syntax format{p_end}
{synopt:{opt l:atex}}LaTeX compact format{p_end}
{synopt:{opt f:ormat(#)}}preset formats, including three modes{p_end}
{synopt:{opt c:lipoff}}do not copy the link to the clipboard{p_end}
{synoptline}
{p2colreset}{...}


{title:Description}

{pstd}
{cmd:wwwhelp} provides a quick and convenient way of opening online 
versions of Stata's official help files or PDF documentation.  The built-in
help file opened with the official command {helpb help} can be read only
through the Stata interface, which is not conducive to sharing and
dissemination.  {cmd:wwwhelp} fills this gap by allowing these help files to
be read and used independently of Stata.  Just add a {cmd:www} before the
{cmd:help} to turn it into {cmd:wwwhelp}, and then the documents that can be
opened directly using the {cmd:help} command can also be opened online using
{cmd:wwwhelp}.  You can access the online versions of both the PDF
documentation and the help files.

{pstd}
To enhance the convenience of citation, the {cmd:wwwhelp} command also
incorporates various formatting options, including {cmd:markdown}, {cmd:txt},
{cmd:ms}, {cmd:latex}, {cmd:texfull}, and {opt format()}, enabling users to
access web links to the online documentation or help files in their desired
format, which will be automatically copied to the clipboard.  Moreover,
{cmd:wwwhelp} can also deal with command abbreviation problems and list
commands similar to the specified command when the abbreviation cannot be
uniquely identified.

{pstd}
In brief, just add a {cmd:www} before {cmd:help}, and you can enjoy Stata's
powerful and desirable help files and PDF documentation.


{title:Options}

{phang}
{opt web} quickly opens an online help file.  The default is to open the
online PDF documentation.

{pstd}
Formatting options provide web links to online documents that can be put into
specific formats and automatically copied to the clipboard.{p_end}

{phang}
{opt markdown} displays the web link in Markdown format.  For example,
{cmd:wwwhelp regress, markdown} displays the text in the following
format:{p_end}

{pmore2} [**[R]** regress](https://www.stata.com/manuals/rregress.pdf) {p_end}

{pmore}
It can be copied to a Markdown file and displayed as a clickable link that
looks like
{browse `"https://www.stata.com/manuals/rregress.pdf"':[R] regress}.{p_end}

{phang}
{opt txt} displays the web link in text ({it:command}{cmd::} {it:URL}) format.
For example, {cmd:wwwhelp regress, txt} displays the text in the following
format:{p_end}

{pmore2}[R] regress: https://www.stata.com/manuals/rregress.pdf {p_end}

{pmore}
It can be copied to the dialog box of Facebook or WeChat for Chinese
users.{p_end}

{phang}
{opt ms} sends rich text punctuated with links to the clipboard, which can be
pasted easily to Microsoft Word.  For example, after using {cmd:wwwhelp}
{cmd:regress, ms}, you can press {it:Command}+{it:V} in Microsoft Word, and
the text will appear as a clickable link that looks like
{browse `"https://www.stata.com/manuals/rregress.pdf"':[R] regress}.{p_end}

{pmore}
However, this option has some limitations.  It requires Stata 16 or newer
versions of Stata to be installed.  It also requires Python because the
commands call the Windows API through Stata's interaction with Python, and it
is currently available only for Windows systems.  Otherwise, it will
automatically switch to the {opt txt} option, which displays plain text with
links that looks like {it:command}{cmd::} {it:URL}.

{phang}
{opt texfull} displays the web link in full TeX text format.  For example,
{cmd:wwwhelp regress, texfull} displays the text in the following format:{p_end}

{pmore2}
\href{https://www.stata.com/manuals/rregress.pdf}{\bfseries{[\MakeUppercase{r}] regress}}{p_end}

{pmore}
It can be inserted into a {cmd:.tex} document, which will be displayed as a
clickable link in the PDF file when compiled using a TeX editor.  It looks
like this:
{browse `"https://www.stata.com/manuals/rregress.pdf"':[R] regress}{p_end}

{phang}
{opt latex} displays the web link in LaTeX format.  For example, {cmd:wwwhelp}
{cmd:regress, latex} displays the text in the following format:{p_end}

{pmore2}\stwwwhelp[r]{regress}{p_end}

{pmore}
It can be inserted into a {cmd:.tex} document, which will be displayed as a
clickable link in the PDF file when compiled using a LaTeX editor.  It looks
like this:
{browse `"https://www.stata.com/manuals/rregress.pdf"':[R] regress}{p_end}

{pmore}
Note: Because {cmd:\stwwwhelp} is a new user-defined command, it needs to be
defined by adding the following code to the introductory section of the
{cmd:.tex} document:{p_end}

{pmore2}\newcommand{\stwwwhelp}[2][r]{{p_end}
{p 20 22 2}\href{https://www.stata.com/manuals/#1#2.pdf}{\bfseries{[\MakeUppercase{#1}] #2}}{p_end}
{pmore2}}{p_end}

{phang}
{opt format(#)} displays web links in three supporting Markdown preset
formats.

{pmore}
{cmd:format(1)} is rendered in Markdown as 
{browse `"https://www.stata.com/manuals/rregress.pdf"':[R] regress}.  The text
displayed is formatted as follows:{p_end}

{pmore2}[**[R]** regress](https://www.stata.com/manuals/rregress.pdf)

{pmore}
{cmd:format(2)} is rendered in Markdown as 
{browse `"https://www.stata.com/manuals/rregress.pdf"':regress}.  The text
displayed is formatted as follows:{p_end}

{pmore2}[regress](https://www.stata.com/manuals/rregress.pdf)

{pmore}
{cmd:format(3)} is rendered in Markdown as
{browse `"https://www.stata.com/manuals/rregress.pdf"':help regress}.  The
text displayed is formatted as follows:{p_end}

{pmore2}[help regress](https://www.stata.com/manuals/rregress.pdf)

{phang}
{cmd:clipoff} deselects copying to the clipboard.


{title:Examples}

{pstd}
Basic use: open online help file or PDF documentation

{phang2}{bf:. {stata "wwwhelp pwcorr":wwwhelp pwcorr}}{p_end}
{phang2}{bf:. {stata "wwwhelp clip(), web":wwwhelp clip(), web}}{p_end}
{phang2}{bf:. {stata "wwwhelp mata function":wwwhelp mata function}}{p_end}
{phang2}{bf:. {stata "wwwhelp twoway scatter, web":wwwhelp twoway scatter, web}}{p_end}
{phang2}{bf:. {stata "wwwhelp sum":wwwhelp sum}}{p_end}

{pstd}Auxiliary use: provide web link

{phang2}{bf:. {stata "wwwhelp twoway scatter, markdown":wwwhelp twoway scatter, markdown}}{p_end}
{phang2}{bf:. {stata "wwwhelp import excel, txt web":wwwhelp import excel, txt web}}{p_end}
{phang2}{bf:. {stata "wwwhelp xtreg, latex":wwwhelp xtreg, latex}}{p_end}
{phang2}{bf:. {stata "wwwhelp xtreg, tex":wwwhelp xtreg, tex}}{p_end}
{phang2}{bf:. {stata "wwwhelp xtreg, format(2)":wwwhelp xtreg, format(2)}}{p_end}
{phang2}{bf:. {stata "wwwhelp xtreg, format(3) clipoff":wwwhelp xtreg, format(3) clipoff}}{p_end}


{title:Stored results}

{pstd}
{cmd:wwwhelp} stores the following in {cmd:r()}:

{synoptset 15 tabbed}{...}
{p2col 5 18 00 2: Macros}{p_end}
{synopt:{cmd:r(link)}}web link (URL) to online PDF documentation{p_end}
{synopt:{cmd:r(link_web)}}web link (URL) to online help file{p_end}
{synopt:{cmd:r(link_m)}}Markdown-formatted web link text{p_end}
{synopt:{cmd:r(link_txt)}}{it:command}{cmd::} {it:URL} formatted web link text{p_end}
{synopt:{cmd:r(link_l1)}}LaTeX raw-formatted web link text{p_end}
{synopt:{cmd:r(link_l2)}}LaTeX custom-formatted web link text{p_end}
{synopt:{cmd:r(link_f1)}}first preformatted web link text{p_end}
{synopt:{cmd:r(link_f2)}}second preformatted web link text{p_end}
{synopt:{cmd:r(link_f3)}}third preformatted web link text{p_end}


{title:Author}

{pstd}Yujun Lian (连玉君){p_end}
{pstd}Lingnan College{break}
Sun Yat-Sen University{break}
Guangzhou, China{p_end}
{pstd}Email: {browse "mailto:arlionn@163.com":arlionn@163.com}{p_end}
{pstd}Blog: {browse "lianxh.cn":https://www.lianxh.cn}{p_end}

{pstd}Yongli Chen (陈勇吏){p_end}
{pstd}Antai College of Economics and Management{break}
Shanghai Jiao Tong University{break}
Shanghai, China{p_end}
{pstd}Email: {browse "mailto:yongli_chan@163.com":yongli_chan@163.com}{p_end}


{title:Also see}

{p 4 14 2}
Article:  {it:Stata Journal}, volume 24, number 1: {browse "https://doi.org/10.1177/1536867X241233676":pr0079}{p_end}

{p 7 14 2}
Help:  {helpb help}, {helpb hhelp}, {help wwwhelp_cn:{bf:wwwhelp_cn} (Chinese version)}{p_end}
