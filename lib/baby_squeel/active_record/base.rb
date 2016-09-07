require 'baby_squeel/dsl'

module BabySqueel
  module ActiveRecord
    module Base
      delegate :joining, :joining!, :selecting, :ordering,
               :grouping, :when_having, to: :all

      def sifter(name, &block)
        define_singleton_method "sift_#{name}" do |*args|
          DSL.evaluate_sifter(self, *args, &block)
        end
      end
    end
  end
end