%------------------------------------------------------------------------------%
%
%   Classe LaTeX para formatar trabalhos acadêmicos no ICAT/UFAL
%
%   Edite este arquivo apenas se tiver certeza do que está fazendo!
%
% Marcelo Q A Oliveira
% marcelo@radar.ufal.br
%
%------------------------------------------------------------------------------%
%
% Esta classe herda as seguintes opções da classe base
%    - draft   - Produz uma versão de rascunho
%    - fleqn   - Alinha as equações a esquerda
%
% Nova opção de formatação
%    - short - Remove quase todas as páginas do preambulo do trabalho
%
%------------------------------------------------------------------------------%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icat_ufal}[2022/08/20 ICAT-UFAL Academic LaTeX Class]

%\newcommand*{\getclass}{profmat-cefet}
\newcommand*{\getclass}{icat-ufal}

% Package Options
%------------------------------------------------------------------------------%

% Add extra functionalities
\RequirePackage{etoolbox}
\RequirePackage{xparse}

% Default options
\newcommand*{\@DefUniv}{}
\newtoggle{@SHORT}

\newcommand*{\@TEXTMODE}{final}
\newcommand*{\@EQNALINEMENT}{}

% Text formating options
\DeclareOption{short}{\toggletrue{@SHORT}}
\DeclareOption{draft}{\renewcommand*{\@TEXTMODE}    {draft}}
\DeclareOption{fleqn}{\renewcommand*{\@EQNALINEMENT}{fleqn}}

\DeclareOption*
{
  \PackageWarning{\getclass}{Unknown ‘\CurrentOption’}
}

\ProcessOptions\relax

% Load base class: book
\LoadClass[12pt,a4paper,onecolumn,notitlepage,oneside,openany,\@TEXTMODE,\@EQNALINEMENT]{book}

% Packages to pt_BR localization
%------------------------------------------------------------------------------%

\RequirePackage[utf8]{inputenc}
\RequirePackage[english,brazil]{babel}
\RequirePackage{indentfirst}
\RequirePackage{icomma}
\RequirePackage{csquotes}

% Packages to add fonts and fix typesetting
%------------------------------------------------------------------------------%

\RequirePackage{ae}
\RequirePackage[T1]{fontenc}
\RequirePackage[final]{microtype}
\raggedbottom

% Add bibliography to table of contents
\RequirePackage[nottoc,notlot,notlof]{tocbibind}

% Ajust line spacings
%------------------------------------------------------------------------------%

% Line spacing control
\RequirePackage{setspace}

% Sets line spacing for preambule
\setstretch{1.0}

% More mathematical symbols
%------------------------------------------------------------------------------%

% Avoid upper casing math
\usepackage[overload]{textcase}

\RequirePackage{latexsym}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{nccmath}

% To add images
%------------------------------------------------------------------------------%

\RequirePackage{tikz}

% Add images
\RequirePackage{graphicx}

% To improve floats positioning
\def\fps@figure{htbp}
\def\fps@table{htbp}
\setcounter{topnumber}{4}
\setcounter{bottomnumber}{4}
\setcounter{totalnumber}{10}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.70}
\renewcommand{\floatpagefraction}{0.66}

\setcounter   {dbltopnumber}           {2}
\renewcommand*{\dbltopfraction}        {1}
\renewcommand*{\dblfloatpagefraction}{0.9}

% Caption configuration options
\RequirePackage[width=0.96\linewidth,justification=centerlast,labelfont=bf]{caption}

% Force floats to be on the original section
\RequirePackage[below]{placeins}

% Configurations and packages
%------------------------------------------------------------------------------%

% Allow margin adjustment
\RequirePackage{changepage}

% Allow inclusion of pdf pages on final document
\RequirePackage{pdfpages}

% Allow to comment parts of text
\RequirePackage{comment}

% Allow absolute positioning of elements on a page
\RequirePackage{textpos}

% More options to table configuration
\RequirePackage{array}

% Page Geometry
%------------------------------------------------------------------------------%

% Margin adjustment
\RequirePackage[a4paper,margin=25mm,top=30mm,bottom=20mm]{geometry}

% Text formatting
%------------------------------------------------------------------------------%

\setlength{\parindent}{1.25cm}

% Section numbering level
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}

% Chapter title configuration
\RequirePackage[bf,rm,compact,raggedright]{titlesec}
\font\bigrm = cmr10 at 35pt
\titleformat{\chapter}[hang]
            {\normalfont\huge\raggedright\setstretch{1.1}}
            {\textbf{\bigrm{\thechapter}}}
            {.7em}
            {\bfseries}
            [{\vspace{-5mm}\hrulefill\\[.8ex]}]
\titlespacing{\chapter}{0cm}{0.5cm}{1.5cm}

% Bug fix for titlesec version 2.10.1
% https://bugs.launchpad.net/ubuntu/+source/texlive-extra/+bug/1574052
\@ifpackagelater{titlesec}{2016/03/21}{}
{
  \patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
  \patchcmd{\ttlh@hang}{\noindent}{}{}{}
}

% Page header configuration
\RequirePackage{fancyhdr}
\renewcommand*{\chaptermark}[1]{\markboth{\thechapter.\ #1}{} }
\renewcommand*{\sectionmark}[1]{\markright{\thesection\ #1}}
\lhead[\fancyplain{}{\bfseries\thepage}]
      {\fancyplain{}{\small\slshape\bfseries\textit{\nouppercase{\leftmark}}}}
\rhead[\fancyplain{}{\small\slshape\bfseries\textit{\nouppercase{\rightmark}}}]
      {\fancyplain{}{\bfseries\thepage}}
\cfoot[\fancyplain{\bfseries\thepage}{}]
      {\fancyplain{\bfseries\thepage}{}}
\renewcommand*{\headrulewidth}{0.3pt}

\setlength{\headheight}{15pt}

% Appendix and annex parts
%------------------------------------------------------------------------------%

\renewcommand{\appendix}%
{%
\renewcommand{\chaptername}{Ap\^endice}
\renewcommand{\thechapter}{\Alph{chapter}}
%
\titleformat{\chapter}[display]
            {\normalfont\huge\raggedright\setstretch{1.1}}
            {\textbf{Ap\^endice \thechapter}}
            {0pt}
            {\bfseries}
            [{\vspace{-5mm}\hrulefill\\[.8ex]}]
%
\addtocontents{toc}{\protect{\par\vspace{\baselineskip}\noindent{\textbf{Ap\^endices}}\par}}
\setcounter{chapter}{0}
}

\newcommand{\annex}%
{%
\renewcommand{\chaptername}{Anexo}
\renewcommand{\thechapter}{\Alph{chapter}}
%
\titleformat{\chapter}[display]
            {\normalfont\huge\raggedright\setstretch{1.1}}
            {\textbf{Anexo \thechapter}}
            {0pt}
            {\bfseries}
            [{\vspace{-5mm}\hrulefill\\[.8ex]}]
%
\addtocontents{toc}{\protect{\par\vspace{\baselineskip}\noindent{\textbf{Anexos}}\par}}
\setcounter{chapter}{0}
\setstretch{1.0}
}

% To create Hyperlinks on pdf file
%------------------------------------------------------------------------------%

% Create hyperlinks and set nice colors
\RequirePackage[colorlinks=true,
                linktocpage=true,
                linkcolor=blue,
                urlcolor=blue,
                citecolor=blue]{hyperref}

\urlstyle{same}
\def\UrlBreaks{\do\/\do-}

% Theorems and proofs
%------------------------------------------------------------------------------%

% Theorem style
\newtheoremstyle{teostyle}%                   Name
{1.1\topsep}%                                 Space above
{1.1\topsep}%                                 Space below
{}%                                           Body font
{}%                                           Indent amount
{\bfseries}%                                  Theorem head font
{: }%                                         Punctuation after theorem head
{1pt}%                                        Space after theorem head
{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}% Theorem head spec

\theoremstyle{teostyle}

\newtheorem{teorema}   {Teorema}[chapter]
\newtheorem{axioma}    [teorema]{Axioma}
\newtheorem{definicao} [teorema]{Definição}
\newtheorem{postulado} [teorema]{Postulado}
\newtheorem{proposicao}[teorema]{Proposição}
\newtheorem{lema}      [teorema]{Lema}
\newtheorem{corolario} [teorema]{Corolário}

\newtheorem{exemplo}   {Exemplo}   [section]
\newtheorem{exercicio} {Exercício} [section]

% Adding identation to demonstrations
\renewenvironment{proof}[1][\proofname]
{%
  \par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \list{}{\leftmargin=.5\parindent
          \rightmargin=.5\parindent
          \settowidth{\itemindent}{\itshape#1}%
          \labelwidth=\itemindent
          \parsep=0pt
    \listparindent=\parindent
  }
  \item[\hskip\labelsep
        \itshape
    #1\@addpunct{.}]\ignorespaces
}
{%
  \popQED\endlist\@endpefalse
}

% Redefining quote and quotation to format text to italic
%------------------------------------------------------------------------------%

\renewenvironment{quote}
{%
  \setlength{\parindent}{0pt}%
  \vspace{0.5\baselineskip}%
  \begin{adjustwidth}{4cm}{0pt}%
    \begin{spacing}{1}%
    \begin{small}%
}
{%
    \end{small}%
    \end{spacing}%
  \end{adjustwidth}%
  \vspace{-0.4\baselineskip}%
}

\renewenvironment{quotation}
{%
  \setlength{\parindent}{0pt}%
  \vspace{0.3\baselineskip}%
  \begin{adjustwidth}{4cm}{0pt}%
    \begin{spacing}{1}%
    \begin{small}%
    \setlength{\parskip}{0.5\baselineskip}%
}
{%
    \end{small}%
    \end{spacing}%
  \end{adjustwidth}%
  \vspace{-0.3\baselineskip}%
}

% New commands
%------------------------------------------------------------------------------%

% Translating mathematical function names to Portuguese
\let\sin\relax        \DeclareMathOperator{\sin}{sen}
\let\csc\relax        \DeclareMathOperator{\csc}{cossec}
\let\tan\relax        \DeclareMathOperator{\tan}{tg}
\let\cot\relax        \DeclareMathOperator{\cot}{cotg}
\let\arcsin\relax     \DeclareMathOperator{\arcsin}{arcsen}
\let\arctan\relax     \DeclareMathOperator{\arctan}{arctg}

% New inverse trigonometric functions
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccsc}{arccossec}
\DeclareMathOperator{\arccot}{arccotg}

% Common numerical sets
\newcommand*{\N}{\mathbb{N}}
\newcommand*{\Z}{\mathbb{Z}}
\newcommand*{\Q}{\mathbb{Q}}
\newcommand*{\R}{\mathbb{R}}
\newcommand*{\C}{\mathbb{C}}

%------------------------------------------------------------------------------%
%------------------------------------------------------------------------------%
%------------------------------------------------------------------------------%
%
%                       University Dependent Contend
%
%------------------------------------------------------------------------------%
%------------------------------------------------------------------------------%
%------------------------------------------------------------------------------%

\newcommand*{\TheUNI}       {UFAL}
\newcommand*{\ThePlace}     {Maceió}
\newcommand*{\TheUniversity}{Universidade Federal de Alagoas}
\newcommand*{\@TheDeclaration}
{
  Dissertação apresentada ao Colegiado do curso de Pós Graduação em Meteorologia do Instituto de Ciências Atmosféricas da Universidade Federal de Alagoas como parte das exigências do Programa de Pós-Graduação, para obtenção do título de Mestre em Meteorologia.
}


%------------------------------------------------------------------------------%

% Defines university place
\newcommand*{\@Place}
{
  \null
  \vfill
  \begin{center}
    \textsc{\ThePlace \\ \@TheYear}
  \end{center}
}

% Defines the declaration
\newcommand*{\@Declaration}
{%
  \begin{spacing}{1}
    % Author name
    \begin{textblock*}{\linewidth}(0cm,-\baselineskip)
      \begin{center}
        \textsc{\large\@TheAuthor}
      \end{center}
    \end{textblock*}
    % Dissertation title
    \begin{textblock*}{\linewidth}[0,0.5](0cm,0.23\textheight)
      \begin{center}
        \begin{spacing}{1.7}
            \textbf{\large\@TheTITLE}
        \end{spacing}
      \end{center}
    \end{textblock*}
    % Declaration
    \begin{textblock*}{0.59\linewidth}(0.4\linewidth,0.35\textheight)
      \noindent \@TheDeclaration
    \end{textblock*}
  \end{spacing}
}

% Commands to collect dissertation information
%------------------------------------------------------------------------------%

\newcommand*{\@Monthpt}[1]
{%
  \ifcase#1
  \or janeiro%    1
  \or fevereiro%  2
  \or março%      3
  \or abril%      4
  \or maio%       5
  \or junho%      6
  \or julho%      7
  \or agosto%     8
  \or setembro%   9
  \or outubro%   10
  \or novembro%  11
  \or dezembro%  12
  \fi%
}

% Signature Table
%------------------------------------------------------------------------------%

\newcommand*{\@SignatureBox}[1]
{
  \begin{minipage}[t][4\baselineskip]{0.6\linewidth}
    \begin{spacing}{1}
      \begin{center}
        \hrulefill \\ {#1}
      \end{center}
    \end{spacing}
  \end{minipage}
}

\newcommand*{\@SignaturesTable}
{
  \begin{center}
    \vspace{1\baselineskip} \@SignatureBox{\@TheAuthor \\ (\@AuthorTitle) } \\
    \vspace{2\baselineskip} \@SignatureBox{\@TheAdviser\\ (\@AdviserTitle)}
  \end{center}
}

% Dissertation Title
%------------------------------------------------------------------------------%

\newcommand*{\@TheTitle}{Título da Dissertação}
\newcommand*{\@TheTITLE}{TÍTULO DA DISSERTAÇÃO}

\renewcommand*{\title}[1]{\renewcommand*{\@TheTitle}{{#1}}\renewcommand*{\@TheTITLE}{\MakeUppercase{#1}}}

% Dissertation Author
%------------------------------------------------------------------------------%

\newcommand*{\@AuthorTitle}{Autor(a)}
\newcommand*{\@TheAuthor}  {Nome do(a) Autor(a)}

\newcommand*{\autor}[1]
{
  \renewcommand*{\@AuthorTitle}{Autor}
  \renewcommand*{\@TheAuthor}{{#1}}
}
\newcommand*{\autora}[1]
{
  \renewcommand*{\@AuthorTitle}{Autora}
  \renewcommand*{\@TheAuthor}{{#1}}
}

\renewcommand{\author}[1]{\autor{#1}}

% Adiviser
%------------------------------------------------------------------------------%

\newcommand*{\@AdviserTitle}{Orientador(a)}
\newcommand*{\@TheAdviser}{Nome do(a) Orientador(a)}

\newcommand*{\orientador} [1]{ \renewcommand*{\@TheAdviser}{#1} \renewcommand*{\@AdviserTitle}{Orientador}}
\newcommand*{\orientadora}[1]{ \renewcommand*{\@TheAdviser}{#1} \renewcommand*{\@AdviserTitle}{Orientadora}}

% Co-Adviser
%------------------------------------------------------------------------------%

\newtoggle{@COADV}
\togglefalse{@COADV}

\newcommand*{\coorientacao}[1]%
{%
  \toggletrue{@COADV}
  \newcommand*{\@CoadviserDeclaration}{Coorientação \\ {#1} }
}

% Defence Date
%------------------------------------------------------------------------------%
\newcommand*{\@TheDay}    {31}
\newcommand*{\@TheMonth}  {02}
\newcommand*{\@TheYear}   {2000}
\newcommand*{\@TheMonthpt}{\@Monthpt{2}}
\newcommand*{\@TheMonthEN}{\@MonthEN{2}}
\newcommand*{\@TheDate}   {\@TheDay\ de \@TheMonthpt\ de \@TheYear}

\renewcommand*{\date}[3]
{
  \renewcommand*{\@TheDay}    {{#1}}
  \renewcommand*{\@TheMonth}  {{#2}}
  \renewcommand*{\@TheYear}   {{#3}}
  \renewcommand*{\@TheMonthpt}{\@Monthpt{#2}}
  \renewcommand*{\@TheMonthEN}{\@MonthEN{#2}}
  \renewcommand*{\@TheDate}   {\@TheDay\ de \@TheMonthpt\ de \@TheYear}
}

% Board Names
%------------------------------------------------------------------------------%
\newcommand{\@TheBoard}{Membros da Banca}

\newcommand{\banca}[1]{\renewcommand{\@TheBoard}{#1}}

% Dissertation preamble
%------------------------------------------------------------------------------%

% Make Title page
%------------------------------------------------------------------%
\newcommand*{\MakeTitlePage}
{
  \begin{center}
    \textsc{\TheUniversity \\[1mm] PPGMET - Programa de Pós Graduação em Meteorologia} \\[9mm]
    \begin{figure}[ht]
    \begin{center}
        \advance\leftskip-3cm
        \advance\rightskip-3cm
        \includegraphics[width=50mm]{figs/icat} 
    \end{center}\end{figure}
  \end{center}
  \begin{textblock*}{\linewidth}(0cm,0.03\textheight)
    \begin{center}
      \textsc{\large\@TheAuthor}
    \end{center}
  \end{textblock*}
  \begin{textblock*}{\linewidth}(0cm,0.2\textheight)
    \begin{center}
      \begin{spacing}{2}
        \textsc{\LARGE\@TheTitle}
      \end{spacing}
    \end{center}
  \end{textblock*}
  \@Place
}

% Make Declaration page
%------------------------------------------------------------------%
\newcommand*{\MakeDeclarationPage}
{%
  \@Declaration \par \vspace{\baselineskip}
  \begin{textblock*}{0.55\linewidth}(0.43\linewidth,0.45\textheight)
    \begin{flushleft}
      \hyphenpenalty   10000
      \exhyphenpenalty 10000
                        \noindent \hspace{-0.06\linewidth}\@AdviserTitle\\ \@TheAdviser \par \vspace{\baselineskip}
      \iftoggle{@COADV}{\noindent \hspace{-0.06\linewidth}\@CoadviserDeclaration        \par \vspace{\baselineskip}}{}
                        \noindent \hspace{-0.06\linewidth}Banca Examinadora\\ \@TheBoard
    \end{flushleft}
  \end{textblock*}
  \@Place
}

% Make index card page
%------------------------------------------------------------------%
\newcommand*{\MakeIndexCardPage}
{%
  \IfFileExists{./ficha_catalografica.pdf}    {\includepdf[pages=last-last]{./ficha_catalografica.pdf}}{%
  \IfFileExists{./ficha_catalografica.pdf.pdf}{\includepdf[pages=last-last]{./ficha_catalografica.pdf.pdf}}{%
    \clearpage
    \null\vspace{3cm}
    \begin{adjustwidth}{3cm}{3cm}%
      \begin{center}
        \textsc{\Large Ficha Catalográfica} \vfill
        {
          Copie o arquivo
          \\[2mm]
          {\textbf{\texttt{ficha\_catalografica.pdf}}}
          \\[2mm]
          fornecido pela Biblioteca Central da \TheUNI{} para a pasta do trabalho e a ficha catalográfica será automaticamente incluída aqui.
          \vfill
          Para substituir a página de assinaturas pelo aquivo escaneado com as assinaturas,\\ crie o arquivo
          \\[2mm]
          {\textbf{\texttt{assinaturas.pdf}}}
          \\[2mm]
          e copie-o na pasta do trabalho. Ele substituirá a página de assinaturas.
          \vfill
        }
      \end{center}
    \end{adjustwidth}
    \clearpage
  }}
}

% Make Signatures page
%------------------------------------------------------------------%
\newcommand*{\@MakeSignaturesPage}
{%
  \@Declaration
  \vspace{0.51\textheight}
  \noindent
  \textsc{Aprovada}: \@TheDate.
  \\[2\baselineskip]
  \begin{adjustwidth}{2mm}{2mm}
    \@SignaturesTable
  \end{adjustwidth}
  \@Place
}

\newcommand*{\MakeSignaturesPage}
{%
    \IfFileExists{./assinaturas.pdf}    {\includepdf{./assinaturas.pdf}}{%
    \IfFileExists{./assinaturas.pdf.pdf}{\includepdf{./assinaturas.pdf.pdf}}{%
      \@MakeSignaturesPage
    }}
}

% Acknowledgement and biography
%------------------------------------------------------------------------------%

\newcommand*{\CreateEnvironment}[4]
{
  \newenvironment{#1}
  {
    \chapter*{#2}
    \begin{adjustwidth}{#3}{#4}
    \vspace{-\baselineskip}
    \hspace{\parindent}
  }
  {
    \end{adjustwidth}
    \clearpage
  }
}

\iftoggle{@SHORT}
{
  \excludecomment{acknowledgement}
  \excludecomment{biography}
}
{
  \CreateEnvironment{acknowledgement}{Agradecimentos}{2cm}{1cm}
  \CreateEnvironment{biography}      {Biografia}     {2cm}{1cm}
}

% Dedication
%------------------------------------------------------------------------------%

\iftoggle{@SHORT}
{
  \excludecomment{dedication}
}
{
  \newenvironment{dedication}
  {
    \clearpage
    \null
    \vfill
    \begin{adjustwidth}{0.5\linewidth}{0pt}
  }
  {
    \end{adjustwidth}
    \vspace{3cm}
    \null
    \clearpage
  }
}

\newenvironment{Resumo}
{
  \chapter*{Resumo}
  \markboth{Resumo}{Resumo}
  \noindent\trivlist\item\ignorespaces
}
{
  \endtrivlist
}

\newenvironment{Abstract}
{
  \chapter*{Abstract}
  \markboth{Abstract}{Abstract}
  \begin{otherlanguage}{english}
  \noindent\trivlist\item\ignorespaces
}
{
  \endtrivlist
  \end{otherlanguage}
}

\newcommand*{\PalavrasChave}{\par\vspace{\baselineskip}\noindent Palavras-chave: }
\newcommand*{\Keywords}     {\par\vspace{\baselineskip}\noindent Keywords: }

%------------------------------------------------------------------------------%
%------------------------------------------------------------------------------%
%------------------------------------------------------------------------------%
%
%                End of University Dependent Contend
%
%------------------------------------------------------------------------------%
%------------------------------------------------------------------------------%
%------------------------------------------------------------------------------%

% Make Preamble
%------------------------------------------------------------------------------%
\AtBeginDocument
{%
  \pagestyle{empty}
  \assignpagestyle{\chapter}{empty}
  \MakeTitlePage
  \clearpage
  \iftoggle{@SHORT}{}
  {%
    \MakeDeclarationPage \clearpage
    \MakeIndexCardPage   \clearpage
    \MakeSignaturesPage  \clearpage
    \setcounter{page}{3}
  }
  \renewcommand*{\bibname}{Referências}
}

% Closes the preamble
%------------------------------------------------------------------------------%

\let\OriginalTableOfContents\tableofcontents

\renewcommand*{\tableofcontents}
{
  \clearpage
  \OriginalTableOfContents
  \@openrighttrue
  \clearpage
  \pagestyle{fancyplain}
  \assignpagestyle{\chapter}{plain}
  % Line spacing for the dissertation body
  \setstretch{1.5}
}

% Used only for the example text
%------------------------------------------------------------------------------%
%------------------------------------------------------------------------------%

% Code listings
%------------------------------------------------------------------------------%
\usepackage{courier}
\usepackage{listings}
\usepackage{color}

\definecolor{numbercolor}{rgb}{0,0.6,0}
\definecolor{commentcolor}{gray}{0.3}
\definecolor{stringcolor}{rgb}{0.58,0,0.82}
\definecolor{backcolor}{rgb}{1,1,1}
\definecolor{basiccolor}{rgb}{0,0,1}
\definecolor{keywordcolor}{rgb}{0.5,0,0.5}

\lstdefinestyle{LaTeXstyle}
{
  language=[LaTeX]TeX,
  backgroundcolor=\color{backcolor},
  basicstyle=\linespread{0.9}\ttfamily\footnotesize\color{basiccolor},
  commentstyle=\color{commentcolor},
  keywordstyle=\color{keywordcolor},
  numberstyle=\color{numbercolor},
  stringstyle=\color{stringcolor},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=t,
  abovecaptionskip=-\baselineskip,
  belowcaptionskip=0pt,
  xleftmargin=0pt,
  xrightmargin=0pt,
  deletekeywords={...},
  escapeinside={(*}{*)},
  frame=none,
  keepspaces=true,
  numbers=none,
  numbersep=5pt,
  rulecolor=\color{black},
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  stepnumber=2,
  tabsize=2,
  title=\lstname,
  columns=fullflexible,
  alsoletter={\\,-},
  morekeywords={
    \\acute,
    \\addbibresource,
    \\aleph,
    \\alpha,
    \\amalg,
    \\angle,
    \\approx,
    \\arccos,
    \\arccot,
    \\arccsc,
    \\arcsec,
    \\arcsin,
    \\arctan,
    \\arg,
    \\autor,
    \\ast,
    \\asymp,
    \\author,
    \\autor,
    \\autora,
    \\backslash,
    \\bar,
    \\begin,
    \\beta,
    \\bf,
    \\bibitem,
    \\bibliography,
    \\bibliographystyle,
    \\bigcirc,
    \\bigtriangledown,
    \\bigtriangleup,
    \\banca,
    \\bot,
    \\bowtie,
    \\Box,
    \\breve,
    \\bullet,
    \\c,
    \\C,
    \\cap,
    \\caption,
    \\cdot,
    \\centering,
    \\chapter,
    \\check,
    \\chi,
    \\circ,
    \\cite,
    \\citeauthor,
    \\citeauthoronline,
    \\citeonline,
    \\citeyear,
    \\clubsuit,
    \\cong,
    \\coorientacao,
    \\cos,
    \\cosh,
    \\cot,
    \\coth,
    \\csc,
    \\cup,
    \\dagger,
    \\dashv,
    \\date,
    \\ddagger,
    \\ddot,
    \\deg,
    \\delta,
    \\Delta,
    \\det,
    \\diamond,
    \\Diamond,
    \\diamondsuit,
    \\dim,
    \\div,
    \\documentclass,
    \\dot,
    \\doteq,
    \\downarrow,
    \\Downarrow,
    \\ell,
    \\emph,
    \\emptyset,
    \\end,
    \\epsilon,
    \\eqref,
    \\equiv,
    \\eta,
    \\exists,
    \\exp,
    \\fake,
    \\fbox,
    \\flat,
    \\footnote,
    \\forall,
    \\frac,
    \\frown,
    \\gamma,
    \\Gamma,
    \\gcd,
    \\geq,
    \\gg,
    \\grave,
    \\hat,
    \\hbar,
    \\heartsuit,
    \\hom,
    \\hspace,
    \\Im,
    \\imath,
    \\in,
    \\includegraphics,
    \\includepdf,
    \\inf,
    \\infty,
    \\it,
    \\iota,
    \\item,
    \\Keywords,
    \\jmath,
    \\Join,
    \\kappa,
    \\ker,
    \\label,
    \\lambda,
    \\Lambda,
    \\langle,
    \\LaTeX,
    \\lceil,
    \\left,
    \\leq,
    \\lfloor,
    \\lg,
    \\lhd,
    \\linewidth,
    \\lim,
    \\liminf,
    \\limsup,
    \\listoffigures,
    \\listoftables,
    \\ll,
    \\ln,
    \\log,
    \\max,
    \\mho,
    \\mid,
    \\min,
    \\mathbb,
    \\models,
    \\mp,
    \\mu,
    \\N,
    \\nabla,
    \\natural,
    \\neg,
    \\neq,
    \\ni,
    \\nocite,
    \\nonumber,
    \\nu,
    \\odot,
    \\omega,
    \\Omega,
    \\ominus,
    \\oplus,
    \\orientador,
    \\orientadora,
    \\PalavrasChave,
    \\oslash,
    \\otimes,
    \\parallel,
    \\partial,
    \\perp,
    \\phi,
    \\Phi,
    \\pi,
    \\Pi,
    \\pm,
    \\Pr,
    \\prec,
    \\preceq,
    \\prime,
    \\propto,
    \\psi,
    \\Psi,
    \\Q,
    \\qquad,
    \\quad,
    \\R,
    \\rangle,
    \\rceil,
    \\Re,
    \\ref,
    \\rfloor,
    \\rhd,
    \\rho,
    \\right,
    \\Rightarrow,
    \\sec,
    \\section,
    \\setminus,
    \\sharp,
    \\sigma,
    \\Sigma,
    \\sim,
    \\simeq,
    \\sin,
    \\sinh,
    \\smile,
    \\spadesuit,
    \\sqcap,
    \\sqcup,
    \\sqsubset,
    \\sqsubseteq,
    \\sqsupset,
    \\sqsupseteq,
    \\star,
    \\subsection,
    \\subset,
    \\subseteq,
    \\subsubsection,
    \\succ,
    \\succeq,
    \\sum,
    \\sup,
    \\supset,
    \\supseteq,
    \\surd,
    \\tableofcontents,
    \\tan,
    \\tanh,
    \\tau,
    \\text,
    \\textasciicircum,
    \\textasciitilde,
    \\textbackslash,
    \\textbf,
    \\textit,
    \\textsc,
    \\thebibliography,
    \\textsuperscript,
    \\theta,
    \\Theta,
    \\tilde,
    \\times,
    \\title,
    \\titleEn,
    \\top,
    \\triangle,
    \\triangleleft,
    \\triangleright,
    \\underline,
    \\unlhd,
    \\unrhd,
    \\uparrow,
    \\Uparrow,
    \\updownarrow,
    \\Updownarrow,
    \\uplus,
    \\upsilon,
    \\Upsilon,
    \\usepackage,
    \\varepsilon,
    \\varphi,
    \\varphi,
    \\varrho,
    \\varsigma,
    \\vartheta,
    \\vdash,
    \\vec,
    \\vee,
    \\wedge,
    \\wp,
    \\wr,
    \\xi,
    \\Xi,
    \\Z,
    \\zeta,
    @Article,
    @Book,
    @Booklet,
    @Conference,
    @InBook,
    @InCollection,
    @InProceedings,
    @Manual,
    @MasterThesis,
    @Misc,
    @Online,
    @PhdThesis,
    @Proceedings,
    @Unpublished,
    Address,
    Author,
    BookTitle,
    Conference-Location,
    Conference-Number,
    Conference-Year,
    Edition,
    ISBN,
    Journal,
    Note,
    Number,
    Organization,
    Pages,
    Publisher,
    School,
    Series,
    Subtitle,
    Title,
    Type,
    Url,
    UrlAccessDate,
    Volume,
    Year,
    },
  extendedchars=true,
}

\lstset{style=LaTeXstyle}

\newcommand{\miktexversion}{2.9.6813}

% Bibligraphy using biblatex
%------------------------------------------------------------------------------%

\RequirePackage[num,abnt-url-package=hyperref]{abntex2cite}

\citebrackets[]

\def\UrlLeft{}
\def\UrlRight{}

\renewcommand{\authorstyle}{\hypersetup{citecolor=black}}
\renewcommand{\yearstyle}{\hypersetup{citecolor=black}}

%------------------------------------------------------------------------------%
\endinput
%------------------------------------------------------------------------------%
