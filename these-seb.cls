% ==============================================================
% CLASSE LaTeX POUR LA REDACTION DE THÈSE
% 
% Sébastien Le Roux d'après la classe écrite par Julien Chiquet
%
% Nécessite au moins un fichier de style pour la thèse
% plus le fichier de style pour les pages administratives
 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{these-seb}[2008/04/24 Classe pour ma thèse]
 
% POUR L'INSTANT UN SEUL !!!
%% Chargement de la classe book, avec transfert d'options
 
\PassOptionsToClass{a4paper}{book}
\PassOptionsToClass{12pt}{book}
\PassOptionsToClass{openright}{book}
\PassOptionsToClass{twoside}{book}
\PassOptionsToClass{english}{book}

% french est une option globale pour que tous
% les packages qui en ont besoin puisse l'utiliser.
% L'option twoside sert a indiquer que l'on
% souhaite du recto-verso. Donc il y aura
% alternement des marges (pour que ca soit bien aligné) 
% et les parties commenceront sur des pages impaires, 
% pour etre sur des pages de droite.
% openright indique que l'on souhaite que même
% les chapitres commencent sur des pages de droite, 
% c'est a dire sur des pages impaires. 

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption*{}
 
\ProcessOptions
\LoadClass{book}
 
% ==============================================================
% Packages standards requis
 
% Polices et encodage

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}


% ==========================================================================
% Entêtes améliorés
\RequirePackage{fancyhdr}
\RequirePackage{fancybox}

% Calcul des tailles d'environnement
\RequirePackage{calc}

% Lettrine
\RequirePackage{lettrine}
% ==========================================================================

% Configuration de la césure (-> Axel Reichert)
\tolerance = 1414
\hbadness = 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\widowpenalty=10000
\vfuzz \hfuzz
\raggedbottom
 
% =============================================
% Page de garde

\def\titleEN#1{\gdef\@titleEN{#1}}
\def\abstractEN#1{\gdef\@abstractEN{#1}}
\def\keywordsEN#1{\gdef\@keywordsEN{#1}}
\def\@author{}
\def\address#1{\gdef\@address{#1}}
\def\universite#1{\gdef\@universite{#1}}
\def\laboratoire#1{\gdef\@laboratoire{#1}}
\def\specialite#1{\gdef\@specialite{#1}}
 
\renewcommand{\titlepage}{%

  \begin{center}    
    \bigskip
    \vfill
	  {\large{{\bf{Sources of this document are available at:}}\\[0.25cm]
	  \href{https://github.com/Slookeur/OPEN}{https://github.com/Slookeur/OPEN}}
} \\
    \bigskip
    \vfill
    {\Huge{\bf{\@titleEN}}}
    \vfill
    {\large{\@author}} \\
    \bigskip
    {\small{\textsc{\@universite}}}
    \normalsize
    \end{center}
  \cleardoublepage
}
 
% ==========================================================================
% Mise en page
\voffset         0.0cm
\hoffset         0.0cm
\textheight     22.5cm
\textwidth      16.0cm
\topmargin       1.0cm
\oddsidemargin   0.0cm
\evensidemargin  0.0cm
 
% ==========================================================================
% Entêtes
% Entêtes standards

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[RO,LE]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
 
\fancypagestyle{main}{
  \fancyhf{}
  \fancyhead[RO]{\nouppercase{\rightmark}}
  \fancyhead[LO,RE]{\thepage}
  \fancyhead[LE]{\nouppercase{\leftmark}}
  \fancyfoot[RO,LE]{\thepage}
  \renewcommand{\headrulewidth}{1.0pt}
  \renewcommand{\footrulewidth}{0.0pt}
}

%\fancyhead{}
%\fancyhead[RO]{\scriptsize{\slshape\rightmark}}
%\fancyhead[LO]{\scriptsize{\thepage}}
%\fancyhead[RE]{\scriptsize{\thepage}}
%\fancyhead[LE]{\scriptsize{\slshape\leftmark}}
%\pagestyle{fancy}

 
% ==============================================================
% Préface
\newcommand{\beforepreface}{
  \frontmatter
  \pagestyle{empty}
  \titlepage
  \cleardoublepage
  \pagestyle{plain}
}
 
% ==============================================================
% Contenu maître
\newcommand{\afterpreface}{
  \mainmatter
  \pagestyle{main}
}
 
% noindent en début de section
%\addto\extrasfrench{\bbl@nonfrenchindent}

% ==========================================================================
% Redéfinition d'une partie:

% Commande \part

\renewcommand\part{%
  \cleardoublepage
  \thispagestyle{empty}%
  \@tempswafalse
  \null\vfil
  \secdef\@part\@spart}

% ==========================================================================
% Aspect des têtes de parties:

\def\@spart#1{%
% \vspace*{50\p@}%
% \vspace*{10\p@}%
  {\parindent \z@ \centering \reset@font
        \thickhrulefill
        \par\nobreak
        \vspace*{10\p@}%
        \interlinepenalty\@M
        \hrule
        \vspace*{10\p@}%
        \Huge \bfseries #1 \par\nobreak
        \par
        \vspace*{10\p@}%
        \hrule
%      \vskip 40\p@
    \vskip 200\p@
  }}
 
% ==========================================================================
% Aspect des têtes de chapitre:

\makeatletter
\def\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}
\def\@makechapterhead#1{%
  %\vspace*{50\p@}%
  \vspace*{10\p@}%
  {\parindent \z@ \centering \reset@font
        \thickhrulefill
        \par\nobreak
        \vspace*{10\p@}%
        \interlinepenalty\@M
        \hrule
        \vspace*{10\p@}%
        \Huge \bfseries #1\par\nobreak
        \par
        \vspace*{10\p@}%
        \hrule
    %\vskip 40\p@
    \vskip 100\p@
  }}

\makeatletter
\def\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}
\def\@makechapterhead#1{%
  %\vspace*{50\p@}%
  \vspace*{10\p@}%
  {\parindent \z@ \centering \reset@font
        \thickhrulefill\quad
        \scshape \@chapapp{} \thechapter
        \quad \thickhrulefill
        \par\nobreak
        \vspace*{10\p@}%
        \interlinepenalty\@M
        \hrule
        \vspace*{10\p@}%
        \Huge \bfseries #1\par\nobreak
        \par
        \vspace*{10\p@}%
        \hrule
    %\vskip 40\p@
    \vskip 100\p@
  }}
  \def\@makeschapterhead#1{%
  %\vspace*{50\p@}%
  \vspace*{10\p@}%
  {\parindent \z@ \centering \reset@font
        \thickhrulefill
        \par\nobreak
        \vspace*{10\p@}%
        \interlinepenalty\@M
        \hrule
        \vspace*{10\p@}%
        \Huge \bfseries #1\par\nobreak
        \par
        \vspace*{10\p@}%
        \hrule
    %\vskip 40\p@
    \vskip 100\p@
  }}
%\def\@makeschapterhead#1{%
  %\vspace*{50\p@}%
%  \vspace*{10\p@}%
%  {\parindent \z@ \centering \reset@font
%        \thickhrulefill
%        \par\nobreak
%        \vspace*{10\p@}%
%        \interlinepenalty\@M
%        \hrule
%        \vspace*{10\p@}%
%        \Huge \bfseries #1\par\nobreak
%        \par
%        \vspace*{10\p@}%
%        \hrule
%    %\vskip 40\p@
%    \vskip 100\p@
%  }}

\RequirePackage[hyperpageref]{backref}
\backreffrench
%\renewcommand*{\backref}[1]{}  % Disable standard
\renewcommand*{\backrefalt}[4]{% Detailed backref
  \ifcase #1 %
  \relax%(Not cited.)%
  \or
  (Cit\'e page~#2.)%
  \else
  (Cit\'e pages~#2.) 
  \fi}
 
% Page blanche après chapitre si nécessaire
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}
  \vspace*{\fill}
  \begin{center}
    ~
  \end{center}
  \vspace{\fill}
  \thispagestyle{empty}
  \newpage
  \if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother
 
% ---------------------------------------------------------------
% Lettrine
\newcommand{\malettrine}[1]{
  \lettrine[lines=2,lhang=0.33,loversize=0.33]{#1}
}
  
% ==========================================================================
% Colophon
\newcommand{\colophon}[1]{
  \strut\thispagestyle{empty}  
  \vfill                          % Je remplis avec du rien (\vfill}
  \pagebreak                     
  \thispagestyle{empty}
  ~\vfill
  \begin{center}
    \small #1
  \end{center}
}
