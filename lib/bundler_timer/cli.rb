require 'bundler/cli'
require 'bundler_timer/statistics'

module BundlerTimer
  class CLI < Bundler::CLI
    def initialize(*)
      @statistics = Statistics.instance
      super
    end

    def install
      @statistics.record('install') do
        super
      end
    end
  end
end
