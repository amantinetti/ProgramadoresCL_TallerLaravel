% pclreport.cls
% Reports for the Programadores Chile Documents
% Arturo Mantinetti dev@manti.cl
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{pclreport} [30/03/2017 v0.1 Report of the pcl]



\DeclareOption*{\InputIfFileExists{\CurrentOption.pcl}{}{
\PassOptionsToClass{\CurrentOption}{report}}}
\ProcessOptions \relax
\LoadClass{report}

\RequirePackage[left=2.5cm,right=2.5cm,top=3cm,bottom=2cm]{geometry}
\RequirePackage{etoolbox}

\RequirePackage{fancyhdr}

\fancypagestyle{followingpage}{
  \fancyhf{}
  \fancyhead[RO]{\rightmark}%
  \fancyhead[LE]{\leftmark}%
  \fancyfoot[LE,RO]{\thepage}%
  \renewcommand{\headrulewidth}{0.7pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{plain}{
  \fancyhead{}%
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[LE,RO]{\thepage}
}

\pagestyle{followingpage}

\RequirePackage{theme/pcl}



\setlogo{PCL}

\newcommand{\pclsub}[1]{\gdef\pcl@sub{#1}}
\newcommand{\pcltitle}[1]{\gdef\pcl@title{#1}}

% string for email
\newcommand{\pcl@mail}{}
\newcommand{\email}[1]{\gdef\pcl@mail{#1}}

% string for profesor
\newcommand{\pcl@profesor}{}
\newcommand{\profesor}[1]{\gdef\pcl@profesor{#1}}



% Re-define the title
\def\maketitle{%
  \pcl@titlepage%
  \setcounter{page}{1}% page 1 (frontmatter)
  \thispagestyle{followingpage}
}

% Re-define chapter
\RequirePackage{titlesec}
\titleformat{\chapter}{}{\bf\LARGE\thechapter.~}{0em}{\bf\LARGE}

% Cover page
% Logo structure
\setlogosz{66.5mm}% tweaked by hand
\newcommand{\pcl@titlepage}{%
  \thispagestyle{empty}%
  % logo here
  \begin{center}%
    \bfseries%
    \ifdefempty{\@logo}{}{%ifnotempty
    \begin{minipage}{\@logosz}
    \@logo\\%
    %\begin{figure}[H]
    %\centering
    %%\includegraphics[scale=.4]{imagenes/logo.png}
    %\end{figure}


    \end{minipage}%
    }%ifnotmtarg
    \par\vspace{20pt}%
    \pcl@title\par%
    \pcl@sub\par%
    \rule[1pt]{\textwidth}{1pt}%

  \end{center}%
  % form the cover page
  \vskip 1em%
  {\bfseries%
    \vspace{20pt}%
    \begin{center}%
      {\LARGE\@title\par}%
      \vskip 25pt%
      {\large\@author}\\%
      {\texttt{\pcl@mail}}\\%
      \vskip 150pt%
      \large{\pcl@profesor}\\%
      \vskip 5pt%
      \vfill%
      \@date%
    \end{center}%
  }%
  \newpage%
}

% Set the spanish system (ironically, the comments are in english, but.. who cares)
\RequirePackage{theme/pclspanish}
