# Pressto 🪄

A little CLI that turns HTML files into PDFs using a headless browser. Like magic — *pressto!*

Pressto renders and HTML file with full screen-media styles (not print styles), producing a faithful, single-page PDF that looks just like it does in the browser.

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
