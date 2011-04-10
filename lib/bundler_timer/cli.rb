require 'bundler/cli'
require 'bundler_timer/statistics'

module BundlerTimer
  class CLI < Bundler::CLI
    def initialize(*)
      @statistics = Statistics.instance
      super
    end

    no_tasks do
      def invoke_task(task, *args)
        @statistics.record(task.name) do
          super
        end
      end
    end
  end
end
