#!/usr/bin/env ruby
require 'thread'

$queue = Queue.new

class Looper
  def go
    i = 0
    continue = true

    Signal.trap("TERM") do
      puts "Spinning down..."
      continue = false
    end

    while continue do
      $queue << i += 1
      sleep 0.5
    end
  end
end

class Worker
  def work
    loop do
      if $queue.length == 0
        puts "Working dying..."
        return
      end
      i = $queue.pop
      puts "#{Thread.current.object_id} #{i} #{$queue.length}"
      sleep(rand(4..7))
    end
  end
end

producer = Thread.new do
  Looper.new.go
end

sleep 5

consumers = []

ARGV.first.to_i.times do
  consumers << Thread.new do
    Worker.new.work
  end
end

loop do
  consumers.each(&:join) if consumers.size == 0
end
