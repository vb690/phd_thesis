% This file defines a thesis class for
% the University of York. The class 
% complied with the York Regulation 2.7
% in 2000.
%
% Written by J H Pickering, based on
% the UWA thesis class by R Huss 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yorkThesis}

\typeout{York Thesis style by J Pickering 2000}

\LoadClass[11pt,titlepage,openany,oneside]{book}
\usepackage{geometry}
\RequirePackage{ifthen}
\RequirePackage{setspace}

% Do we want lists of figures and tables? By default, yes.
\newboolean{@wantlistoffigures}
\setboolean{@wantlistoffigures}{true}
\newboolean{@wantlistoftables}
\setboolean{@wantlistoftables}{true}

\DeclareOption{nolof}{\setboolean{@wantlistoffigures}{false}}
\DeclareOption{nolot}{\setboolean{@wantlistoftables}{false}}

\ProcessOptions

% Set parameters for floats

\setcounter{totalnumber}{10}               % Pretty unlikely
\renewcommand{\topfraction}{0.85}          % Floats may occupy up to 85%
\renewcommand{\bottomfraction}{0.85}       %  of the page. This is slightly
\renewcommand{\textfraction}{0.15}         %  different to the old style
\renewcommand{\floatpagefraction}{0.60}    % Can allow quite a lot of whitespace on a float page

\setlength{\textheight}{230mm}
\setlength{\oddsidemargin}{14mm}
\setlength{\textwidth}{154mm}

% Call it what you like York regs distinguish
% between a list of Refs and a bibliography
% of not necessarily referenced material 
\renewcommand{\bibname}{List of References}

% Comeply with York regs 2.7.3.j & 2.7.3.l
\setcounter{secnumdepth}{4}
\pagenumbering{arabic}
 
% Macros to define department, supervisor and submission date
\def\dept#1{\gdef\@dept{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}

  \def\@title{
      {A Methodology for Approximating Motivation-Related Latent States in Large Scale Scenarios}\\
      {\normalsize And its Role in Engagement Prediction within a Video Game Setting}\\
  }
  \def\@author{Valerio Bonometti}
  \def\@dept{Computer Science}
  \def\@supervisor{Prof. Alex Wade and Prof. Anders Drachen}
  \def\@submitdate{\ifcase\the\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space \number\the\year}

% Generate title page
\newcommand{\titlePage}{
	\begin{singlespace}
	\thispagestyle{empty}%
	\ \vspace{1in}%
	\begin{center}
		{\Large\expandafter{\bf \@title}}
	\end{center}
        \vspace{0.75in}
	\begin{center}
		{\Large\bf \@author} \\
        \vspace{1in}
        
        
        \begin{center}
        \begin{minipage}{5in}
         \begin{center}
          This thesis is submitted in partial fulfilment of the\\
          requirements for the degree of\\
          Doctor of Philosophy.
         \end{center}
        \end{minipage}
        \end{center}

        \vspace{0.5in}
          University of York \\
          York\\
          YO10 5DD\\
          UK \\
        \vspace{0.5in}
         Department of \@dept \\
        \vspace{0.25in}
         \@submitdate \\
        \vspace{.25in}
  		{Supervisors \\ \@supervisor} \\
	\end{center}
        \end{singlespace}
}

%generate the corrections page
\newcommand{\correctionsPage}{
	\newpage
	\thispagestyle{plain}
	\pagestyle{myheadings}
	\markright{CORRECTIONS}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\Huge\textbf{Corrections}}
	\end{flushleft}
	\vspace{20\p@}
}

%an abstract page
\newcommand{\abstract}[1]{
	\newpage
	\markright{}
	\ \vspace{59\p@}
	\begin{flushleft}
 	  {\Huge\textbf{Abstract}}
	\end{flushleft}
	\vspace{20\p@}
	#1
}

\newcommand{\contents}{
	\tableofcontents
	\newpage
  \ifthenelse{\boolean{@wantlistoftables}}{
	  \listoftables
  }{}
  \ifthenelse{\boolean{@wantlistoffigures}}{
	  \listoffigures
	  \newpage
  }{}
  \input{chapters/general_introduction.tex}
}

\newcommand{\accompanyingMaterials}{
	\newpage
	\thispagestyle{plain}
	\pagestyle{myheadings}
	\markright{ACCOMPANYING MATERIALS}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\Huge\textbf{Accompanying Materials}}
	\end{flushleft}
	\vspace{20\p@}
}

\newcommand{\preface}[1]{
	\newpage
	\markright{}
	\ \vspace{1.0in}
	\begin{center}
	  #1
	\end{center}
}

%Generate an Author's Declaration page
\newcommand{\declaration}{
  \newlength{\candwidth}
  \settowidth{\candwidth}{(candidate)}
  \begin{flushleft}
  {\Huge {\bf Declaration}}
  \end{flushleft}
  \vspace{0.5in}
  \noindent I declare that this thesis has not previously been accepted in substance for any degree and is not being concurrently submitted in candidature for any degree other than Doctor of Philosophy of the University of York. This thesis is the result of my own investigations, except where otherwise stated. Other sources are acknowledged by explicit references. All sources are acknowledged as References. I hereby give consent for my thesis, if accepted, to be made available for photocopying and for inter-library loan, and for the title and summary to be made available to outside organisations. The work presented in this thesis is the result of a partnership between University of York and Square Enix Ltd. It was supported by the EPSRC Centre for Doctoral Training in Intelligent Games \& Games Intelligence (IGGI) through grant [EP/L015846/1]. All data employed in this work were obtained and processed in compliance with the European Union's General Data Protection Regulation \cite{EUdataregulations2018} and Square Enix Ltd. data protection policies. Chapter \ref{chapter_theory_modelling} is based on the work carried out in \cite{bonometti2020theory, bonometti2021approximating}. Chapter \ref{chapter_implementation_testing} is based on the work carried out in \cite{bonometti2019modelling, bonometti2020theory, bonometti2021approximating}. Chapter \ref{chapter_repr_anal} is based on the work carried out in \cite{bonometti2021approximating}.
  \vspace{0.5in}

  \begin{minipage}{5.0in}
    \noindent Signed \dotfill (candidate)\\[1.5em]
    \noindent Date \dotfill \hspace{\candwidth}
  \end{minipage}
}

\newcommand{\afterPreface}[1]{
	\newpage
	\markright{}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\Huge \textbf{Acknowedgments}}
	\end{flushleft}
	\vspace{20\p@}
	#1
	\vspace{59\p@}
	\declaration
}

\newcommand{\yorkBib}[1]{
	\newpage
	\thispagestyle{plain}
	\pagestyle{myheadings}
	\markright{BIBLIOGRAPHY}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\huge \textbf{Bibliography}}
	\end{flushleft}
	\vspace{20\p@}
	The following is a list of material that is related to the 
        subject of this thesis but was not directly referanced.
	\input{#1}
}

\newcommand{\definitions}{
	\newpage
	\thispagestyle{plain}
	\pagestyle{myheadings}
	\markright{DEFINITIONS}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\Huge \textbf{Definitions}}
	\end{flushleft}
	\vspace{20\p@}
	This section contains Definitions of any terms specific
        to the thesis, including abbreviations and codes used 
        in illustrations.\\
}

\newcommand{\yorkGlossary}{
	\newpage
	\thispagestyle{plain}
	\pagestyle{myheadings}
	\markright{GLOSSARY}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\Huge \textbf{Glossary}}
	\end{flushleft}
	\vspace{20\p@}
        Terms that require explanation are defined in this section, 
        including a key to any abbreviations used.\\
}

\newcommand{\yorkIndex}{
	\thispagestyle{plain}
        \pagestyle{myheadings}
	\markright{INDEX}
        \printindex
}



