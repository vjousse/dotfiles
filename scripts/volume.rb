#!/usr/bin/ruby
# Taken from: https://gist.github.com/814634

# Pulseaudio volume control
class Pulse
  attr_reader :volumes, :mutes

  # Constructor
  def initialize
    dump = `pacmd dump`.lines
    @volumes = {}
    @mutes = {}

    # Find the volume settings
    dump.each do |line|
      args = line.split

      # Volume setting
      if args[0] == "set-sink-volume" then
        @volumes[args[1]] = args[2].hex
      end

      # Mute setting
      if args[0] == "set-sink-mute" then
        @mutes[args[1]] = args[2] == "yes"
      end
    end
  end

  # Adjust the volume with the given increment for every sink
  def volume_set_relative(increment)
    @volumes.keys.each do |sink|
      volume = @volumes[sink] + increment
      volume = [[0, volume].max, 0x10000].min
      @volumes[sink] = volume
      `pacmd set-sink-volume #{sink} #{"0x%x" % volume}`
    end
  end

  # Turn the music up!
  def volume_up
    volume_set_relative 0x1000
  end

  # ... and down again
  def volume_down
    volume_set_relative -0x1000
  end

  # Toggle the mute setting for every sink
  def mute_toggle
    @mutes.keys.each do |sink|
      mute = !(@mutes[sink])
      @mutes[sink] = mute
      `pacmd set-sink-mute #{sink} #{mute ? "yes" : "no"}`
    end
  end
end

# Control code
p = Pulse.new
if ARGV.first == "up" then p.volume_up end
if ARGV.first == "down" then p.volume_down end
if ARGV.first == "toggle" then p.mute_toggle end
