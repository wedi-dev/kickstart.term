# TMUX - Konfiguracja i Funkcje

Kompletny przewodnik po możliwościach i skrótach klawiszowych w Twojej konfiguracji tmux.

---

## Podstawowe Informacje

- **Prefix:** `Ctrl+a` (zamiast domyślnego `Ctrl+b`)
- **Indykator prefix:** Zielona kropka ● w lewym górnym rogu (szara gdy nieaktywna)
- **Status bar:** Minimalistyczny - pokazuje tylko nazwę sesji i listę okien

---

## Podstawowe Skróty

### Zarządzanie Konfiguracją
- `Ctrl+a r` - Przeładuj konfigurację tmux

### Sesje
- `Ctrl+a C` - Nowa sesja
- `Ctrl+a w` - Wybór sesji (fuzzy finder style)
- `Ctrl+a Q` - Zabij bieżącą sesję

### Okna (Windows)
- `Ctrl+a c` - Nowe okno (zachowuje bieżącą ścieżkę)
- `Ctrl+a Tab` - Ostatnie okno
- `Ctrl+a X` - Zabij okno
- `Ctrl+a W` - Wybór okna (lista)
- `Alt+1-9` - Szybkie przełączanie na okno 1-9
- `Alt+n` - Następne okno
- `Alt+p` - Poprzednie okno
- `Ctrl+a <` - Przesuń okno w lewo
- `Ctrl+a >` - Przesuń okno w prawo

---

## Podziały Okien (Split Panes)

### Tworzenie Paneli
- `Ctrl+a |` lub `\` - Podziel pionowo
- `Ctrl+a -` lub `_` - Podziel poziomo
- `Ctrl+a =` - Równe podziały poziomo
- `Ctrl+a +` - Równe podziały pionowo

### Nawigacja Między Panelami (Vim-style)
- `Ctrl+a h` - Panel w lewo
- `Ctrl+a j` - Panel w dół
- `Ctrl+a k` - Panel w górę
- `Ctrl+a l` - Panel w prawo

**Bez prefiksu (szybsza nawigacja):**
- `Alt+h` - Panel w lewo
- `Alt+j` - Panel w dół
- `Alt+k` - Panel w górę
- `Alt+l` - Panel w prawo

### Zmiana Rozmiaru Paneli (Powtarzalne)
- `Ctrl+a H` - Zmniejsz szerokość o 5
- `Ctrl+a J` - Zwiększ wysokość o 3
- `Ctrl+a K` - Zmniejsz wysokość o 3
- `Ctrl+a L` - Zwiększ szerokość o 5

### Zarządzanie Panelami
- `Ctrl+a x` - Zabij panel
- `Ctrl+a f` - Fullscreen panelu (zoom)
- `Ctrl+a Space` - Wyświetl numery paneli
- `Ctrl+a Ctrl+o` - Rotuj panele
- `Ctrl+a b` - Break panel do nowego okna
- `Ctrl+a j` - Join panel z innego okna (pytanie o źródło)

### Zaawansowane Funkcje Paneli
- `Ctrl+a S` - **Synchronizacja paneli** - wysyłaj te same komendy do wszystkich paneli jednocześnie
- `Ctrl+a m` - Zamarkuj panel
- `Ctrl+a M` - Odznacz panel

---

## Copy Mode (Tryb Kopiowania - Vim-style)

### Wejście w Copy Mode
- `Ctrl+a Escape` - Wejdź w copy mode
- `Ctrl+a [` - Wejdź w copy mode

### W Copy Mode (Vim keybindings)
- `h/j/k/l` - Nawigacja (lewo/dół/góra/prawo)
- `Ctrl+u` - Pół strony w górę
- `Ctrl+d` - Pół strony w dół
- `g` - Początek historii
- `G` - Koniec historii
- `v` - Zaznacz tekst
- `Ctrl+v` - Zaznacz prostokąt
- `y` - Kopiuj zaznaczenie i wyjdź
- `Y` - Kopiuj zaznaczenie do systemowego schowka (xclip)
- `/` - Szukaj w przód
- `?` - Szukaj w tył
- `n` - Następne wystąpienie
- `N` - Poprzednie wystąpienie
- `q` - Wyjdź z copy mode

### Wklejanie
- `Ctrl+a p` - Wklej z bufora tmux
- `Ctrl+a P` - Wybierz z listy buforów

### Scroll Myszką
- **Scroll w górę** - Automatycznie wchodzi w copy mode
- **Zaznacz myszką** - Automatycznie kopiuje do schowka

---

## Pluginy i Zaawansowane Funkcje

### 🎯 tmux-thumbs - Szybki Wybór Tekstu
**Skrót:** `Ctrl+a F` (wielkie F)

**Co robi:**
- Wyświetla hinty (litery) przy wszystkich interesujących tekstach na ekranie
- Automatycznie wykrywa: ścieżki, URL-e, IP adresy, hash-e git, numery portów, itp.
- Wpisz literę hinta → tekst zostaje skopiowany do schowka

**Przykład użycia:**
```
/home/user/project/file.txt  [a]
https://github.com/foo/bar   [b]
192.168.1.100                [c]
abc123def456                 [d]
```
Wciśnij `a` → `/home/user/project/file.txt` w schowku

---

### 🔍 tmux-fzf - Fuzzy Finder Integration
**Skrót:** `Ctrl+a Ctrl+f`

**Co robi:**
Otwiera interaktywne menu z opcjami:
- **session** - Przełączanie między sesjami
- **window** - Przełączanie między oknami
- **pane** - Przełączanie między panelami
- **command** - Uruchamianie komend tmux
- **keybinding** - Przeglądanie wszystkich skrótów klawiszowych
- **clipboard** - Historia schowka tmux
- **process** - Lista procesów w bieżącym panelu

**Jak używać:**
1. Wciśnij `Ctrl+a Ctrl+f`
2. Wybierz kategorię
3. Zacznij pisać (fuzzy search)
4. Strzałki góra/dół do nawigacji
5. Enter żeby wybrać

---

### 💾 tmux-resurrect - Zapisywanie/Przywracanie Sesji
**Skróty:**
- `Ctrl+a Ctrl+s` - **Zapisz** bieżącą sesję (wszystkie okna, panele, programy)
- `Ctrl+a Ctrl+r` - **Przywróć** ostatnio zapisaną sesję

**Co zapisuje:**
- Wszystkie sesje, okna i panele
- Układ paneli
- Bieżące ścieżki w każdym panelu
- Uruchomione programy (vim, nvim, ssh, itp.)
- Historię poleceń w shellu

**Kiedy używać:**
- Przed restartem systemu
- Przed wyłączeniem komputera
- Chcesz zapisać "snapshot" swojego workflow
- Po przywróceniu wszystko wraca dokładnie tak jak było

---

### 🔄 tmux-continuum - Automatyczne Zapisywanie
**Funkcja:** Automatycznie zapisuje stan tmux co 15 minut

**Ustawienia:**
- Auto-restore jest **wyłączone** (nie przywraca automatycznie przy starcie)
- Żeby włączyć auto-restore, zmień w config: `set -g @continuum-restore 'on'`

---

### 📋 tmux-yank - Lepsze Kopiowanie
**Funkcje:**
- Automatyczne kopiowanie do systemowego schowka przy zaznaczaniu myszką
- Integracja z xclip/xsel
- Działa w copy mode

**W Copy Mode:**
- `y` - Kopiuje do tmux buffer
- `Y` - Kopiuje do systemowego schowka (Ctrl+V w innych aplikacjach)

---

### 🔗 tmux-open - Otwieranie Plików i URL-i
**Funkcja:** W copy mode możesz otwierać pliki i URL-e

**Skróty w Copy Mode:**
- `o` - Otwórz zaznaczony tekst (URL w przeglądarce, plik w edytorze)
- `Ctrl+o` - Otwórz zaznaczony tekst w $EDITOR

**Wykrywa:**
- URL-e (http, https, ftp)
- Ścieżki do plików
- Automatycznie otwiera we właściwym programie

---

### 🔎 tmux-copycat - Wyszukiwanie w Copy Mode
**Funkcja:** Zaawansowane wyszukiwanie regex w historii terminala

**Skróty w Copy Mode:**
- `Ctrl+a /` - Szukaj tekstu
- **Predefiniowane wzorce:**
  - `Ctrl+a Ctrl+f` - Szukaj plików
  - `Ctrl+a Ctrl+g` - Szukaj commitów git (SHA)
  - `Ctrl+a Ctrl+u` - Szukaj URL-i
  - `Ctrl+a Ctrl+d` - Szukaj numerów
  - `Ctrl+a Alt+i` - Szukaj adresów IP

**Przykład:**
1. Wejdź w copy mode: `Ctrl+a [`
2. Wciśnij `Ctrl+a Ctrl+u` - podświetli wszystkie URL-e
3. `n` - następny URL
4. `N` - poprzedni URL
5. `Enter` - zaznacz i skopiuj

---

### ⚙️ tmux-sensible - Sensowne Domyślne Ustawienia
**Funkcja:** Poprawia domyślne zachowanie tmux

**Co poprawia:**
- Lepsze domyślne czasy refresh
- Ulepszony scrollback
- Lepsze bindowania klawiszy
- Kompatybilność z różnymi terminalami

---

## Praktyczne Workflow'y

### 1. Szybkie Kopiowanie Ścieżek/URL-i
```
1. Wykonaj komendę która wyświetla ścieżkę/URL
2. Ctrl+a F (thumbs)
3. Wpisz literę obok ścieżki
4. Gotowe - w schowku!
```

### 2. Praca z Wieloma Projektami
```
# Stwórz sesję dla każdego projektu
tmux new -s projekt1
tmux new -s projekt2
tmux new -s projekt3

# Przełączaj się między nimi
Ctrl+a w (fuzzy finder)
lub
tmux switch -t projekt1
```

### 3. Synchronizacja Komend na Wielu Serwerach
```
1. Podziel okno na panele: Ctrl+a | Ctrl+a -
2. SSH do różnych serwerów w każdym panelu
3. Włącz synchronizację: Ctrl+a S
4. Pisz komendy - wykonują się wszędzie jednocześnie
5. Wyłącz synchronizację: Ctrl+a S
```

### 4. Zapisz Sesję Przed Końcem Pracy
```
1. Ctrl+a Ctrl+s (zapisz wszystko)
2. Następnego dnia: tmux i Ctrl+a Ctrl+r (przywróć)
3. Wszystkie okna, panele i programy wracają!
```

### 5. Szukanie w Historii Terminala
```
1. Ctrl+a [ (copy mode)
2. Ctrl+a Ctrl+u (znajdź wszystkie URL-e)
   lub
   Ctrl+a Ctrl+f (znajdź wszystkie pliki)
   lub
   / (szukaj własnego tekstu)
3. n/N (następny/poprzedni)
4. Enter (zaznacz), y (kopiuj)
```

---

## Dodatkowe Ustawienia

### Kolory i Terminal
- **True color support** - pełne 24-bit kolory
- **256 kolorów** - kompatybilność z starszymi programami
- **Undercurl support** - faliste podkreślenia (dla Neovim LSP)

### Wydajność
- **0ms escape time** - błyskawiczne reakcje (ważne dla Vim/Neovim)
- **50k linii historii** - dużo miejsca na scrollback
- **Aggressive resize** - lepsze dostosowanie rozmiaru przy wielu klientach

### Mouse Support
- **Scroll** - działa w historii
- **Klik** - wybór panelu
- **Przeciągnij** - zmiana rozmiaru paneli
- **Zaznacz** - automatyczne kopiowanie

---

## Rozwiązywanie Problemów

### Thumbs nie działa
Jeśli `Ctrl+a F` nie działa:
```bash
cd ~/.tmux/plugins/tmux-thumbs
~/.cargo/bin/cargo build --release
tmux source ~/.tmux.conf
```

### Kopiowanie do schowka nie działa
Zainstaluj xclip lub xsel:
```bash
sudo apt install xclip
# lub
sudo apt install xsel
```

### Pluginy nie załadowane
```bash
# Zainstaluj wszystkie pluginy
Ctrl+a I (wielkie i)

# Odśwież pluginy
Ctrl+a U (wielkie u)
```

### Kolory nie wyświetlają się poprawnie
Sprawdź czy terminal wspiera true color:
```bash
echo $TERM
# Powinno być: tmux-256color lub screen-256color
```

---

## Struktura Plików

```
~/.tmux/
├── plugins/           # TPM i pluginy
│   ├── tpm/
│   ├── tmux-resurrect/
│   ├── tmux-continuum/
│   ├── tmux-thumbs/
│   ├── tmux-fzf/
│   └── ...
└── resurrect/         # Zapisane sesje (tmux-resurrect)

~/.tmux.conf           # Główna konfiguracja (symlink do ~/kickstart.term/tmux/.tmux.conf)
```

---

## Przydatne Komendy CLI

```bash
# Lista sesji
tmux ls

# Nowa sesja z nazwą
tmux new -s nazwa

# Podłącz do sesji
tmux attach -t nazwa

# Zabij sesję
tmux kill-session -t nazwa

# Zabij wszystkie sesje oprócz bieżącej
tmux kill-session -a

# Zmień nazwę sesji
tmux rename-session nowa-nazwa

# Lista klientów
tmux list-clients

# Detach z sesji (też Ctrl+a d)
tmux detach
```

---

## Tips & Tricks

1. **Nested tmux** - Jeśli łączysz się przez SSH i masz tmux na zdalnym:
   - `Ctrl+a a` wysyła prefix do zagnieżdżonego tmux

2. **Szybka nawigacja** - Używaj `Alt+h/j/k/l` bez prefiksu dla szybszej nawigacji

3. **Zoom panel** - `Ctrl+a f` to toggle - super do skupienia się na jednym panelu

4. **Clock mode** - `Ctrl+a t` pokazuje duży zegar (wyjście: q)

5. **Display pane info** - `Ctrl+a q` pokazuje numery i rozmiary paneli

6. **Choose session/window** - `Ctrl+a w` i `Ctrl+a W` to interaktywne menu

7. **Pipe pane** - Możesz logować output panelu do pliku:
   ```bash
   # W tmux
   Ctrl+a : pipe-pane -o 'cat >> ~/output.log'
   ```

---

## Cheat Sheet - Najważniejsze Skróty

| Skrót | Akcja |
|-------|-------|
| `Ctrl+a` | Prefix |
| `Ctrl+a r` | Przeładuj config |
| `Ctrl+a \|` | Split pionowo |
| `Ctrl+a -` | Split poziomo |
| `Alt+h/j/k/l` | Nawigacja panele |
| `Ctrl+a f` | Fullscreen panel |
| `Ctrl+a F` | Thumbs (szybki wybór) |
| `Ctrl+a Ctrl+f` | FZF menu |
| `Ctrl+a [` | Copy mode |
| `Ctrl+a S` | Sync panele |
| `Ctrl+a Ctrl+s` | Zapisz sesję |
| `Ctrl+a Ctrl+r` | Przywróć sesję |
| `Alt+1-9` | Przełącz okno |

---

## Customizacja

Wszystkie ustawienia są w `~/kickstart.term/tmux/.tmux.conf`

Możesz modyfikować:
- Kolory status bara (linia 204-241)
- Skróty klawiszowe (linia 59-193)
- Pluginy (linia 247-256)
- Ustawienia pluginów (linia 262-282)

Po zmianach: `Ctrl+a r` lub `tmux source ~/.tmux.conf`

---

**Enjoy your ultimate tmux setup! 🚀**
