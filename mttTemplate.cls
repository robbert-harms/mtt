\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mttTemplate}[2017/12/12 PhD Dissertation Style]
\LoadClassWithOptions{scrbook}


%% For allowing double spaces 
\usepackage{setspace}

%% For adding copyrights
\usepackage{textcomp}

%% For adding margins using the addmargin command
\usepackage{scrextend}

%% For comparing strings for boolean comparisons
\usepackage{xstring}

%% Fancy headers and footers
\usepackage[automark,headsepline]{scrlayer-scrpage}


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
			on the authority of the Rector Magnificus, Prof. Dr. L.L.G. Soete,\\
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
\newenvironment{bottomparagraph}{\par\vspace*{\fill}}{\clearpage}

%% The info page with the promotor information and the legal stuff
\newcommand{\infopage}[1][false]{
	\thispagestyle{empty}
	
	\begin{flushleft}
		\textbf{Promotor}
		\begin{addmargin}[1em]{2em}
			\thesispromotors
		\end{addmargin}
		
		\vspace{1.4em}
		
		\textbf{Copromotor}
		\begin{addmargin}[1em]{2em}
			\thesiscopromotors
		\end{addmargin}
		
		\vspace{2.4em}
		
		\textbf{Assessment Committee} \\
		\begin{addmargin}[1em]{2em}
			\assessmentcommittee
		\end{addmargin}	
		
	\end{flushleft}

	\begin{bottomparagraph}		
		\IfEqCase{#1}{
			{false}{}
			{true}{
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
			}
		}
	\end{bottomparagraph}
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

%\newcommand\startfancychapters{}
\makeatletter
\newcommand\startfancychapters{
	\let\stdchapter\chapter
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

%% Automatically start the fancy chapter style in the main matter
\let\oldmainmatter\mainmatter
\renewcommand\mainmatter{\oldmainmatter \startfancychapters}

%% Start the minitoc in the frontmatter
\let\oldfrontmatter\frontmatter
\renewcommand\frontmatter{\oldfrontmatter \dominitoc \flipbindingmargins}
