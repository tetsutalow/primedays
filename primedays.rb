require 'prime'

if (ARGV.length == 0 || ARGV.length > 1) then
  print "Make a listing of prime days in a year.\n"
  print "Usage: #{$0} <year>\n"
  exit 1
end

if ARGV.length == 1 then
  year = ARGV[0].to_i
end

if (year < 1) then 
  print "Must be more than 0.\n"
  exit 1
end

if (year % 400 == 0) || (year % 100 != 0) && (year % 4 == 0) then
  days = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
else 
  days = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
end

( 1 .. 12 ).each do |month|
  ( 1 .. days[month - 1] ).each do |day|
    d = year * 10000 + month * 100 + day
    if d.prime? then
      puts d
    end
  end
end
