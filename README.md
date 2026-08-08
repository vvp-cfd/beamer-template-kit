# beamer-template-kit — LaTeX-класс для Beamer-презентаций с подробными комментариями

[![License](https://img.shields.io/github/license/vvp-cfd/beamer-template-kit?color=blue)](LICENSE)
[![XeLaTeX](https://img.shields.io/badge/XeLaTeX-required-008080?logo=latex)](Example.tex)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21855491.svg)](https://doi.org/10.5281/zenodo.21855491)

`YourPres.cls` — монолитный LaTeX-класс для Beamer-презентаций, где каждая настройка снабжена комментарием. Цвета, шрифты, иконки, макет слайда, блоки, таблицы, анимации — все меняется в одном файле, без штурма документации Beamer.

| | |
|---|---|
| **Автор** | [Валерия Пузикова](https://github.com/vvp-cfd) — valeria.puzikova@gmail.com |
| **Лицензия** | [MIT](LICENSE) — при использовании просьба указывать ссылку на репозиторий |

## Быстрый старт

1. Установите LaTeX-дистрибутив с поддержкой XeLaTeX (например, MiKTeX или TeX Live).

2. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/vvp-cfd/beamer-template-kit.git my-presentation
   cd my-presentation
   ```

3. Скомпилируйте пример (требуется **XeLaTeX**, два прохода):
   ```bash
   xelatex -interaction=nonstopmode -halt-on-error Example.tex
   xelatex -interaction=nonstopmode -halt-on-error Example.tex
   ```

4. Откройте `Example.pdf`.

## Структура проекта

```
YourPres.cls                 // сам класс (774 строки с комментариями)
YourStyle/                   // визуальные ресурсы
  logo.png
  titlepage.png
  finalslide.png
  icons/                     // 33 иконки Material Design Icons (512×512, белый контур)
fonts/                       // TTF-шрифты (Inter, JetBrains Mono, Open Sans)
img/                         // изображения для презентации
code/                        // примеры кода
video/                       // PNG-кадры для анимаций
Example.tex                  // демо-презентация
Example.pdf                  // скомпилированный результат
```

## Как использовать в своей презентации

1. Скопируйте `YourPres.cls`, папки `YourStyle/` и `fonts/` в свой проект.
2. Создайте `.tex`-файл с `\documentclass{YourPres}` (кодировка UTF-8).
3. Если необходимо стилизовать под дизайн Вашей организации, поменяйте цвета (раздел 10 в `YourPres.cls`) и шрифты (раздел 6), замените визуальные ресурсы на используемые у вас, при необходимости по комментариям в файле отредактируйте значения отступов и других элементов на используемые у Вас.
4. Замените `YourStyle/logo.png`, `YourStyle/titlepage.png`, `YourStyle/finalslide.png` на свои.
5. Компилируйте XeLaTeX'ом.

### Git submodule

Шаблон удобно подключать как submodule в любой проект, чтобы автоматически получать обновления:

```bash
git submodule add https://github.com/vvp-cfd/beamer-template-kit.git template
```

При обновлении шаблона: `git submodule update --remote`.

## Шрифты

Шрифты лежат в папке `fonts/` и подключаются через параметр `Path=fonts/` — **устанавливать их в систему не требуется**.

- **Inter** (Regular, Bold, Italic, BoldItalic) — основной гротеск
- **JetBrains Mono** (Regular, Bold) — моноширинный для кода
- **Open Sans** (Regular, Bold) — альтернатива (не используется по умолчанию)

Чтобы сменить шрифт, достаточно заменить имена файлов в блоке подключения (раздел 6 `YourPres.cls`).

## Иконки

В папке `YourStyle/icons/` — 33 иконки в стиле «белый контур на прозрачном фоне» (512×512 px). Источник: [Material Design Icons](https://pictogrammers.com/library/mdi/) (Apache 2.0).

Иконки можно получить также с:
- [IconFinder](https://iconfinder.com) (фильтр Free)
- [SVG Repo](https://svgrepo.com) (CC0 / MIT)
- [Flaticon](https://flaticon.com) (Free с указанием автора)
- [Font Awesome](https://fontawesome.com) (Free-пак)

## Цветовая палитра

Основные цвета (раздел 10 `YourPres.cls`):

| Цвет | Команда | Назначение |
|------|---------|-----------|
| `#5B2C8C` | `YourBase` | Основной цвет бренда |
| `#8E44AD` | `YourParam` | Параметр графиков |
| `#75389C` | `YourParam2` | Параметр графиков |
| `#A569BD` | `YourParam3` | Параметр графиков |
| `#6C3483` | `YourParam4` | Параметр графиков |
| `#FF794C` | `YourParam5` | Параметр графиков |
| `#B324D1` | `YourAccent` | Акцентный цвет |
| `#C41E3A` | `YourBad` | Семантика «плохо» |
| `#CF9900` | `YourNeutral` | Семантика «нейтрально» |
| `#008F6B` | `YourGood` | Семантика «хорошо» |
| `#F3EEF7` | `YourBlock` | Фон блоков и строк таблиц |

## Ключевые возможности

- Титульный и финальный слайды с фоновыми изображениями
- Автоматические секционные слайды с оглавлением
- Блоки с опциональными иконками
- Карточки (`\Yourcard`)
- Таблицы с авто-раскраской строк и шапкой в цвете бренда
- Подсветка кода (listings) с палитрой шаблона
- Слайды с информацией об авторах
- Анимации из последовательности PNG-кадров (animate, метод OCG)
- Псевдокод алгоритмов (algorithm, algpseudocode)
- И, конечно же, все возможности LaTeX — формулы, диаграммы, рисунки и т.д.

## Лицензия и цитирование

Код распространяется под лицензией [MIT](LICENSE).

Если вы используете этот шаблон в своих презентациях, просьба указывать ссылку на репозиторий:

```
https://github.com/vvp-cfd/beamer-template-kit
```

Для академического цитирования см. [`CITATION.cff`](CITATION.cff).

DOI: [10.5281/zenodo.21855491](https://doi.org/10.5281/zenodo.21855491)

## Контакты

**Валерия Пузикова** — valeria.puzikova@gmail.com — [@vvp-cfd](https://github.com/vvp-cfd) — [ORCID 0000-0003-0712-4519](https://orcid.org/0000-0003-0712-4519)

## Contribution

PRs приветствуются. По вопросам и предложениям открывайте issue в GitHub-репозитории.
