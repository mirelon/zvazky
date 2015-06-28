def ask(*args)
    print(*args)
    gets
end

def get_fotky
  Dir.glob("*").select {|f| [".jpg", ".png"].include? File.extname(f).downcase}
end

def page_break
  "<p class=\"break\"></p>"
end