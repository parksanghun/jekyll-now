# Sources:
# http://jasonseifer.com/2010/04/06/rake-tutorial
# http://elia.wordpress.com/2008/11/07/get-input-in-rake-tasks/
# http://www.layouts-the.me/rake/2011/04/23/rake_tasks_for_jekyll/
# https://parksanghun.github.io

require 'fileutils'

# functions
# Asking for title
def ask message
print message
STDIN.gets.chomp
end

# for post build.
namespace "post" do

  # Create new a post
  task :new do #default
    title = ask('Title: ')
    category = ask('Category: ')
    filename = category + (category ? "/" : "") + "#{Time.now.strftime('%Y-%m-%d')}-#{title.gsub(/\s/, '-').downcase}.markdown"

    puts 'title name: ' + title
    puts 'category name: ' + category

    # if is new folder? make folder.
    Dir.mkdir(File.join("_posts", category)) unless File.exists?(File.join("_posts", category))

    # make file
    path = File.join("_posts", filename)
    if File.exist? path; raise RuntimeError.new("File exists #{path}"); end
    File.open(path, 'w') do |file|
      file.write <<-EOS
---
layout: post
title: #{title}
date: #{Time.now.strftime('%Y-%m-%d %k:%M:%S')} +0900
description: 
image: 
categories: #{category}
published: false
comments: false
tags:
---
문서를 작성해주세요.
EOS
    puts '성공적으로 [' + path + ']경로에 파일을 생성하였습니다.'
    end
  end

  # post file 정리
  task :order do
    files = FileList.new("_posts/*.markdown", "_posts/*/*.markdown");
    files.each do |filePath|

      fileContents = File.read(filePath)
      regObj = /^categories: (.*)/.match(fileContents)

      if (regObj.class != NilClass && regObj.length > 1)
        if (filePath.index(regObj[1]).class != NilClass && filePath.index(regObj[1]) > -1)
        else
          postName = filePath.split('/')[-1]
          afterPath = '_posts/' + (regObj[1] ? regObj[1]+'/' : '') + postName

          puts '[' + postName + ']의 위치가 비정상적입니다. 위치를 조정합니다.'
          puts filePath + ' -> ' + afterPath

          FileUtils.mv(filePath, afterPath);
        end
      else
        puts filePath + '에 categories: 설정이 빠졌습니다.'
      end
    end
  end
end

# for cate build.
namespace "cate" do
  #Create new cate index file
  task :new do #default
    category = ask('Category: ')
    filename = "index.html"
    catePath = 'categories/' + category

    if category == ''
      raise('category가 입력되지 않았습니다. 작업에 실패하였습니다.')
    end

    puts 'category가 입력되었습니다. 하위에 index.html을 생성합니다.'

    # if is new folder? make folder.
    Dir.mkdir(catePath) unless File.exists?(catePath)

    # make file
    path = File.join(catePath, filename)
    if File.exist? path; raise RuntimeError.new("File exists #{path}"); end
    File.open(path, 'w') do |file|
      file.write <<-EOS
---
layout: list
---

{% include cateList.html name="#{category}" %}
EOS
    puts '성공적으로 [' + path + ']경로에 파일을 생성하였습니다.'
    end
  end
end