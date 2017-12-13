\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mttTemplate}[2017/12/12 PhD Dissertation Style]
\LoadClassWithOptions{book}

%\newcommand{\@mult}{1}

%%New values for some lengths, proportional to fontsize
%\renewcommand{\baselinestretch}{1.1}
%\newcommand{\setmlength}[3]{\setlength{#1}{#3}\setlength{#1}{#2#1}}
%\setmlength{\textheight}{\@mult}{0.613\paperheight}%18.2cm for a4paper
%%\setmlength{\textwidth}{\@mult}{0.576\paperwidth}%12.1cm for a4paper
%\setmlength{\textwidth}{\@mult}{0.615\paperwidth}%13cm for a4paper
%\setmlength{\headheight}{\@mult}{12pt}
%\setmlength{\headheight}{\@mult}{12pt}
%\setmlength{\headsep}{\@mult}{18pt}
%\setmlength{\topskip}{\@mult}{10pt}
%\setmlength{\footskip}{\@mult}{25pt}
%
%\setlength{\topmargin}{0.5\paperheight}
%\addtolength{\topmargin}{-0.5\textheight}
%\addtolength{\topmargin}{-0.5\headheight}
%\addtolength{\topmargin}{-0.5\headsep}
%\addtolength{\topmargin}{-0.5\footskip}
%\addtolength{\topmargin}{-1in}
%\setlength{\oddsidemargin}{0.5\paperwidth}
%\addtolength{\oddsidemargin}{-0.5\textwidth}
%\addtolength{\oddsidemargin}{-1in}
%\setlength{\evensidemargin}{\oddsidemargin}

%%
%%   Chapterheads: chapternr, horizontal line, chaptertitle
%%       Vertical spaces are proportional to fontsize
%%       Note that, as opposed to in book.cls, here the definition
%%       of \@makechapterhead does _not_ end with a \nobreak command
%%       but with a \mbox{}, since we'd rather not have the chapter
%%       head move to the next page even if that would result in 
%%       the chapter head being the _only_ thing on the page. 
%%
%\newlength{\@spacebeforechapterhead}
%\setmlength{\@spacebeforechapterhead}{\@mult}{15pt}
%\newlength{\@spaceinchapterhead}
%\setmlength{\@spaceinchapterhead}{\@mult}{3.5pt}
%\newlength{\@spaceafterchapterhead}
%\setmlength{\@spaceafterchapterhead}{\@mult}{60pt}
%
%\renewcommand{\@makechapterhead}[1]{{%
%\publ
%\vspace*{\@spacebeforechapterhead}%
%   \parindent 0pt \Large\bfseries
%   \ifnum \c@secnumdepth >\m@ne
%      \if@mainmatter
%         \@chapapp\enspace\thechapter
%      \fi
%   \fi
%   \interlinepenalty\@M
%   \vspace*{\@spaceinchapterhead}%
%   \hrule
%   \vspace*{\@spaceinchapterhead}%
%   {\hfill \LARGE \bfseries #1}%
%   \mbox{}\par
%   \mbox{}\par
%   \mbox{}\par
%%   \mbox{}\par
%%   \mbox{}\par
%%   \mbox{}\par
%%   \vspace*{\@spaceafterchapterhead}\vspace{\stretch{0.01}\par\mbox{}\par
%}}
%
%\renewcommand{\@makeschapterhead}[1]{{%
%   \vspace*{\@spacebeforechapterhead}%
%   \parindent 0pt \Large\bfseries
%   \phantom{\@chapapp}%
%   \interlinepenalty\@M
%   \vspace*{\@spaceinchapterhead}%
%   \hrule
%   \vspace*{\@spaceinchapterhead}%
%   {\hfill \LARGE \bfseries #1}%
%   \mbox{}\par
%   \mbox{}\par
%   \mbox{}\par
%   \mbox{}\par
%   \mbox{}\par
%   \mbox{}\par
%% Note: the above works better when there is little text on the first
%% page of the chapter
%%   \vspace*{\@spaceafterchapterhead}\vspace{\stretch{0.01}}\par\mbox{}\par
%}}
%
%%\newcommand{\Chapter}[1]{%
%%   \chapter{#1 ${\,}^{\dagger}$}
%%}
%%
%%   No pagenumber or headers on skipped pages with cleardoublepage
%%
%\renewcommand{\cleardoublepage}{%
%   \clearpage\if@twoside \ifodd\c@page\else
%   \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi
%}
%%
%%   Theorems: {\bf number.} {\sc type.} {\rm description} \it contents
%%
%\def\@begintheorem#1#2{%
%   \itshape
%   \trivlist% changing this in '\begin{trivlist}' yields an error
%   \item[\hspace{\labelsep}{\upshape\bfseries #2.}\ {\scshape #1.}]%
%}
%
%\renewcommand{\@opargbegintheorem}[3]{%
%   \itshape
%   \trivlist% changing this in `\begin{trivlist}' yields an error
%  \item[\hspace{\labelsep}{\upshape\bfseries #2.}\ {\scshape #1\ ({#3}).}]%
%}
%%
%%   Chapters, sections and other environments are redefined here to no 
%%       longer cause uppercased headings. Headings are italized instead of 
%%       slanted. The bibliography and index appear in the table of contents.
%%
%\if@twoside
%   \renewcommand{\ps@headings}{%
%      \let\@oddfoot\@empty\let\@evenfoot\@empty
%      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
%      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
%      \let\@mkboth\markboth
%      \def\chaptermark##1{\markboth{%
%         \ifnum \c@secnumdepth >\m@ne
%            \if@mainmatter \@chapapp\ \thechapter. \ \fi 
%         \fi
%         ##1}{}}%
%      \def\sectionmark##1{\markright{%
%         \ifnum \c@secnumdepth >\z@ \thesection. \ \fi
%         ##1}}%
%   }
%\else
%   \renewcommand{\ps@headings}{%
%      \let\@oddfoot\@empty
%      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
%      \let\@mkboth\markboth
%      \def\chaptermark##1{\markright{%
%         \ifnum \c@secnumdepth >\m@ne
%            \if@mainmatter \@chapapp\ \thechapter. \ \fi
%	
%         \fi
%         ##1}}
%   }
%\fi
%
%\renewcommand{\ps@myheadings}{%
%   \let\@oddfoot\@empty\let\@evenfoot\@empty
%   \def\@evenhead{\thepage\hfil\slshape\leftmark}%
%   \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
%   \let\@mkboth\@gobbletwo
%   \let\chaptermark\@gobble
%   \let\sectionmark\@gobble
%}

%% For allowing double spaces 
\usepackage{setspace}

%% For adding copyrights
\usepackage{textcomp}

%% For adding margins using the addmargin command
\usepackage{scrextend}

%% For the chapter title markup
\usepackage{titlesec}

%% For the header and footer markup
\usepackage{fancyhdr}

%% Set the header footer style
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LO]{\itshape\nouppercase{\rightmark}}
\fancyhead[RE]{\itshape\nouppercase{\leftmark}}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot{}
\fancyfoot[LE,RO]{\thepage}


%% Environment for pushing a paragraph to the bottom of the page
\newenvironment{bottomparagraph}{\par\vspace*{\fill}}{\clearpage}

%% The header page with the title and author
\newcommand{\headerpage}{
	\pagenumbering{gobble}
	\begin{titlepage}
		\begin{center}
			\vspace*{5em}
			\setstretch{2}
			{\LARGE\bfseries\MakeUppercase {\thesistitle}}\par
			\setstretch{1}
			
			\vspace*{12em}
			{\large\bfseries {\thesisauthor}}
			\\~\\
			\thesisyear
		\end{center}
	\end{titlepage}
}

%% The real thesis title page with the necessary text
\newcommand{\thesistitlepage}{
	\begin{titlepage}
		\begin{center}
			\vspace*{5em}
			\setstretch{2}
			{\LARGE\bfseries\MakeUppercase {\thesistitle}}\par
			\setstretch{1}
			
			\vspace*{12em}
			Dissertation\\~\\
			To obtain the degree of Doctor at Maastricht University,\\
			on the authority of the Rector Magnificus, Prof. Dr. L.L.G. Soete,\\
			in accordance with the decision of the Board of Deans,\\
			to be defended in public \\
			on \thesisdefendingdate, at \thesisdefendingtime
			\\~\\
			by \\~\\
			\thesisauthor
		\end{center}
	\end{titlepage}
}

%% The info page with the promotor information and the legal stuff
\newcommand{\infopage}{
	\thispagestyle{empty}
	
	\begin{flushleft}
		\textbf{Promotor} \\
		\begin{addmargin}[1em]{2em}
			\thesispromotors
		\end{addmargin}
		
		\vspace{1.5em}
		
		\textbf{Copromotor} \\
		\begin{addmargin}[1em]{2em}
			\thesiscopromotors
		\end{addmargin}
		
		\vspace{3em}
		
		\textbf{Assessment Committee} \\
		\begin{addmargin}[1em]{2em}
			\assessmentcommittee
		\end{addmargin}	
		
	\end{flushleft}
	
	\begin{bottomparagraph}
		\begin{flushleft}
		\textcopyright \space \thesisauthor, Maastricht \thesisyear.\\
		\end{flushleft}
		All rights reserved. No part of this publication may be reproduced, stored in a retrieval system or transmitted in any form or by any means, electronic, mechanical, photocopying, recording or otherwise, without prior written permission of the author.
		\\~\\
		\begin{tabular}{@{}ll@{}}
			Cover & \coverdetails \\ 
			Production & \productiondetails \\
			ISBN & \isbnnumber
		\end{tabular} 
	\end{bottomparagraph}
}

%% The environment the dedication markup.
\newenvironment{dedication}
{
	\clearpage           % we want a new page
	\thispagestyle{empty}% no header and footer
	\vspace*{\stretch{1}}% some space at the top 
	\itshape             % the text is in italics
	\centering           % put it in the center
}
{\par % end the paragraph
	\vspace{\stretch{4}} % space at bottom is three times that at the top
	\clearpage           % finish off the page
}

%% The fancy chapter style
\newcommand{\enablemainchapterstyle}{
	\titleformat{\chapter}[display]
	{\normalfont\Large\filcenter\sffamily}
	{\titlerule[1pt]%
		\vspace{1pt}%
		\titlerule
		\vspace{1pc}%
		\LARGE\MakeUppercase{\chaptertitlename} \thechapter}
	{1pc}
	{\titlerule
		\vspace{1pc}%
		\Huge}
	[\newpage] % creates the new page
}

%% The old chapter style, used in the table of contents
\newcommand{\oldchap}{%
	\titleformat{\chapter}[display]
	{\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}
	\titlespacing*{\chapter} {0pt}{50pt}{40pt}}

%% Enable by default the new chapter style
\enablemainchapterstyle

\let\oldtableofcontents\tableofcontents
\renewcommand\tableofcontents{
	\oldchap
	\cleardoublepage
	\pagenumbering{gobble}
	\setcounter{tocdepth}{0}
	\oldtableofcontents
	\pagenumbering{arabic}
	\enablemainchapterstyle
}
