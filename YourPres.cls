% YourPres.cls
%
% LaTeX beamer presentation template
% Based on YourPres.cls (c) Valeria Puzikova
%
% Modified for public example -- colors, fonts, and branding are generic
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ============================================================================
%  1. ЗАГОЛОВОК КЛАССА
% ============================================================================

% Сообщаем LaTeX, что этот файл — класс (CLS), а не пакет (STY)
\NeedsTeXFormat{LaTeX2e}
% Регистрируем класс: имя, дата версии, номер версии.
% Дата используется LaTeX'ом для проверки актуальности.
\ProvidesClass{YourPres}[08/08/2026 V.2.0.0]

% ============================================================================
%  2. ЗАГРУЗКА БАЗОВОГО КЛАССА beamer И НАСТРОЙКИ СТРАНИЦЫ
% ============================================================================

% Загружаем beamer с параметрами:
%   hyperref=xetex — гиперссылки через драйвер XeTeX,
%   final          — финальный режим (не draft),
%   8pt            — базовый размер шрифта,
%   width, height  — ширина и высота слайда в мм,
%   scale=1        — масштаб 1:1,
%   aspectratio=169 — соотношение 16:9.
\LoadClass[hyperref=xetex, final,8pt, width=33.867,height=19.05,scale=1,aspectratio=169]{beamer}
% Отступы текста от левого и правого края слайда.
% Меняйте эти значения, если нужно сдвинуть текст к краям или от краев.
\setbeamersize{text margin left=0.75cm, text margin right=0.75cm}

% ============================================================================
%  3. ПАКЕТЫ — НЕОБХОДИМЫЕ ДЛЯ РАБОТЫ ШАБЛОНА
% ============================================================================

% fontspec — загрузка системных и пользовательских TTF/OTF-шрифтов.
%           Обязателен для XeLaTeX. Без него не работают \setmainfont и т.д.
\RequirePackage{fontspec}
% xltxtra — дополнительные улучшения для XeLaTeX (типографские кавычки и т.п.)
\RequirePackage{xltxtra}
% cmap — копирование кириллицы из PDF (чтобы текст не терялся при копировании)
\RequirePackage{cmap}
% polyglossia — многоязычная верстка (замена babel для XeLaTeX)
\RequirePackage{polyglossia}
% Устанавливаем основной язык — русский
\setdefaultlanguage{russian}
% Дополнительный язык — английский (для переключения \selectlanguage{english})
\setotherlanguage{english}
% Включаем babel-совместимые шортханды для русского (чтобы работали "--- и т.п.)
\setkeys{russian}{babelshorthands=true}
% Предварительная настройка hyperref (подключится позже в beamer).
% unicode — поддержка Unicode в закладках PDF,
% colorlinks — цветные ссылки вместо рамок,
% bookmarks — создание закладок PDF.
\hypersetup{unicode=true,colorlinks=true, bookmarks=true}
% xunicode — дополнительные Unicode-подстановки для XeTeX
\RequirePackage{xunicode}

% ============================================================================
%  4. МАТЕМАТИКА И ТИПОГРАФИКА
% ============================================================================

% \frenchspacing — отключает увеличенные пробелы после точки.
%                 В русском языке точки не разносят предложения визуально,
%                 поэтому это уместно.
\frenchspacing
% Стандартные математические пакеты
\RequirePackage{amsfonts}   % математические шрифты (mathbb и т.д.)
\RequirePackage{amssymb}    % математические символы
\RequirePackage{amsmath}    % многострочные формулы, матрицы и пр.
% marvosym — содержит полезные пиктограммы (Mundus, \Crossedbox и др.)
\RequirePackage{marvosym}
% multirow — объединение строк в таблицах
\RequirePackage{multirow}
% multicol — многоколоночная верстка на слайдах
\RequirePackage{multicol}
% tabularx — таблицы с автоматическим подбором ширины колонок
\RequirePackage{tabularx}
% array — расширенные преамбулы таблиц (нужен для колонок = и +)
\RequirePackage{array}
% graphicx — вставка изображений (\includegraphics)
\RequirePackage{graphicx}
% wrapfig — обтекание текстом рисунков
\RequirePackage{wrapfig}
% afterpage — выполнение команд после текущей страницы
\RequirePackage{afterpage}
% ifthen — условные конструкции
\RequirePackage{ifthen}
% xcolor — расширенная работа с цветами (смешивание, оттенки)
\RequirePackage{xcolor}
% color — базовая работа с цветами (может дублировать xcolor, оставлено для совместимости)
\RequirePackage{color}
% euscript — красивый рукописный шрифт для математики (\mathscr)
\RequirePackage{euscript}
% Временное снятие \Cross (чтобы избежать конфликта с marvosym)
\let\Cross\relax
% bbding — декоративные буллиты, крестики, галочки (\Crossedbox, \Checkedbox)
\RequirePackage{bbding}
% colortbl — цветные строки и столбцы в таблицах (\rowcolor, \columncolor)
\RequirePackage{colortbl}
% tikz — векторная графика внутри LaTeX (нужна для круглых фото авторов)
\RequirePackage{tikz}
% xpatch — расширенное патч-команды для изменения чужих макросов
\RequirePackage{xpatch}
% textcase — преобразование регистра текста (\MakeTextUppercase)
\RequirePackage{textcase}
% algorithm, algpseudocode — верстка псевдокода
\RequirePackage{algorithm, algpseudocode}
% caption — настройка подписей к рисункам/таблицам:
%           маленький курсивный шрифт, точка после номера, отступ сверху 2pt
\RequirePackage[margin=2pt,font={scriptsize,it},labelfont={scriptsize,it},labelsep=period,labelformat=simple,aboveskip=2pt]{caption}
% siunitx — форматирование чисел и единиц измерения (группы разрядов, \num{1e-2})
\RequirePackage[group-digits=integer, group-minimum-digits=4]{siunitx}
% animate — вставка анимаций (последовательность PNG-кадров) для PDF
\RequirePackage[xetex]{animate}
% listings — подсветка синтаксиса кода (C++, Python и др.)
\RequirePackage{listings}

% ============================================================================
%  5. ЦВЕТОВАЯ СХЕМА beamer
% ============================================================================

% Включаем встроенную цветовую тему orchid (темные заголовки блоков на светлом фоне)
\usecolortheme{orchid}

% ============================================================================
%  6. ШРИФТЫ — ЗАГРУЗКА ИЗ ЛОКАЛЬНЫХ TTF-ФАЙЛОВ
% ============================================================================
%
% Все шрифты лежат в папке fonts/ рядом с этим файлом.
% Если хотите поменять шрифт — положите свой .ttf в fonts/ и измените имя файла.
%
% Параметры fontspec:
%   Path=fonts/       — путь к папке со шрифтами (относительно .tex-файла)
%   BoldFont=...      — какой файл использовать для жирного начертания
%   ItalicFont=...    — какой файл использовать для курсива
%   BoldItalicFont=...— какой файл использовать для жирного курсива
%
% Доступные шрифты (лежат в fonts/):
%   Inter (Regular, Bold, Italic, BoldItalic) — основной гротеск
%   JetBrainsMono (Regular, Bold) — моноширинный для кода
%   OpenSans (Regular, Bold) — альтернативный (не используется, но лежит)
%
% Чтобы использовать OpenSans вместо Inter, замените Inter-* на OpenSans-*.

% Глобальные настройки fontspec: лигатуры TeX (---, --, <<>>) и типографские кавычки
\defaultfontfeatures{Ligatures={TeX},Mapping=tex-text}
% Основной шрифт презентации (для обычного текста). Жирный — Inter-Bold.
% Замените на [BoldFont=OpenSans-Bold.ttf]{OpenSans-Regular.ttf} для OpenSans.
\setmainfont[Path=fonts/, BoldFont=Inter-Bold.ttf, ItalicFont=Inter-Italic.ttf, BoldItalicFont=Inter-BoldItalic.ttf]{Inter-Regular.ttf}
% \setromanfont — то же самое, что \setmainfont (римский шрифт). Дублируем для совместимости.
\setromanfont[Path=fonts/, BoldFont=Inter-Bold.ttf, ItalicFont=Inter-Italic.ttf, BoldItalicFont=Inter-BoldItalic.ttf]{Inter-Regular.ttf}
% \setsansfont — гротескный шрифт (beamer использует sffamily по умолчанию).
\setsansfont[Path=fonts/, BoldFont=Inter-Bold.ttf, ItalicFont=Inter-Italic.ttf, BoldItalicFont=Inter-BoldItalic.ttf]{Inter-Regular.ttf}
% \setmonofont — моноширинный шрифт для \texttt и листингов кода.
\setmonofont[Path=fonts/, BoldFont=JetBrainsMono-Bold.ttf]{JetBrainsMono-Regular.ttf}
% \cyrillicfont — обязательная команда polyglossia для кириллического основного шрифта.
\newfontfamily{\cyrillicfont}[Path=fonts/, BoldFont=Inter-Bold.ttf, ItalicFont=Inter-Italic.ttf, BoldItalicFont=Inter-BoldItalic.ttf]{Inter-Regular.ttf}
% \cyrillicfonttt — кириллический моноширинный шрифт.
\newfontfamily{\cyrillicfonttt}[Path=fonts/, BoldFont=JetBrainsMono-Bold.ttf]{JetBrainsMono-Regular.ttf}
% \cyrillicfontsf — кириллический гротеск (sans-serif).
\newfontfamily{\cyrillicfontsf}[Path=fonts/, BoldFont=Inter-Bold.ttf, ItalicFont=Inter-Italic.ttf, BoldItalicFont=Inter-BoldItalic.ttf]{Inter-Regular.ttf}
% \cyrillicfontrm — кириллический римский шрифт.
\newfontfamily{\cyrillicfontrm}[Path=fonts/, BoldFont=Inter-Bold.ttf, ItalicFont=Inter-Italic.ttf, BoldItalicFont=Inter-BoldItalic.ttf]{Inter-Regular.ttf}

% ============================================================================
%  7. НАСТРОЙКИ ШРИФТОВ beamer (ЗАГОЛОВКИ, ПОДПИСИ, НИЖНИЙ КОЛОНТИТУЛ)
% ============================================================================

% Заголовок фрейма: используем sffamily (гротеск), размер \huge (≈20pt при базовом 8pt)
\setbeamerfont{frametitle}{family=\sffamily,size=\huge}
% Подзаголовок фрейма: sffamily, размер \footnotesize (≈10pt)
\setbeamerfont{framesubtitle}{family=\sffamily,size=\footnotesize}
% Подпись к рисункам/таблицам: sffamily, нормальное начертание (не курсив по умолчанию)
\setbeamerfont{caption}{family=\sffamily, shape=\normalfont}
% Нижний колонтитул (номер страницы): sffamily
\setbeamerfont{footline}{family=\sffamily}

% ============================================================================
%  8. ЦВЕТ ЭЛЕМЕНТОВ beamer
% ============================================================================

% Цвет подзаголовка фрейма — черный (fg=black). Можете заменить на YourParam и т.д.
\setbeamercolor{framesubtitle}{fg=black}

% ============================================================================
%  9. ШАБЛОН ЗАГОЛОВКА ФРЕЙМА (FRAMETITLE)
% ============================================================================

\makeatletter
% Определяем собственный шаблон frametitle с именем "my theme"
\defbeamertemplate*{frametitle}{my theme}
{%
  % Если подзаголовок не задан явно, используем название текущего раздела
  \ifx\insertframesubtitle\empty
    \let\insertframesubtitle\secname
  \fi
  \begin{beamercolorbox}{frame title}%
    % Если подзаголовок пустой — показываем только заголовок
    \ifx\insertframesubtitle\@empty%
      % ОТСТУП СВЕРХУ когда есть только заголовок.
      % Увеличьте 0.45cm, чтобы опустить заголовок ниже.
      \vspace*{0.45cm}\\
      \insertframetitle
    \else%
      % ОТСТУП СВЕРХУ когда есть и заголовок, и подзаголовок.
      % Увеличьте 0.35cm, чтобы опустить всю группу ниже.
      \vspace*{0.35cm}\\
      % Печатаем подзаголовок (название раздела) — маленьким шрифтом, заглавными
      \usebeamercolor[fg]{framesubtitle}\usebeamerfont{framesubtitle}
      \hspace*{0.03cm}\MakeTextUppercase{\insertframesubtitle}\vspace*{-0.1cm}\\
      % Печатаем заголовок фрейма — крупно
      \usebeamercolor[fg]{frametitle}\usebeamerfont{frametitle}\insertframetitle
    \fi
    % Отступ снизу после заголовка перед содержимым.
    % Увеличьте 0.25cm, чтобы добавить воздуха между заголовком и текстом.
    \vspace*{0.25cm}
  \end{beamercolorbox}%
}
\makeatother

% ============================================================================
% 10. ЦВЕТОВАЯ ПАЛИТРА ШАБЛОНА
% ============================================================================
%
% Здесь определены все цвета, используемые в презентации.
% Чтобы изменить цветовую схему, достаточно поменять HEX-коды в этом блоке.
% Полезный ресурс для подбора: https://colorhunt.co
%
% Для быстрой замены: выделите HEX (например #5B2C8C) и замените на свой.

% YourBase — основной брендовый цвет (темно-фиолетовый).
% Используется: заголовки фреймов, шапка таблиц, фон титула, блоки, буллиты.
\definecolor{YourBase}{HTML}{5B2C8C}
% YourSectionShaded — цвет неактивных разделов в содержании (светло-фиолетовый).
\definecolor{YourSectionShaded}{HTML}{B59AD9}
% YourBlock — фон блоков и четных строк таблиц (светлая лаванда).
\definecolor{YourBlock}{HTML}{F3EEF7}
% YourBad — цвет «плохо» (для статусов, ошибок). 
\definecolor{YourBad}{HTML}{C41E3A}
% YourNeutral — цвет «нейтрально» (янтарный). 
\definecolor{YourNeutral}{HTML}{CF9900}
% YourGood — цвет «хорошо» (зеленый). 
\definecolor{YourGood}{HTML}{008F6B}
% YourAccent — акцентный цвет (маджента-фиолетовый, чуть приглушенный).
%             Используется для подсветки ключевых слов в коде и акцентных элементов.
%             Меняйте код, чтобы сделать ярче/темнее или сместить в magenta/синий.
\definecolor{YourAccent}{HTML}{B324D1}
% YourParam — первый параметр графиков, сноски, цвет подписей.
\definecolor{YourParam}{HTML}{8E44AD}
% YourParam2 — второй параметр графиков (средне-фиолетовый, между YourBase и YourParam).
\definecolor{YourParam2}{HTML}{75389C}
% YourParam3 — третий параметр графиков (светло-фиолетовый).
\definecolor{YourParam3}{HTML}{A569BD}
% YourParam4 — четвертый параметр графиков (темно-фиолетовый).
\definecolor{YourParam4}{HTML}{6C3483}
% YourParam5 — пятый параметр
\definecolor{YourParam5}{HTML}{FF794C}
% YourFootNote — цвет сносок (берется из YourParam).
\definecolor{YourFootNote}{named}{YourParam}
% YourFigureCaption — цвет подписей к рисункам (берется из YourParam2).
\definecolor{YourFigureCaption}{named}{YourParam2}

% ============================================================================
% 11. ЦВЕТА ЭЛЕМЕНТОВ beamer (ПРИВЯЗКА К ПАЛИТРЕ)
% ============================================================================

% Заголовок блока: белый текст на YourBase
\setbeamercolor{block title}{fg=white,bg=YourBase}
% Тело блока: фон YourBlock
\setbeamercolor{block body}{bg=YourBlock}
% Заголовок фрейма: цвет YourBase
\setbeamercolor{frametitle}{fg=YourBase}
% Подписи к рисункам: цвет YourFigureCaption
\setbeamercolor{caption}{fg=YourFigureCaption}
% Цвета буллитов и нумераторов в списках.
% По умолчанию beamer использует синий — перекрашиваем в YourBase (фиолетовый).
% Меняйте YourBase на другой цвет (например YourParam), чтобы сменить оттенок.
\setbeamercolor{itemize item}{fg=YourBase}
\setbeamercolor{itemize subitem}{fg=YourBase}
\setbeamercolor{itemize subsubitem}{fg=YourBase}
\setbeamercolor{enumerate item}{fg=YourBase}
\setbeamercolor{enumerate subitem}{fg=YourBase}
\setbeamercolor{enumerate subsubitem}{fg=YourBase}
% Цвет линий в таблицах — белый (т.к. строки цветные, линии должны быть не видны)
\arrayrulecolor{white}
% Толщина линий в таблицах
\setlength{\arrayrulewidth}{0.5pt}

% ============================================================================
% 12. ВЕРХНИЙ И НИЖНИЙ КОЛОНТИТУЛЫ
% ============================================================================

% Убираем кнопки навигации beamer (стрелки в правом нижнем углу)
\beamertemplatenavigationsymbolsempty
% Нижний колонтитул: номер страницы в цветном боксе справа внизу.
% \fcolorbox{YourBlock}{YourBlock}{...} — рамка и заливка одним цветом.
\setbeamertemplate{footline}{\hspace*{.5cm}\scriptsize{
\hspace*{50pt} \hfill\fcolorbox{YourBlock}{YourBlock}{\hspace*{.25cm}\insertframenumber\hspace*{.25cm}}\hspace*{.7cm}}}
% Верхний колонтитул: логотип справа вверху.
% \vspace*{0.5cm} — отступ сверху перед логотипом.
% \vspace*{-0.85cm} — компенсация, чтобы основной текст не съехал вниз.
\setbeamertemplate{headline}{\vspace*{0.5cm}\hspace*{.5cm}\scriptsize{
\hspace*{50pt} \hfill \includegraphics[width=0.95cm]{YourStyle/logo.png}\hspace*{.7cm}}\vspace*{-0.85cm}}

% ============================================================================
% 13. ПОЛЕЗНЫЕ КОМАНДЫ ДЛЯ INLINE-ОФОРМЛЕНИЯ
% ============================================================================

% \Yourcode — моноширинный шрифт для вставки команд LaTeX в тексте
% Можете заменить \small на \footnotesize или убрать, если шрифт кажется мелким.
\def \Yourcode {\small\ttfamily}
% \YourCheckedbox — зеленая галочка (используется в списках)
\def \YourCheckedbox {\color{YourGood}\Checkedbox}
% \YourCrossedbox — красный крестик
\def \YourCrossedbox {\color{YourBad}\Crossedbox}
% \YourHandRight — фиолетовая pointing hand
\def \YourHandRight {\color{YourBase}\HandRight}

% Стандартные буллиты для itemize на первом уровне — кружок
\setbeamertemplate{itemize item}{$\bullet$}
% На втором уровне — символ \Neutral (из marvosym)
\setbeamertemplate{itemize subitem}{\Neutral}

% \Yourcolorbox — цветной бокс вокруг текста (рамка YourBase, заливка 20% YourBase)
\newcommand{\Yourcolorbox}[1]{\fcolorbox{YourBase}{YourBase!20}{#1}}

% ============================================================================
% 14. СТИЛИЗАЦИЯ ТАБЛИЦ
% ============================================================================

% \YourTableHeadRow — шапка таблицы: фон YourBase, белый жирный текст
\def \YourTableHeadRow {\rowcolor{YourBase}\rowstyle{\bfseries\color{white}}}
% \Yourtable[oddheadrows] — команда для авто-чередования цветов строк.
%   без аргумента (oddheadrows): каждая четная строка красится в YourBlock, нечетная — белая.
%   с аргументом [evenheadrows]: шапка состоит из четного числа строк — цвета инвертируются.
%   \arraystretch=1.5 — увеличивает высоту строк.
\newcommand{\Yourtable}[1][oddheadrows]{\ifthenelse{\equal{evenheadrows}{#1}}{\rowcolors{1}{}{YourBlock}}{\rowcolors{1}{YourBlock}{}}\renewcommand{\arraystretch}{1.5}}

% --- Механизм колонок = и + ---
% Колонка = сбрасывает \rowstyle (используется в первом столбце).
% Колонка + применяет \rowstyle (используется в остальных столбцах).
% Это нужно, чтобы шапка таблицы была набрана жирным белым шрифтом только в нужных столбцах.
\makeatletter
\newcommand*{\@rowstyle}{}
\newcommand*{\rowstyle}[1]{%
  \gdef\@rowstyle{#1}%
  \@rowstyle\ignorespaces%
}
\newcolumntype{=}{%
  >{\gdef\@rowstyle{}}%
}
\newcolumntype{+}{%
  >{\@rowstyle}%
}
\makeatother
% Отступ текста от краев ячейки таблицы
\setlength{\tabcolsep}{0.75em}

% ============================================================================
% 15. ГИПЕРССЫЛКИ
% ============================================================================

% Настройка стиля ссылок: подчеркивание (а не цветные рамки вокруг текста).
\makeatletter
\Hy@AtBeginDocument{%
  \def\@pdfborder{0 0 1}%
  \def\@pdfborderstyle{/S/U/W 1}%
}
\makeatother
% Цвета ссылок:
%   linkcolor= пусто — внутренние ссылки не перекрашиваем,
%   urlcolor=YourBase — URL-ссылки фиолетовые,
%   linkbordercolor, urlbordercolor — цвет рамки (но рамки отключены выше).
\hypersetup{colorlinks,linkcolor=,urlcolor=YourBase,linkbordercolor=YourBase,urlbordercolor=YourBase}
% URL печатаются тем же шрифтом, что и основной текст (а не моноширинным по умолчанию)
\urlstyle{same}

% ============================================================================
% 16. ПОДСВЕТКА СИНТАКСИСА (listings)
% ============================================================================

% Патч для listings: корректный номер первой строки при linerange={...}
% Без этого патча нумерация строк начинается не с единицы.
\makeatletter
\def\lst@MSkipToFirst{%
    \global\advance\lst@lineno\@ne
    \ifnum \lst@lineno=\lst@firstline
        \def\lst@next{\lst@LeaveMode \global\lst@newlines\z@
        \lst@OnceAtEOL \global\let\lst@OnceAtEOL\@empty
        \lst@InitLstNumber
        \lsthk@InitVarsBOL
        \c@lstnumber=\numexpr-1+\lst@lineno
        \lst@BOLGobble}%
        \expandafter\lst@next
    \fi}
\makeatother

% Поддержка символа * в листингах (для указателей в C/C++)
\DeclareUTFcharacter[\UTFencname]{x002A}{\textasteriskcentered}

% Стиль CUDA — расширение C++ с ключевыми словами CUDA
\lstdefinestyle{CUDA}{language=C++,
    emph={
        cudaMalloc, cudaFree,
        __global__, __shared__, __device__, __host__,
        __syncthreads, __umul24,
    }
}

% Глобальные настройки для всех листингов:
% Меняйте цвета (YourGood, YourBase, YourBlock, YourBad, YourAccent)
% чтобы подстроить подсветку под свою палитру.
\lstset{
  basicstyle=\small\ttfamily,              % основной шрифт кода
  commentstyle=\color{YourGood},           % цвет комментариев
  keywordstyle=\color{YourBase},           % цвет ключевых слов
  basicstyle=\Yourcode,                    % используется \Yourcode (\small\ttfamily)
  numbers=left,                            % нумерация строк слева
  xleftmargin=2em,                         % отступ слева под номера
  frame=single,                            % рамка вокруг листинга
  framexleftmargin=1.5em,                  % отступ рамки слева
  numberstyle=\tiny\color{YourFigureCaption}, % стиль номеров строк
  stepnumber=1,                            % нумеровать каждую строку
  numbersep=5pt,                           % отступ номера от кода
  backgroundcolor=\color{YourBlock},       % фон листинга
  rulecolor=\color{YourBlock},             % цвет рамки
  stringstyle=\color{YourBad},             % цвет строковых литералов
  emphstyle=\color{YourAccent},            % цвет emph-ключевых слов
  showspaces=false,                        % не показывать пробелы
  showstringspaces=false,                  % не показывать пробелы в строках
  showtabs=false,                          % не показывать табуляцию
  tabsize=2,                               % размер табуляции = 2 пробела
  captionpos=t,                            % подпись сверху
  breaklines=true,                         % перенос длинных строк
  breakatwhitespace=false,                 % переносить в любом месте (не только по пробелу)
  escapeinside={\%*}{*)}                   % экранирование для LaTeX внутри кода
}

% ============================================================================
% 17. НАСТРОЙКА ОТСТУПОВ В СПИСКАХ (itemize, enumerate)
% ============================================================================

% Отступ слева для первого уровня списка
\setlength\leftmargini{1.4em}
% Отступ между маркером и текстом
\setlength\labelsep{7pt}

% Переопределяем разделители в itemize/enumerate, чтобы можно было
% менять межстрочный интервал внутри списков отдельно.
% Это нужно, если вы хотите уплотнить или расширить списки глобально.
\makeatletter
\newcommand{\my@beamer@setsep}{%
\ifnum\@itemdepth=1\relax
  \setlength\itemsep{\my@beamer@itemsepi}%
\else
   \ifnum\@itemdepth=2\relax
     \setlength\itemsep{\my@beamer@itemsepii}%
   \else
     \ifnum\@itemdepth=3\relax
       \setlength\itemsep{\my@beamer@itemsepiii}%
\fi\fi\fi}
% Определяем длины для каждого уровня вложенности.
% Меняйте 1.5ex / 1ex / 1ex на нужные значения.
\newlength{\my@beamer@itemsepi}\setlength{\my@beamer@itemsepi}{1.5ex}
\newlength{\my@beamer@itemsepii}\setlength{\my@beamer@itemsepii}{1ex}
\newlength{\my@beamer@itemsepiii}\setlength{\my@beamer@itemsepiii}{1ex}
% \setlistsep — команда для изменения отступов из .tex-файла:
%   \setlistsep{2ex}{1.5ex}{1ex}
\newcommand\setlistsep[3]{%
    \setlength{\my@beamer@itemsepi}{#1}%
    \setlength{\my@beamer@itemsepii}{#2}%
    \setlength{\my@beamer@itemsepiii}{#3}%
}
% Внедряем \my@beamer@setsep в стандартные окружения itemize и enumerate
\xpatchcmd{\itemize}
  {\def\makelabel}
  {\my@beamer@setsep\def\makelabel}
  {}
  {}
\xpatchcmd{\beamer@enum@}
  {\def\makelabel}
  {\my@beamer@setsep\def\makelabel}
  {}
  {}
\makeatother

% ============================================================================
% 18. ИКОНКИ
% ============================================================================
%
% В папке YourStyle/icons/ лежат 33 иконки в стиле «белый контур на прозрачном
% фоне» (512x512 px, RGBA PNG). Примеры использования см. в Example.tex.
%
% Бесплатные иконки можно найти на ресурсах:
%   • IconFinder             — iconfinder.com  (фильтр Free)
%   • SVG Repo               — svgrepo.com  (CC0 / MIT)
%   • Flaticon               — flaticon.com  (Free с указанием автора)
%   • Font Awesome           — fontawesome.com (Free-пак)
%
% Чтобы заменить иконки — положите новый PNG (любого размера, квадратный)
% в YourStyle/icons/ под нужным именем и перекомпилируйте.

% \icon[24pt]{name} — вставка иконки из папки YourStyle/icons/.
%   Первый аргумент (необязятельный) — ширина/высота в pt, по умолчанию 24pt.
%   Второй аргумент — имя файла без .png.
\newcommand{\icon}[2][24pt]{\includegraphics[width=#1,height=#1]{YourStyle/icons/#2.png}}
% \iconS{name} — то же, но с фиксированным размером 20pt (для каталога иконок)
\newcommand{\iconS}[1]{\icon[20pt]{#1}}

% ============================================================================
% 19. БЛОКИ С ИКОНКАМИ (ПЕРЕОПРЕДЕЛЕНИЕ \begin{block})
% ============================================================================

% Стандартный beamer-блок теперь принимает опциональный аргумент — имя иконки.
% Пример: \begin{block}[tools]{Заголовок} ... \end{block}
\makeatletter
\renewenvironment<>{block}[2][]{%
\begin{actionenv}%
\def\insertblocktitle{\par\vspace{-0.1em}\leftskip=0.45em\rightskip=0.45em \normalsize\textbf{\ifstrempty{#1}{#2}{\raisebox{-.5\height}{\hspace{-3pt}\icon{#1}}\hspace*{0.1cm}\raisebox{-0.5\height}{\hbox{#2}}}}\vspace*{0.1cm}
}
\par \usebeamertemplate{block begin}\leftskip=0.45em\rightskip=0.45em
\vspace{0.1em}%
}
{\par\vspace*{0.1cm}\usebeamertemplate{block end}
\end{actionenv}}
\makeatother
% Добавляем горизонтальный отступ внутри блока (чтобы текст не упирался в края)
\addtobeamertemplate{block begin}{\hspace*{0.1cm}\begin{minipage}[t]{\linewidth-0.1cm}\addtolength{\leftmargini}{0.17cm}}{}
\addtobeamertemplate{block end}{}{\end{minipage}\vspace*{0.05cm}}

% ============================================================================
% 20. КАРТОЧКИ (\Yourcard)
% ============================================================================

% \Yourcard[icon]{width}{title}{description} — карточка с опциональной иконкой
%   width — доля \linewidth (например 0.27 для трех карточек в ряд)
\newcommand{\Yourcard}[4][]{
\begin{minipage}[t]{#2\linewidth}
  % Цветной квадратик слева вверху; если есть иконка — показывает ее в нем, иначе он пустой
  \colorbox{YourBase}{\ifstrempty{#1}{\makebox(4,4){}}{\makebox(16,16){\iconS{#1}}}}
  \vspace{0.2cm}\\
  \textbf{#3}\\
  #4
\end{minipage}
}

% ============================================================================
% 21. ФУНКЦИИ ДЛЯ СТРАНИЦ АВТОРОВ
% ============================================================================

% \roundpic{width}{path} — круглая обрезка изображения с помощью TikZ
\newcommand{\roundpic}[2] {
  \tikz\node [circle, minimum width = #1,
    path picture = {
      \node [anchor=center] at (path picture bounding box.center) {
        \includegraphics[width=#1]{#2}};
    }] {};}

% \bioTune{photo}{name}{title}{fact1}{fact2}{photo_width}{text_width}
%   — базовая команда для размещения фото и текста автора.
%   Аргументы 6 и 7 регулируют соотношение ширины фото и текста.
%   Размер круглой обрезки фото задаётся множителем 0.65\linewidth внутри
%   minipage шириной #6\linewidth. Меняйте 0.65 на большее (например 0.85)
%   чтобы кружок был крупнее, или на меньшее (0.5) чтобы мельче.
\newcommand{\bioTune}[7] {
  \mbox{ }\hfill
  \begin{minipage}[h]{#6\linewidth}
    \hfill\roundpic{0.65\linewidth}{#1}\hfill
  \end{minipage}\hspace*{0.5cm}
  \begin{minipage}[h]{#7\linewidth}
  {\color{white}{\huge{\textbf{#2}}}\\
      #3\\ \vskip2pt
      \begin{itemize}
        \item #4
        \item #5
      \end{itemize}
    }
  \end{minipage}
  \hfill\mbox{ }
}
% \bio — для одного автора (фото 25% ширины слайда, текст 42%)
%         Меняйте 0.25 (ширина фото) и 0.42 (ширина текста).
\newcommand{\bio}[5]{\bioTune{#1}{#2}{#3}{#4}{#5}{0.25}{0.42}}
% \bioPair — для пары авторов на одной странице (фото 16%, текст 62%)
%         Меняйте 0.16 (ширина фото) и 0.62 (ширина текста).
\newcommand{\bioPair}[5]{\bioTune{#1}{#2}{#3}{#4}{#5}{0.16}{0.62}}

% \SingleAuthorPage — целая страница с одним автором на темном фоне
\newcommand{\SingleAuthorPage}[5] {
  {
    % Фон страницы — YourBase (темно-фиолетовый)
    \setbeamercolor{background canvas}{bg=YourBase}
    % Убираем колонтитулы
    \setbeamertemplate{footline}{}
    \setbeamertemplate{headline}{}
    \setbeamertemplate{frametitle}{}{}
    % Белые буллиты
    \setbeamertemplate{itemize item}{\color{white}$\bullet$}
    \setbeamercolor{itemize/enumerate body}{fg=white}
    \begin{frame}\vskip0.75cm
       \bio{#1}{#2}{#3}{#4}{#5}
    \end{frame}
  }
}

% \PairCoAuthorsPage — страница с двумя авторами
\newcommand{\PairCoAuthorsPage}[2] {
  {
    \setbeamercolor{background canvas}{bg=YourBase}
    \setbeamertemplate{footline}{}
    \setbeamertemplate{headline}{}
    \setbeamertemplate{frametitle}{}{}
    \setbeamertemplate{itemize item}{\color{white}$\bullet$}
    \setbeamercolor{itemize/enumerate body}{fg=white}
    \begin{frame}\vskip0.75cm
       #1\\ \vskip1cm #2
    \end{frame}
  }
}

% ============================================================================
% 22. СПЕЦИАЛЬНЫЕ СЛАЙДЫ
% ============================================================================

% \FullSlideImage{path} — слайд, полностью заполненный изображением (без колонтитулов)
\newcommand{\FullSlideImage}[1] {
   {
      \usebackgroundtemplate{\includegraphics[width=\paperwidth]{#1}}
      \setbeamertemplate{footline}{}
      \setbeamertemplate{headline}{}
      \setbeamertemplate{frametitle}{}{}
      \begin{frame}{}
      \end{frame}
   }
}

% ============================================================================
% 23. ТИТУЛЬНЫЙ СЛАЙД
% ============================================================================

% \Yourtitlepage — титульный слайд с фоновым изображением titlepage.png
% Фон лежит в YourStyle/titlepage.png (1280×720).
\newcommand{\Yourtitlepage}{
   {
      \usebackgroundtemplate{
        \includegraphics[width=\paperwidth,height=\paperheight]{YourStyle/titlepage.png}
      }
      % Убираем колонтитулы
      \setbeamertemplate{footline}{}
      \setbeamertemplate{headline}{}
      \setbeamertemplate{frametitle}{}{}
      \begin{frame}
         % Отступ слева для текста титула. Меняйте 1.5cm, чтобы сдвинуть левее/правее.
         \hspace*{1.5cm}
         \begin{minipage}[h]{0.77\linewidth}
            % \vspace*{5cm} — отступ сверху для титула.
            % Увеличьте, чтобы опустить заголовок ниже (и наоборот).
            \vspace*{5cm}
            {\color{white}
               {\Huge\sffamily{\bfseries\inserttitle} } \\
               \vskip1pt
               \insertauthor
            }
         \end{minipage}
      \end{frame}
   }
}

% ============================================================================
% 24. ЗАКЛЮЧИТЕЛЬНЫЙ СЛАЙД
% ============================================================================

% \Yourfinalslide — слайд с фоновым изображением finalslide.png
% Фон лежит в YourStyle/finalslide.png (1280×720).
\newcommand{\Yourfinalslide}{
   {
      \usebackgroundtemplate{
        \includegraphics[width=\paperwidth,height=\paperheight]{YourStyle/finalslide.png}
      }
      \setbeamertemplate{footline}{}
      \setbeamertemplate{headline}{}
      \setbeamertemplate{frametitle}{}{}
      \begin{frame}{}
      \end{frame}
   }
}

% ============================================================================
% 25. СОДЕРЖАНИЕ И РАЗДЕЛЫ (TOC / \section)
% ============================================================================

% Патч: убираем \vfill в содержании, заменяем на \vspace{0.6cm},
% чтобы секции не разъезжались по всей высоте.
\makeatletter
\patchcmd{\beamer@sectionintoc}
  {\vfill}
  {\vspace{0.6cm}}
  {}
  {}
\makeatother

% \AtBeginSection — вставляет слайд с содержанием перед каждым новым разделом.
\AtBeginSection{
    {
    % Темно-фиолетовый фон
    \setbeamercolor{background canvas}{bg=YourBase}
    % Убираем колонтитулы
    \setbeamertemplate{footline}{}
    \setbeamertemplate{headline}{}
    \setbeamertemplate{frametitle}{}{}
    % Шрифт активного раздела — крупный, жирный
    \setbeamerfont{section in toc}{size=\Large,series=\bfseries}
    % Шрифт неактивных разделов — крупный, обычный
    \setbeamerfont{section in toc shaded}{size=\Large,series=\mdseries}
    % Активный раздел — белый
    \setbeamercolor{section in toc}{fg=alerted text.fg, fg = white}
    % Неактивные разделы — полупрозрачный YourSectionShaded
    \setbeamercolor{section in toc shaded}{bg=YourSectionShaded!20, fg=YourSectionShaded}
    % Шаблон неактивного раздела — просто название
    \setbeamertemplate{section in toc shaded}{\inserttocsection}
% Шаблон активного раздела — цепочка стрелок от края до разделителя (можно заменить на подчеркивание, например).
    % \hspace{-2.35cm}     — компенсирует отступ, уходит к левому краю содержимого
    % \makebox[2.35cm][l]  — стрелки без промежутков, естественная ширина
    %                      — оставшееся место в box = зазор перед заголовком
    % Меняйте 2.35cm при изменении отступа в frame/minipage.
    % Количество стрелок подберите так, чтобы оставался небольшой зазор.
    \setbeamertemplate{section in toc}{\hspace{-2.35cm}\makebox[2.35cm][l]{\color{white}$\blacktriangleright$$\blacktriangleright$$\blacktriangleright$$\blacktriangleright$$\blacktriangleright$$\blacktriangleright$$\blacktriangleright$}\inserttocsection}

    \begin{frame}
      \vfill
      \hspace*{1.6cm}\begin{minipage}[h]{0.75\linewidth}\linespread{1.6}
        \tableofcontents[currentsection]
      \end{minipage}
      \vfill
    \end{frame}
    }
}

% ============================================================================
% 26. АНИМАЦИИ (ВСТРАИВАНИЕ ВИДЕО ПО КАДРАМ)
% ============================================================================

% \FramesAsGIF — анимация без элементов управления (циклический автопросмотр).
\newcommand{\FramesAsGIF}[6]{\animategraphics[loop,autoplay,method=ocg,width=#2,height=#3,keepaspectratio]{#4}{#1}{#5}{#6}}
% \FramesAsVideoPlayer — анимация с кнопками play/stop.
\newcommand{\FramesAsVideoPlayer}[6]{
   \animategraphics[loop,method=ocg,controls={play,stop},width=#2,height=#3,keepaspectratio]{#4}{#1}{#5}{#6}
}
% \FramesAsVideoExtraPlayer — анимация с полным набором кнопок управления.
\newcommand{\FramesAsVideoExtraPlayer}[6]{
   \animategraphics[loop,method=ocg,controls,width=#2,height=#3,keepaspectratio]{#4}{#1}{#5}{#6}
}

% ============================================================================
% 27. ЗАКЛЮЧИТЕЛЬНЫЕ НАСТРОЙКИ
% ============================================================================

% Переключаемся в режим presentation (beamer собирает содержимое)
\mode<presentation>
\mode
<all>
% Эффект появления: динамическое затемнение скрытых элементов
\setbeamercovered{dynamic}
% Глубина нумерации разделов (5 — подсекции 4-го уровня, но обычно не используется)
\setcounter{secnumdepth}{5}
% Переопределяем \emptyset на символ \varnothing (более красивый)
\def\emptyset{\varnothing}

\endinput