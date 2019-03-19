%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% genepaper, v1.0, 2016/03/08 
%
% This class is for a generic paper
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{genpaper}[28/02/2015, v1.2]
\AtEndOfClass{\RequirePackage{microtype}}
% Option for line numbers
%\newif\if@lineno
%\DeclareOption{lineno}{\@linenotrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions*
\LoadClass{extarticle}

%% Fonts and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{xifthen}
\RequirePackage[colorlinks=true, allcolors=blue]{hyperref}

%% Set up main title page fonts 
\newcommand{\headerfont}{\normalfont\sffamily\fontsize{9}{11} \selectfont}
\newcommand{\footerfont}{\normalfont\sffamily\fontsize{9}{11} \selectfont}
\newcommand{\titlefont}{\fontfamily{lmss}\bfseries\fontsize{20pt}{22pt}\selectfont}
\newcommand{\datesfont}{\normalfont\sffamily\fontsize{9}{10}\selectfont}
\newcommand{\absfont}
{
%\normalfont\sffamily\fontsize{9}{11}\selectfont
}
\newcommand{\keywordsfont}{\normalfont\rmfamily%\fontsize{7}{10}
\selectfont}

%% Set URL link color & font
\renewcommand\UrlFont{\color{black}\sffamily}

%% Author and affiliation
\RequirePackage{authblk}
\setlength{\affilsep}{8.5pt} % 16.5pts between base of author line and base of affil line
\renewcommand\Authfont{\color{color0}\normalfont\sffamily\bfseries\fontsize{10}{12}\selectfont}
\renewcommand\Affilfont{\color{color0}\normalfont\sffamily\fontsize{9}{10}\selectfont}
\makeatletter
\renewcommand\AB@affilsepx{; \protect\Affilfont}
\makeatother
\renewcommand\Authands{, and }


%% Graphics, tables and other formatting
\RequirePackage{graphicx,xcolor}
\RequirePackage{booktabs}
\RequirePackage[twoside,%
				a4paper,
				includeheadfoot,%
				%layoutsize={8.125in,10.875in},%
                %layouthoffset=0.1875in,%
                %layoutvoffset=0.0625in,%
                left=38.5pt,%
                right=43pt,%
                top=43pt,% 10pt provided by headsep
                bottom=32pt,%
                headheight=0pt,% No Header
                headsep=10pt,%
                footskip=25pt]{geometry}
\setlength{\columnsep}{14pt} % Distance between the two columns of text
\setlength{\parindent}{12pt} % Paragraph indent

%% Set document color scheme
\definecolor{black50}{gray}{0.5} % 50% black for hrules
\definecolor{color0}{RGB}{0,0,0} % Base
\definecolor{color1}{RGB}{59,90,198} % author email, doi
\definecolor{color2}{RGB}{16,131,16} %

%% Headers and footers
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage,datetime}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers

\makeatletter
% Headers
\fancyhead[LE,RO]{}
\fancyhead[LO,RE]{}
% Footers
\lfoot{}%
\cfoot{}%
\rfoot{}%
 \fancyfoot[R]{\footerfont 
 \textbf{\usdate\today{} \currenttime}
 \hspace{7pt}|\hspace{7pt}
 \textbf{\thepage\textendash\pageref{LastPage}}
 }
 \fancyfoot[L]{\footerfont\@ifundefined{@shorttitle}{}{\@shorttitle}}
\makeatother

\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule

%% Section/subsection/paragraph set-up
\RequirePackage[explicit]{titlesec}

%\renewcommand{\thesubsection}{\Alph{subsection}}

\titleformat{\section}
  {\large\sffamily\bfseries}
  {\thesection.}
  {0.5em}
  {#1}
  []
\titleformat{name=\section,numberless}
  {\large\sffamily\bfseries}
  {}
  {0em}
  {#1}
  []  
\titleformat{\subsection}%[runin]
  {\sffamily\bfseries}
  {\thesubsection.}
  {0.5em}
  {#1 }
  []
\titleformat{\subsubsection}%[runin]
  {\sffamily\small\bfseries\itshape}
  {\thesubsubsection.}
  {0.5em}
  {#1 }
  []    
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1} 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt}


\newcommand{\shorttitle}[1]{\def\@shorttitle{#1}}
\newcommand{\equalauthors}[1]{\def\@equalauthors{#1}}
\newcommand{\correspondingauthor}[1]{\def\@correspondingauthor{#1}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\renewcommand{\abstract}[1]{\def\@theabstract{#1}}
\newcommand{\compiledate}{\def\@compiledate{This manuscript was compiled on \textbf{\usdate\today{} \currenttime}}}


%% Custom title page 
\renewcommand{\@maketitle}{%
\vskip10pt%
{\raggedright\baselineskip= 24pt\titlefont \@title\par}%
\vskip10pt% 21pts between base of title and base of author line
{\raggedright \@author\par}
\vskip2pt

\@ifundefined{@equalauthors}{}
{\vskip2pt
{\raggedright \datesfont \@equalauthors \par}
}
\@ifundefined{@correspondingauthor}{}
{\vskip2pt
{\raggedright \datesfont \@correspondingauthor \par}
}

\@ifundefined{@compiledate}{}
{\vskip5pt% 16pts between base of affiliations and base of dates line 
{\raggedright \datesfont \@compiledate \par}
}

\@ifundefined{@theabstract}{}{
\centering
\vskip5pt
\parbox{\dimexpr0.92\linewidth}{%
    \vskip3pt%%
	\absfont 
	\textbf{Abstract:}
	\@theabstract
}
}

\@ifundefined{@keywords}{}{
\centering
\vskip3pt
\parbox{\dimexpr0.92\linewidth}{%
    \vskip3pt%%
	\absfont 
	\textbf{Keywords:} \@keywords
}
}
\vskip25pt%
}%


%% Other packages
\RequirePackage{enumitem} % For reducing bullet list item separation

\newcommand{\watermark}[1]{ 
\usepackage[printwatermark]{xwatermark}
\newwatermark[allpages,color=gray!20,angle=45,scale=3,xpos=0,ypos=0]{#1}
}


\newcommand{\lineno}{
\usepackage[switch,pagewise]{lineno}   
 \linenumbers
%\pagewiselinenumbers
 \setlength\linenumbersep{5pt}
 \renewcommand\linenumberfont{\normalfont\tiny\sffamily\color{gray}}
% Number only every 5:th line:
 \modulolinenumbers[5]
}
