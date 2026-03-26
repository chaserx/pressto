# Pressto

A whimsical little CLI that turns HTML files into PDFs using a headless browser. Like magic — *pressto!*

Pressto renders your HTML with full screen-media styles (not print styles), producing a faithful, single-page PDF that looks just like it does in the browser.

## Requirements

- macOS
- Ruby 3.4+
- Node.js 20+

## Installation

### 1. Install system dependencies

Using [mise](https://mise.jdx.dev/):

```sh
mise install
```

Or using Homebrew:

```sh
brew install ruby node
```

### 2. Install Ruby gems

```sh
bundle install
```

### 3. Install Playwright browsers

```sh
npx playwright install chromium
```

## Usage

```sh
ruby convert.rb [options] input.html
```

### Options

| Flag                  | Description                                 |
|-----------------------|---------------------------------------------|
| `-o`, `--output FILE` | Output PDF filename (default: `output.pdf`) |
| `-d`, `--debug`       | Print detailed error info on failure        |
| `-h`, `--help`        | Show help message                           |

### Examples

```sh
# Convert an HTML file to output.pdf
ruby convert.rb page.html

# Specify a custom output filename
ruby convert.rb -o report.pdf page.html

# Run with debug output
ruby convert.rb -d -o report.pdf page.html
```

## License

MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
