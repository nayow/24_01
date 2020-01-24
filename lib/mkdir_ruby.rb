def check_if_user_gave_input
    abort("mkdir: missing input") if ARGV.empty?
end

def get_folder_name
    return folder_name = ARGV.first
end

def create_folder(name)

    Dir.mkdir(name)

    system("cd #{name}; git init")

    file = File.open("#{name}/README.md", "w")
    file.puts("Ruby program")
    file.close
    
    file = File.open("#{name}/Gemfile", "a")
    file.puts("source 'https://rubygems.org'")
    file.puts("ruby '2.5.1'")
    file.puts("gem 'rspec'")
    file.puts("gem 'pry'")
    file.puts("gem 'rubocop', '~> 0.57.2'")
    file.close

    file = File.open("#{name}/.env", "a")
    file.close
    
    file = File.open("#{name}/.gitignore", "a")
    file.puts("'.env'")
    file.close

    Dir.mkdir("#{name}/lib")

    system("cd #{name}; rspec --init")

end

def run
    check_if_user_gave_input
    create_folder(get_folder_name)
end

run
