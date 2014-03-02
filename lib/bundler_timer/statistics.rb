require 'benchmark'
require 'sequel'
require 'fileutils'
require 'date'
require 'singleton'

module BundlerTimer
  class Statistics
    include Singleton

    def initialize
      create_storage_dir
      create_database
      super
    end

    def record(task, &block)
      time = Benchmark.realtime do
        yield
      end
      @db[:executions].insert :command => task, :runtime => time, :run_at => Date.today
    end

    def total
      @db[:executions].sum(:runtime)
    end

    def total_for_day(day = Date.today)
      @db[:executions].where(:run_at => day).sum(:runtime)
    end

    def ugly_output
      puts "\n\tCongratulations, you've spent #{smart_time(total_for_day)} today staring at your screen (#{smart_time(total)} overall)."
    end

  protected
    def create_storage_dir
      @storage_dir = File.join(ENV['HOME'], ".bundler_timer")
      FileUtils.mkdir(@storage_dir) unless File.exists?(@storage_dir)
    end

    def create_database
      @db = Sequel.sqlite(File.join(@storage_dir, 'bundler_timer.db'))
      @db.create_table? :executions do
        primary_key :id
        String :command, :null => false
        Float :runtime, :null => false
        Date :run_at, :null => false

        index :run_at
      end
    end

    def smart_time(seconds)
      return '0 seconds' unless seconds

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
  end
end
