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

%% For your own citations
\usepackage{bibentry}
\nobibliography*

%% Fancy headers and footers
\usepackage[automark,headsepline]{scrlayer-scrpage}

%% provides more advanced conditionals
\usepackage{etoolbox}

%% set the header style, chapter header verso, nothing recto
\renewcommand*{\chaptermarkformat}{Chapter~\thechapter. \enskip}
\rohead{}

%% The addmargin environment without the big vertical skip
\newenvironment{addmarginnobigskip}{\setlength{\parskip}{0pt plus 1pt}\addmargin}{\endaddmargin}


%% The header page with the title and author
\newcommand{\headerpage}{
	\begin{titlepage}
		\thispagestyle{empty}
		\begin{center}
			\vspace*{\stretch{1}}
			
			{\large\bfseries {Doctoral thesis}}
			\\~\\
			\begin{spacing}{1.5}
			{\LARGE\bfseries\MakeUppercase {\thesistitle}}
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
			\vspace*{\stretch{1.5}}
			
			\begin{spacing}{1.5}
			{\LARGE\bfseries\MakeUppercase {\thesistitle}}
			\end{spacing}
			
			\vspace{\stretch{2}}
			
			Dissertation\\~\\
			To obtain the degree of Doctor at Maastricht University,\\
			on the authority of the Rector Magnificus, Prof. Dr. R.M. Letschert,\\
			in accordance with the decision of the Board of Deans,\\
			to be defended in public \\
			on \thesisdefendingdate, at \thesisdefendingtime
			\\~\\
			by \\~\\
			\thesisauthor
			
			\vspace{\stretch{1}}
		\end{center}
	\end{titlepage}
}

%% Flip the printer margins from left to right
\newcommand{\flipbindingmargins}{
	\let\tmp\oddsidemargin
	\let\oddsidemargin\evensidemargin
	\let\evensidemargin\tmp
	\reversemarginpar		
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
		
		\vspace{2em}
		
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
	\setcounter{tocdepth}{0}
	\setcounter{minitocdepth}{1}
	\oldtableofcontents
}


%% Set the title style
\KOMAoption{chapterprefix}{true}
\renewcommand{\chaptername}{}
\renewcommand*{\raggedchapter}{\raggedleft}
\setkomafont{chapterprefix}{\fontsize{70}{-20} \selectfont}
\setkomafont{chapter}{\normalfont\huge}
\renewcommand*{\chapterheadstartvskip}{\vspace*{8\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace*{2\baselineskip}}


%% The chapter title style
\let\stdchapter\chapter

\makeatletter
\newcommand\startfancychapters{
	\renewcommand*\chapter{%
		\@ifstar{\starchapter}{\@dblarg\nostarchapter}
	}
	\newcommand*\starchapter[1]{%
		\stdchapter*{##1}
		\minitoc
		\clearpage
	}
	\def\nostarchapter[##1]##2{%
		\stdchapter[{##1}]{##2}
		\minitoc
		\clearpage
	}
}
\makeatother

%% Disables the fancy chapter style
\makeatletter
\newcommand\stopfancychapters{
	\renewcommand*\starchapter[1]{%
		\stdchapter*{##1}
	}
	\def\nostarchapter[##1]##2{%
		\stdchapter[{##1}]{##2}
	}
}
\makeatother


%% Automatically start the fancy chapter style in the main matter
\let\oldmainmatter\mainmatter
\renewcommand\mainmatter{\oldmainmatter \startfancychapters}

%% Automatically start the minitoc in the frontmatter
\let\oldfrontmatter\frontmatter
\renewcommand\frontmatter{\oldfrontmatter \dominitoc \flipbindingmargins}

%% Revert back to old chapter styles in the backmatter
\let\oldbackmatter\backmatter
\renewcommand\backmatter{\oldbackmatter \stopfancychapters}


%% For citing the work a chapter came from
\newcommand{\papercitation}[2]{
	\begin{bottomparagraph}
		\rule{0.5\textwidth}{0.1pt}\\
		 \hspace*{1em} Adapted from: \bibentry{#1}. #2.
	\end{bottomparagraph}
}

%% Sets the fonts for the section headers
\setkomafont{disposition}{\mdseries\sffamily} % sets the section headers
\addtokomafont{chapterentry}{\rmfamily} % but that also sets the TOC entries, so reverting that

%% set the font of the captions
\setkomafont{caption}{\sffamily\small}
\setkomafont{captionlabel}{\sffamily\small}
\setcapindent{0em}

%% The spacing between the start of the section and the section title
\RedeclareSectionCommand[afterskip=0.05em]{section}
\RedeclareSectionCommand[afterskip=0.05em]{subsection}
