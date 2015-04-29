require_relative 'params_processor'

class TimeOffMessage
   extend Forwardable

   delegate [:timeoff_text, :user_name, :channel] => :processor

   def initialize(params)
      @params = params
   end

   def call
      "Hey guys, #{user_name} is gonna be out #{timeoff_text}."
   end

   private

   def processor
      @processor ||= ParamsProcessor.new(@params)
   end
end
