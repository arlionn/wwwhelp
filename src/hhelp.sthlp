{smcl}
{* 7Sep2021}{...}
{cmd:help hhelp}{right: ({browse "https://doi.org/10.1177/1536867X241233676":SJ24-1: pr0079})}
{hline}

{title:Title}

{p2colset 5 14 16 2}{...}
{p2col:{hi:hhelp} {hline 2}}Open the online help file for a specific command{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 13 2}
{cmd:hhelp} {it:command} [{cmd:,} {it:options}]

{synoptset 12}{...}
{synopthdr}
{synoptline}
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
{cmd:hhelp} can quickly open the online version of official Stata help
files.  As a simplification of {helpb wwwhelp:wwwhelp}, it provides web links
to the online help files, which can be put into a specific
format and automatically copied to the clipboard.{p_end}

{pstd}
For example, {cmd:wwwhelp xtreg, web} is equivalent to {cmd:hhelp xtreg}.


{title:Options}

{phang}
{opt markdown} displays the web link in Markdown format.  For example,
{cmd:hhelp regress, markdown} displays the text in the following
format:{p_end}

{pmore2} [**[R]** regress](https://www.stata.com/help.cgi?regress) {p_end}

{pmore}
It can be copied to a Markdown file and displayed as a clickable link that
looks like
{browse `"https://www.stata.com/help.cgi?regress"':[R] regress}.{p_end}

{phang}
{opt txt} displays the web link in text ({it:command}{cmd::} {it:URL}) format.
For example, {cmd:hhelp regress, txt} displays the text in the following
format:{p_end}

{pmore2}[R] regress: https://www.stata.com/help.cgi?regress {p_end}

{pmore}
It can be copied to the dialog box of Facebook or WeChat for Chinese
users.{p_end}

{phang}
{opt ms} sends rich text punctuated with links to the clipboard, which can be
pasted easily to Microsoft Word.  For example, after using {cmd:hhelp}
{cmd:regress, ms}, you can press {it:Command}+{it:V} in Microsoft Word, and
the text will appear as a clickable link that looks like
{browse `"https://www.stata.com/help.cgi?regress"':[R] regress}.{p_end}

{pmore}
However, this option has some limitations.  It requires Stata 16 or newer
versions of Stata to be installed.  It also requires Python because the
commands call the Windows API through Stata's interaction with Python, and it
is currently available only for Windows systems.  Otherwise, it will
automatically switch to the {opt txt} option, which displays plain text with
links that looks like {it:command}{cmd::} {it:URL}.

{phang}
{opt texfull} displays the web link in full TeX text format.  For example,
{cmd:hhelp regress, texfull} displays the text in the following format:{p_end}

{pmore2}
\href{https://www.stata.com/help.cgi?regress}{\bfseries{[\MakeUppercase{r}] regress}}  {p_end}

{pmore}
It can be inserted into a {cmd:.tex} document, which will be displayed as a
clickable link in the PDF file when compiled using a TeX editor.  It looks
like this:
{browse `"https://www.stata.com/help.cgi?regress"':[R] regress}.{p_end}

{phang}
{opt latex} displays the web link in LaTeX format.  For example,
{cmd:hhelp regress, latex} displays the text in the following format:{p_end}

{pmore2}\stwwwhelp[r]{regress}{p_end}

{pmore}
It can be inserted into a {cmd:.tex} document, which will be displayed as a
clickable link in the PDF file when compiled using a LaTeX editor.  It looks
like this:
{browse `"https://www.stata.com/help.cgi?regress"':[R] regress}.{p_end}

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
{browse `"https://www.stata.com/help.cgi?regress"':[R] regress}.  The text
displayed is formatted as follows:{p_end}

{pmore2}[**[R]** regress](https://www.stata.com/help.cgi?regress)

{pmore}
{cmd:format(2)} is rendered in Markdown as 
{browse `"https://www.stata.com/help.cgi?regress"':regress}.  The text
displayed is formatted as follows:{p_end}

{pmore2}[regress](https://www.stata.com/help.cgi?regress)

{pmore}
{cmd:format(3)} is rendered in Markdown as
{browse `"https://www.stata.com/help.cgi?regress"':help regress}.  The text
displayed is formatted as follows:{p_end}

{pmore2}[help regress](https://www.stata.com/help.cgi?regress)

{phang}
{cmd:clipoff} deselects copying to the clipboard.


{title:Examples}

{pstd}
Basic use: open online help file

{phang2}{bf:. {stata "hhelp pwcorr":hhelp pwcorr}}{p_end}
{phang2}{bf:. {stata "hhelp mata function":hhelp mata function}}{p_end}
{phang2}{bf:. {stata "hhelp sum":hhelp sum}}{p_end}

{pstd}
Auxiliary use: provide web link

{phang2}{bf:. {stata "hhelp twoway scatter, m":hhelp twoway scatter, markdown}}{p_end}
{phang2}{bf:. {stata "hhelp xtreg, latex":hhelp xtreg, latex}}{p_end}
{phang2}{bf:. {stata "hhelp xtreg, texfull":hhelp xtreg, texfull}}{p_end}
{phang2}{bf:. {stata "hhelp xtreg, f(2)":hhelp xtreg, format(2)}}{p_end}
{phang2}{bf:. {stata "hhelp xtreg, f(3) clipoff":hhelp xtreg, format(3) clipoff}}{p_end}


{title:Stored results}

{pstd}
{cmd:hhelp} stores the following in {cmd:r()}:

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
Help:  {helpb help}, {helpb wwwhelp}{p_end}
