{smcl}
{* 3may2021}{...}
{cmd:help wwwhelp_cn}{right: ({browse "https://doi.org/10.1177/1536867X241233676":SJ24-1: pr0079})}
{hline}

{title:标题}

{p2colset 5 16 18 2}{...}
{p2col:{hi:wwwhelp} {hline 2}}在浏览器窗口显示帮助文档（HTML简易版或PDF详细版），
并提供帮助文档的网页链接{p_end}
{p2colreset}{...}


{title:语法}

{p 8 16 2}
{cmd:wwwhelp} {it:command} [{cmd:,}
{opt w:eb}
{opt m:arkdown}
{opt txt}
{opt ms}
{opt tex:full}
{opt l:atex}
{opt f:ormat}{cmd:(}#{cmd:)}
{opt c:lipoff}]

{synoptset 17 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opt w:eb}}打开 HTML 简易版在线帮助文档，默认打开 PDF 详细版{p_end}

{col 5}{cmd:格式}{col 20}提供帮助文档的网页链接，并自动复制到剪切板
{synopt:{opt m:arkdown}}以 Markdown 格式提供网页链接{p_end}
{synopt:{opt txt}}以 纯文本 格式提供网页链接，可以复制到微信的对话框中{p_end}
{synopt:{opt ms}}以富文本格式提供网页链接，可以复制到 MicroSoft Word 中呈现为带链接的文本{p_end}
{synopt:{opt t:exfull}}以 LaTeX原始 格式提供网页链接{p_end}
{synopt:{opt l:atex}}以 LaTeX 格式提供网页链接{p_end}
{synopt:{opt f:ormat(#)}}以预设格式提供网页链接，包括三种预设格式{p_end}
{synopt:{opt c:lipoff}}取消复制到剪切板{p_end}
{synoptline}
{p2colreset}{...}


{title:简介}

{pstd}
{cmd:wwwhelp} 用于打开 Stata 官方命令的在线帮助文件。官方命令 {help help} 可以打开内置的帮助文档，但只能在 Stata 窗口阅读，不利于传播和分享。{cmd:wwwhelp} 填补了这一空白，使得帮助文件可以独立于 Stata 阅读和使用。

{pstd}
只需要在 {cmd:help} 之前添加一个 {it:www}，将其转换为 {cmd:wwwhelp}，所有使用 {it:help cmd} 命令可以直接打开内置帮助文件的官方命令，
也都可以使用 {it:wwwhelp cmd} 打开其在线版本，包括详细的 PDF 版本和简单的 HTML 版本。

{pstd}
为了方便引用，{cmd:wwwhelp} 命令还设置了一系列格式选项，包括 {it:markdown}、{it:txt}、{it:ms}、{it:latex}、{it:texfull} 和 {it:format(#)}。这些选项考虑了不同文本编辑器（比如 TeXLive、Markdown）的语法差异，
使得用户可以根据需要，获取特定格式的在线帮助文件链接，并自动复制到剪贴板。

{pstd}
此外，{cmd:wwwhelp} 还可以处理命令缩写问题，并在缩写无法唯一识别官方命令时，列出所有可能的相似命令。


{title:选项}

{phang}{ul:主要选项}

{phang2}{opt web} 快速打开 HTML 简易版在线帮助文档，默认打开 PDF 详细版

{phang}{ul:格式选项}：提供帮助文档的网页链接，并自动复制到剪切板，支持多种呈现格式。{p_end}

{phang2}{opt markdown} 以 Markdown 形式显示网页链接，比如 {ul:wwwhelp regress, markdown} 显示的文本格式如下：{p_end}

{pmore3} [**[R]** regress](https://www.stata.com/manuals/rregress.pdf) 
 {p_end}

{phang3}将其复制到 Markdown 中会显示为可点击的链接：{browse `"https://www.stata.com/manuals/rregress.pdf"':[R] regress}{p_end}

{phang2}{opt txt} 以文本（命令:URL）形式显示网页链接，比如 {ul:wwwhelp regress, txt} 显示的文本格式如下：{p_end}

{pmore3}[R] regress: https://www.stata.com/manuals/rregress.pdf {p_end}

{phang3}可以将其复制到微信的对话框中{p_end}

{phang2}{opt ms} 以富文本形式将链接复制到剪切板，该链接可以粘贴到 MicroSoft Word 中，呈现为带链接的文本。比如 {ul:wwwhelp regress, ms} 后，按 Ctrl+V 粘贴到 Word，将显示为：{browse `"https://www.stata.com/manuals/rregress.pdf"':[R] regress}{p_end}

{phang3}需要注意的是，该功能存在一些局限：（1）只能在 Windows 系统中使用；（2）只适用于 Stata 16 或更高版本；（3）需要安装 Python。若不满足上述条件，则会自动切换为 {opt txt} 选项，生成文本（命令:URL）形式的网页链接。{p_end}

{phang2}{opt texfull} 以完整的 TeX 文本形式显示网页链接，比如 {ul:wwwhelp regress, texfull} 显示的文本格式如下：{p_end}

{pmore3} \href{https://www.stata.com/manuals/rregress.pdf}{\bfseries{[\MakeUppercase{r}] regress}}  {p_end}

{phang3} 可以将其插入到 .tex 文档中，使用 TeX 编辑器编译后会显示为 PDF 文件中的可点击的链接：{browse `"https://www.stata.com/manuals/rregress.pdf"':[R] regress}{p_end}

{phang2}{opt latex} 以 Latex 形式显示网页链接，比如 {ul:wwwhelp regress, latex} 显示的文本格式如下：{p_end}

{pmore3}\stwwwhelp[r]{regress} {p_end}

{phang3} 可以将其插入到 .tex 文档中，使用 TeX 编辑器编译后会显示为 PDF 文件中的可点击的链接：{browse `"https://www.stata.com/manuals/rregress.pdf"':[R] regress}{p_end}

{pmore3}注意：由于 {it:\stwwwhelp} 是一个用户定义的新命令，需要在 .tex 文档的导言区中加入下述内容来定义该命令：{p_end}
{pmore3} \newcommand{\stwwwhelp}[2][r]{  {p_end}
{pmore3}{space 4}	 \href{https://www.stata.com/manuals/#1#2.pdf}{\bfseries{[\MakeUppercase{#1}] #2}}  {p_end}
{pmore3} }  {p_end}

{phang2}{opt format(#)} 以预设格式提供网页链接，支持三种 Markdown 的预设格式：

{phang3}{cmd:format(1)} 在 Markdown 中呈现为 {browse `"https://www.stata.com/manuals/rregress.pdf"':[R] regress}，显示的文本格式如下：{p_end}

{pmore3}[**[R]** regress](https://www.stata.com/manuals/rregress.pdf)

{phang3}{cmd:format(2)} 在 Markdown 中呈现为 {browse `"https://www.stata.com/manuals/rregress.pdf"':regress}，显示的文本格式如下：{p_end}

{pmore3}[regress](https://www.stata.com/manuals/rregress.pdf)

{phang3}{cmd:format(3)} 在 Markdown 中呈现为 {browse `"https://www.stata.com/manuals/rregress.pdf"':help regress}，显示的文本格式如下：{p_end}

{pmore3}[help regress](https://www.stata.com/manuals/rregress.pdf)

{phang2}{cmd:clipoff} 取消复制到剪切板


{title:举例}

{phang}* {ul:基本功能}：打开帮助文档

{phang2}{bf:. {stata "wwwhelp pwcorr":wwwhelp pwcorr}}{p_end}
{phang2}{bf:. {stata "wwwhelp clip(), web":wwwhelp clip(), web}}{p_end}
{phang2}{bf:. {stata "wwwhelp mata function":wwwhelp mata function}}{p_end}
{phang2}{bf:. {stata "wwwhelp twoway scatter, web":wwwhelp twoway scatter, web}}{p_end}
{phang2}{bf:. {stata "wwwhelp sum":wwwhelp sum}}{p_end}

{phang}* {ul:辅助功能}：提供网页链接

{phang2}{bf:. {stata "wwwhelp twoway scatter, markdown":wwwhelp twoway scatter, markdown}}{p_end}
{phang2}{bf:. {stata "wwwhelp import excel, txt web":wwwhelp import excel, txt web}}{p_end}
{phang2}{bf:. {stata "wwwhelp xtreg, latex":wwwhelp xtreg, latex}}{p_end}
{phang2}{bf:. {stata "wwwhelp xtreg, tex":wwwhelp xtreg, tex}}{p_end}
{phang2}{bf:. {stata "wwwhelp xtreg, format(2)":wwwhelp xtreg, format(2)}}{p_end}
{phang2}{bf:. {stata "wwwhelp xtreg, format(3) clipoff":wwwhelp xtreg, format(3) clipoff}}{p_end}


{title:存储结果}

{pstd}
可以通过{stata "return list": return list} 查看 {cmd:wwwhelp} 后的存储结果 (参见 {help return}):

{synoptset 15 tabbed}{...}
{p2col 5 18 00 2: Macros}{p_end}
{synopt:{cmd:r(link)}}PDF帮助文档的网页链接（URL）{p_end}
{synopt:{cmd:r(link_web)}}网页版帮助文档的网页链接（URL）{p_end}
{synopt:{cmd:r(link_m)}}Markdown格式的网页链接文本{p_end}
{synopt:{cmd:r(link_txt)}}命令:URL 格式的网页链接文本{p_end}
{synopt:{cmd:r(link_l1)}}LaTeX原始形式的网页链接代码{p_end}
{synopt:{cmd:r(link_l2)}}LaTeX自定义形式的网页链接代码{p_end}
{synopt:{cmd:r(link_f1)}}第一种预设格式的网页链接文本{p_end}
{synopt:{cmd:r(link_f2)}}第二种预设格式的网页链接文本{p_end}
{synopt:{cmd:r(link_f3)}}第三种预设格式的网页链接文本{p_end}


{title:作者}

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
Help:  {helpb help}, {helpb hhelp}, {help wwwhelp_cn:{bf:wwwhelp} (English version)}{p_end}
