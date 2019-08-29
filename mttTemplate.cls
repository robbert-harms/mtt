\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mttTemplate}[2017/12/12 PhD Dissertation Style]
\LoadClassWithOptions{scrbook}


%% The bibliography used some of the old commands, so we add them manually.
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

%% For allowing double spaces 
\usepackage{setspace}

%% For adding copyrights
\usepackage{textcomp}

%% For comparing strings for boolean comparisons
\usepackage{xstring}

%% Fancy headers and footers
\usepackage[automark,headsepline]{scrlayer-scrpage}

%% provides more advanced conditionals
\usepackage{etoolbox}

%% for the extra parsing required in the chapter command
\usepackage{xparse}

%% for the color of the captions
\usepackage{xcolor}

%% For using utf8 symbols in the text
\usepackage[utf8]{inputenc}

%% the default language of the thesis, gives better bibliography results
\usepackage[english]{babel}

%% adds citation formatting commands, recommended by babel and biblatex
\usepackage{csquotes}

%% import biblatex with the numerical style
%% and set backwards compatibility with natbib
\usepackage[style=numeric,natbib=true,doi=true,eprint=false,isbn=false,url=false,backend=biber]{biblatex}

%% allows you to ignore elements from the bibliography by using:
%% \addtocategory{ignore}{johnson2015}
\DeclareBibliographyCategory{ignore}

%% Makes sure that incorrect months in the bibtex are still parsed correctly
\DeclareSourcemap{
	\maps[datatype=bibtex]{
		\map[overwrite]{
			\step[fieldsource=month, match=\regexp{\A(j|J)an\Z}, replace=1]
			\step[fieldsource=month, match=\regexp{\A(f|F)eb\Z}, replace=2]
			\step[fieldsource=month, match=\regexp{\A(m|M)ar\Z}, replace=3]
			\step[fieldsource=month, match=\regexp{\A(a|A)pr\Z}, replace=4]
			\step[fieldsource=month, match=\regexp{\A(m|M)ay\Z}, replace=5]
			\step[fieldsource=month, match=\regexp{\A(j|J)un\Z}, replace=6]
			\step[fieldsource=month, match=\regexp{\A(j|J)ul\Z}, replace=7]
			\step[fieldsource=month, match=\regexp{\A(a|A)ug\Z}, replace=8]
			\step[fieldsource=month, match=\regexp{\A(s|S)ep\Z}, replace=9]
			\step[fieldsource=month, match=\regexp{\A(o|O)ct\Z}, replace=10]
			\step[fieldsource=month, match=\regexp{\A(n|n)ov\Z}, replace=11]
			\step[fieldsource=month, match=\regexp{\A(d|D)ec\Z}, replace=12]
		}
	}
}


%% set the header style, chapter header verso, nothing recto
\renewcommand\@chapapp{Chapter}
\renewcommand*{\chaptermarkformat}{\@chapapp~\thechapter. \enskip}
\rohead{}

%% The addmargin environment without the big vertical skip
\newenvironment{addmarginnobigskip}{\setlength{\parskip}{0pt plus 1pt}\addmargin}{\endaddmargin}


%% The header page with the title and author
\newcommand{\headerpage}{
	\begin{titlepage}
		\thispagestyle{empty}
		\begin{center}
			\vspace*{\stretch{0.8}}
			
			{\large\bfseries {Dissertation}}
			\\~\\~\\
			\begin{spacing}{1.5}
			{\LARGE\bfseries {\thesistitle}}
			\end{spacing}
			\begin{spacing}{1.2}
				{\Large\bfseries {\thesissubtitle}}
			\end{spacing}
			
			\vspace{\stretch{0.5}}
			

			{\large {\thesisauthor}}
			\\~\\
			\thesisyear
			\vspace{\stretch{2}}
			
		\end{center}
	\end{titlepage}
}

%% The real thesis title page with the necessary text
\newcommand{\thesistitlepage}{
	\begin{titlepage}
		\thispagestyle{empty}
		\begin{center}
			\vspace*{\stretch{2.5}}
			
			\begin{spacing}{1.5}
			{\LARGE\bfseries {\thesistitle}}
			\end{spacing}
			\begin{spacing}{1.2}
			{\Large\bfseries {\thesissubtitle}}
			\end{spacing}
		
			\vspace{\stretch{5}}
			
			Dissertation\\~\\
			To obtain the degree of Doctor at Maastricht University,\\
			on the authority of the Rector Magnificus, Prof. Dr. Rianne M. Letschert,\\
			in accordance with the decision of the Board of Deans,\\
			to be defended in public \\
			on \thesisdefendingdate, at \thesisdefendingtime
			\\~\\
			by \\~\\
			\thesisauthorfull
			
			\vspace{\stretch{1}}
		\end{center}
	\end{titlepage}
}

%% Environment for pushing a paragraph to the bottom of the page
\newenvironment{bottomparagraph}{\par\vspace*{\fill}}{}

%% The info page with the promotor information and the legal stuff
\newcommand{\infopage}[1][false]{
	\thispagestyle{empty}
	
	\begin{flushleft}
		\textbf{Promotor}
		\begin{addmarginnobigskip}[1em]{1em}
			\thesispromotors
		\end{addmarginnobigskip}
		
		\vspace{1em}
		
		\textbf{Copromotor}
		\begin{addmarginnobigskip}[1em]{2em}
			\thesiscopromotors
		\end{addmarginnobigskip}
		
		\vspace{1em}
		
		\textbf{Assessment Committee} \\
		\begin{addmarginnobigskip}[1em]{2em}
			\assessmentcommittee
		\end{addmarginnobigskip}	
		
	\end{flushleft}

	\begin{bottomparagraph}		
		\IfEqCase{#1}{
			{false}{}
			{true}{
				\textcopyright \space \thesisauthor, Maastricht \thesisyear. \\
				All rights reserved. No part of this publication may be reproduced, stored in a retrieval system or transmitted in any form or by any means, electronic, mechanical, photocopying, recording or otherwise, without prior written permission of the author.
				\\~\\
				\begin{tabular}{@{}ll@{}}
					Cover & \coverdetails \\ 
					Production & \productiondetails \\
					ISBN & \isbnnumber
				\end{tabular} 
			}
		}
	\end{bottomparagraph}
	\clearpage
}

%% The dedication markup, use as \dedication{My text}
\renewcommand{\dedication}[1]{
	\newenvironment{dedicationenv}
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
	
	\begin{dedicationenv}
		#1
	\end{dedicationenv}
}


%% Table of contents with some specific styling
\let\oldtableofcontents\tableofcontents
\renewcommand\tableofcontents{%
	\cleardoublepage
	\pagenumbering{gobble}
	\setcounter{tocdepth}{1}
	\oldtableofcontents
}


%% for printing a papercitation with all the authors
\newcommand{\printpublication}[1]{\AtNextCite{\defcounter{maxnames}{99}}\fullcite{#1}}

%% For citing the work a chapter came from
\newcommand{\papercitation}[1]{
	\begin{bottomparagraph}
		\rule{0.5\textwidth}{0.1pt}\\
		\hspace*{1em} Adapted from: \printpublication{#1}.
	\end{bottomparagraph}
}

%% Set the title style
\KOMAoption{chapterprefix}{true}
\renewcommand{\chaptername}{}
\renewcommand*{\raggedchapter}{\raggedleft}
\renewcommand\chapterformat{\thechapter}
\setkomafont{chapterprefix}{\fontsize{70}{0} \selectfont}
\setkomafont{chapter}{\normalfont\huge}

%% Automatically start the minitoc in the frontmatter
\let\oldfrontmatter\frontmatter
\renewcommand\frontmatter{\oldfrontmatter \renewcommand*{\chapterheadstartvskip}{\vspace*{0\baselineskip}} \renewcommand{\chaptername}{}}

%% Set the chapter style for the main matter
\let\oldmainmatter\mainmatter
\renewcommand\mainmatter{\oldmainmatter \renewcommand*{\chapterheadstartvskip}{\vspace*{8\baselineskip}}}

%% Change the chapter index in the backmatter
\let\oldbackmatter\backmatter
\renewcommand\backmatter{\oldbackmatter \renewcommand*{\chapterheadstartvskip}{\vspace*{0\baselineskip}}}


%% Sets the fonts for the section headers
\setkomafont{disposition}{\mdseries\sffamily} % sets the section headers
\addtokomafont{chapterentry}{\rmfamily} % but that also sets the TOC entries, so reverting that

%% set the font of the captions
\setkomafont{caption}{\small}
\setkomafont{captionlabel}{\small}
\setcapindent{0em}
\addtokomafont{caption}{\color{black!30!gray}}
\addtokomafont{captionlabel}{\color{black}}

%% The spacing between the start of the section and the section title
\RedeclareSectionCommand[afterskip=0.05em]{section}
\RedeclareSectionCommand[afterskip=0.05em]{subsection}
\RedeclareSectionCommand[afterskip=0.05em]{subsubsection}


%% Command for adding an appendix section to each chapter
\usepackage{amsmath}
\makeatletter
\newcounter{AppendixSection}
\numberwithin{AppendixSection}{chapter}
\def\@AppendixSection[#1]#2{
	\refstepcounter{AppendixSection}
	\section*{%
		\addcontentsline{toc}{section}{\appendixname\ \Alph{AppendixSection}\quad#1}%
		\appendixname\ \Alph{AppendixSection}\quad#2}
}
\def\@@AppendixSection#1{\@AppendixSection[#1]{#1}}
\def\AppendixSection{\@ifnextchar[\@AppendixSection\@@AppendixSection}
\renewcommand{\theAppendixSection}{\Alph{AppendixSection}}

% "Chapter" prefix in ToC
%\let\@@l@chapter\l@chapter
%\def\l@chapter#1{\@@l@chapter{\chaptername\ #1}}
\makeatother


%% The spacing of the sections in the main table of contents
\RedeclareSectionCommand[tocindent=2.5em]{section}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Adds code needed to make author names bold.
%% Use with: \addboldnames{{Sigfridsson, Emma},{Vizedom, Monika B.}}
%% And reset with: \resetboldnames
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{xpatch}

\makeatletter
\def\hlblx@bibfile@name{\jobname -boldnames.bib}
\newwrite\hlblx@bibfile
\immediate\openout\hlblx@bibfile=\hlblx@bibfile@name

\newcounter{hlblx@name}
\setcounter{hlblx@name}{0}

\newcommand*{\hlblx@writenametobib}[1]{%
	\stepcounter{hlblx@name}%
	\edef\hlblx@tmp@nocite{%
		\noexpand\AfterPreamble{%
			\noexpand\setbox0\noexpand\vbox{%
				\noexpand\hlblx@getmethehash{hlblx@name@\the\value{hlblx@name}}}}%
	}%
	\hlblx@tmp@nocite
	\immediate\write\hlblx@bibfile{%
		@misc{hlblx@name@\the\value{hlblx@name}, author = {\unexpanded{#1}}, %
			options = {dataonly=true},}%
	}%
}

\AtEndDocument{%
	\closeout\hlblx@bibfile}

\addbibresource{\hlblx@bibfile@name}

\newcommand*{\hlbxl@boldhashes}{}
\DeclareNameFormat{hlblx@hashextract}{%
	\xifinlist{\thefield{hash}}{\hlbxl@boldhashes}
	{}
	{\listxadd{\hlbxl@boldhashes}{\thefield{fullhash}}}}

\DeclareCiteCommand{\hlblx@getmethehash}
{}
{\printnames[hlblx@hashextract][1-999]{author}}
{}
{}

\newcommand*{\addboldnames}{\forcsvlist\hlblx@writenametobib}
\newcommand*{\resetboldnames}{\def\hlbxl@boldhashes{}}

\newbibmacro*{name:bold}{%
	\def\do##1{\iffieldequalstr{hash}{##1}{\bfseries\listbreak}{}}%
	\dolistloop{\hlbxl@boldhashes}%
}
\makeatother

\xpretobibmacro{name:family}{\begingroup\usebibmacro{name:bold}}{}{}
\xpretobibmacro{name:given-family}{\begingroup\usebibmacro{name:bold}}{}{}
\xpretobibmacro{name:family-given}{\begingroup\usebibmacro{name:bold}}{}{}
\xpretobibmacro{name:delim}{\begingroup\normalfont}{}{}

\xapptobibmacro{name:family}{\endgroup}{}{}
\xapptobibmacro{name:given-family}{\endgroup}{}{}
\xapptobibmacro{name:family-given}{\endgroup}{}{}
\xapptobibmacro{name:delim}{\endgroup}{}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% End of code needed to make author names bold.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Use this to update the maximum number of shown bibliography names.
%% This is meant to be used in the chapter for your own publications.
\makeatletter
\newcommand\Setmaxbibnames[1]{\renewcommand\blx@maxbibnames{#1}}
\makeatletter

%% remove DOI from the references
%% This is meant to be used in the chapter for your own publications.
\makeatletter
\newcommand\removeDOI{
	\DeclareCiteCommand{\fullcite}
	{\defcounter{maxnames}{\blx@maxbibnames}%
		\usebibmacro{prenote}}
	{\clearfield{doi}%
		\usedriver
		{\DeclareNameAlias{sortname}{default}}
		{\thefield{entrytype}}}
	{\multicitedelim}
	{\usebibmacro{postnote}}
}
\makeatother
