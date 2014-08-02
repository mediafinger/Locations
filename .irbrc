require 'rubygems'
require 'awesome_print'
AwesomePrint.irb!

# IRB::Irb.class_eval do
#   def output_value
#     ap @context.last_value
#   end
# end

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = '.irb-history'
