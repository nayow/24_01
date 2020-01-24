require 'launchy'

def check_input
    abort("Missing input to search for") if ARGV.empty?
end

def get_search_input
    return search_input = "https://www.google.com/search?q="+ARGV.join("+")
end

def open_search_on_google(url)
    Launchy.open(url)
end

def run
    check_input
    open_search_on_google(get_search_input)
end

run