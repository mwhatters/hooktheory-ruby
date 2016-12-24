module HookTheory
  class Song
    attr_reader :artist, :song, :section, :url
    def initialize(options = {})
      @artist = options["artist"]
      @song = options["song"]
      @section = options["section"]
      @url = options["url"]
    end
  end
end
