#!/usr/bin/env ruby

require 'rubygems'
require 'benchmark'
require 'sequel'
require 'fileutils'
require 'date'

def smart_time(seconds)
  if (minutes = seconds/60.0) >= 1
    if (hours = minutes/60.0) >= 1
      ('%3.1f' % hours) + ' hours'
    else
      ('%2.1f' % minutes) + ' minutes'
    end
  else
    "#{seconds.round} seconds"
  end
end

storage_dir = File.join(ENV['HOME'], ".bundler_timer")
FileUtils.mkdir(storage_dir) unless File.exists?(storage_dir)

DB = Sequel.sqlite(File.join(storage_dir, 'bundler_timer.db'))
DB.create_table? :executions do
  primary_key :id
  String :command, :null => false
  Float :runtime, :null => false
  Date :run_at, :null => false

  index :run_at
end

# runs bundle install by default
command = ARGV[0] || 'install'

unless command == 'stats'

  time = Benchmark.realtime do
    system "bundle #{command}"
  end

  DB[:executions].insert :command => command, :runtime => time, :run_at => Date.today
end

day_total = DB[:executions].where(:run_at => Date.today).sum(:runtime)
total = DB[:executions].sum(:runtime)

puts "\n\tCongratulations, you've spent #{smart_time(day_total)} today staring at your screen (#{smart_time(total)} overall)."
