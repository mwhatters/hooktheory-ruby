module HookTheory
  class Node
    attr_reader :chord_id, :chord_html, :probability, :child_path
    def initialize(options = {})
      @chord_id = options["chord_ID"]
      @chord_html = options["chord_HTML"]
      @probability = options["probability"]
      @child_path = options["child_path"]
    end
  end
end
