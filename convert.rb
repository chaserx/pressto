require "bundler/setup"
require "playwright"
require "optparse"

class Convert
  def initialize(html_file_path, pdf_doc_output, options = {})
    @html_file_path = File.expand_path(html_file_path)
    @pdf_doc_output = pdf_doc_output
    @options = options
  end

  def convert
    validate_input_file

    file_url = "file://#{@html_file_path}"
    puts "Converting #{@html_file_path} to #{@pdf_doc_output}..."

    Playwright.create(playwright_cli_executable_path: "npx playwright") do |playwright|
      playwright.chromium.launch(headless: true) do |browser|
        page = browser.new_page

        # Use screen media to match browser rendering (not print styles)
        page.emulate_media(media: "screen")

        page.goto(file_url, waitUntil: "networkidle")

        page.pdf(
          path: @pdf_doc_output,
          # format: "Letter",
          height: "10000px", # Set a large height to avoid page breaks
          width: "1440px", # Set a large width to mimic typical screen width
          printBackground: true,
          preferCSSPageSize: true,
          margin: {top: "0", bottom: "0", left: "0", right: "0"}
        )
      end
    end

    puts "Conversion successful! PDF saved to #{@pdf_doc_output}"
  rescue => e
    if @options[:debug]
      puts "Error: #{e.class}: #{e.message}"
      puts e.backtrace[0..5].join("\n")
    else
      puts "An error occurred during conversion: #{e.message}"
    end
    exit(1)
  end

  private

  def validate_input_file
    unless File.exist?(@html_file_path)
      puts "Error: #{@html_file_path} does not exist."
      exit(1)
    end

    unless File.extname(@html_file_path).downcase == ".html"
      puts "Error: #{@html_file_path} is not an HTML file."
      exit(1)
    end
  end
end

options = {}
parser = OptionParser.new do |opts|
  opts.banner = "Usage: convert.rb [options] input.html"

  opts.on("-d", "--debug", "Run in debug mode") do |v|
    options[:debug] = v
  end

  opts.on("-o", "--output FILE", "Output PDF filename") do |file|
    options[:output] = file
  end

  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end

parser.parse!

options[:output] ||= "output.pdf"

if ARGV.empty?
  puts "Error: No input HTML file specified."
  puts parser.help
  exit(1)
end

input_file = ARGV[0]
puts "Reading from #{input_file}"

Convert.new(input_file, options[:output], debug: options[:debug]).convert
