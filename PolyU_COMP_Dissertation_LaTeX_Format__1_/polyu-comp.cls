% polyu-comp.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{polyu-comp}[2025/09/08 PolyU COMP MSc dissertation class]

% Base class
\LoadClass[12pt,a4paper]{report}

% Core packages and global layout
\RequirePackage[a4paper, left=2.55cm, right=2.55cm, top=2.55cm, bottom=2.55cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage{lscape}
\RequirePackage{setspace}
\RequirePackage{ragged2e}
\RequirePackage{titlesec}
\RequirePackage{iftex}

% Fonts: pdflatex -> times (near TNR); xelatex/lualatex -> exact Times New Roman
\ifPDFTeX
  \RequirePackage{times}
\else
  \RequirePackage{fontspec}
  \setmainfont{Times New Roman}
\fi

% Global spacing/alignment/pagination
\singlespacing
\raggedright
\pagestyle{empty}

\makeatletter
\let\ps@plain\ps@empty
% Lock normalsize as 12pt with 1.2x baseline skip
\renewcommand\normalsize{\@setfontsize\normalsize{12pt}{14.4pt}}
\normalfont\normalsize
\makeatother

% Paragraph spacing: no indent, vertical gap between paragraphs
\setlength{\parskip}{1em}
\setlength{\parindent}{0pt}

% Headings: unify chapter/section to 28pt (used by ToC/LoF/LoT/Abstract/etc.)
\titleformat{\chapter}[block]{\bfseries\fontsize{28pt}{34pt}\selectfont}{}{0pt}{}
\titleformat{\section}{\bfseries\fontsize{28pt}{34pt}\selectfont}{}{0pt}{}
\titlespacing*{\chapter}{0pt}{0pt}{0.5em}

% -------------------- Cover page fields (override in main.tex if needed) --------------------
\newcommand{\CompTitle}{[DISSERTATION TITLE]}
\newcommand{\CompStudentName}{[Student Name]}
\newcommand{\CompDegree}{[MSc degree title]}
\newcommand{\CompSubmissionNote}{[Date of Submission Recommended:\\ January 2026 / May 2026 / August 2026]}

% Vertical spacing knobs for the cover page
\newlength\CompSkipTitleTop
\newlength\CompSkipTitleToName
\newlength\CompSkipNameToStmt
\newlength\CompSkipStmtToUniv
\newlength\CompSkipUnivToDate
\setlength\CompSkipTitleTop{3.0cm}
\setlength\CompSkipTitleToName{3.0cm}
\setlength\CompSkipNameToStmt{3.5cm}
\setlength\CompSkipStmtToUniv{3.5cm}
\setlength\CompSkipUnivToDate{0.0cm}

% Cover page macro (24pt title, 20pt others)
\newcommand{\printCompCover}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \centering

    \vspace*{\CompSkipTitleTop}
    {\bfseries\fontsize{24pt}{28pt}\selectfont \CompTitle\par}

    \vspace{\CompSkipTitleToName}
    {\fontsize{20pt}{24pt}\selectfont \CompStudentName\par}

    \vspace{\CompSkipNameToStmt}
    {\fontsize{20pt}{24pt}\selectfont
      \begin{minipage}{1.0\textwidth}\centering
        A dissertation submitted in partial fulfillment of the\\
        requirements for the degree of \CompDegree
      \end{minipage}\par}

    \vspace{\CompSkipStmtToUniv}
    {\fontsize{20pt}{24pt}\selectfont The Hong Kong Polytechnic University\par}

    \vspace{\CompSkipUnivToDate}
    {\fontsize{20pt}{24pt}\selectfont
      \begin{minipage}{1.0\textwidth}\centering
        \CompSubmissionNote
      \end{minipage}\par}
  \end{titlepage}%
}

% -------------------- Bibliography heading, subtitle, and list formatting --------------------
% Subtitle shown under "References" heading (12pt). Override in main.tex if needed.
\newcommand{\CompRefSubtitle}{[References used in the dissertation]}

\makeatletter
\renewenvironment{thebibliography}[1]{%
  % 28pt heading via titlesec formatting for \chapter
  \chapter*{\bibname}%
  % Subtitle directly under the heading (12pt, ragged-right)
  {\normalsize \CompRefSubtitle\par}%
  \vspace{1em}%
  % List layout aligned with body text
  \begingroup
  \setlength{\parskip}{1em}%
  \setlength{\parindent}{0pt}%
  \list{\@biblabel{\@arabic\c@enumiv}}{%
    \usecounter{enumiv}%
    \setlength{\labelwidth}{1.5em}%
    \setlength{\labelsep}{0.5em}%
    % \setlength{\leftmargin}{\labelwidth+\labelsep}%
    \setlength{\leftmargin}{\dimexpr\labelwidth+\labelsep\relax}%
    \setlength{\itemindent}{0pt}%
  }%
  \sloppy
}{%
  \endlist
  \endgroup
}
\makeatother
