require 'sprockets'
require 'tilt'
require 'sass'

module Themify
  class TemplateEngine < Tilt::Template
    def self.default_mime_type; 'text/css'; end

    def prepare
      @templates = Themify.templates
    end

    def evaluate(scope, locals, &block)
      css_files = []
      @templates.each.with_index do |template, template_index|
        tree = ::Sass::Engine.new(data, sass_options).to_tree
        process_node tree, template, template_index + 1
        css_files << tree.to_sass
      end
      out = ''
      css_files.each.with_index { |css, i| out << "/* Template #{i+1} */\n\n#{css} \n" }
      out
    end

    private
      def sass_options
        options.merge filename: eval_file, line: line, syntax: :sass
      end

      def process_node node, template, template_index
        if node.is_a?(Sass::Tree::RootNode)
          template_root = Sass::Tree::RuleNode.new([".template-#{template.name}"])
          template_root.children = node.children
          node.children = [template_root]
        end
        if node.has_children
          node.children.each { |node| process_node node, template, template_index }
        elsif node.is_a?(Sass::Tree::PropNode)
          if node.value.is_a?(Sass::Script::Tree::ListLiteral)
            node.value.children.each.with_index do |element, i|
              if element.is_a?(Sass::Script::Tree::Variable) && element.name =~ /template_[\w]+/
                node.value.children[i] = Sass::Script::Parser.parse(template.colors[element.name[/template_([\w]+)/,1]], 0, 0)
              end
            end
          end
          if node.value.is_a?(Sass::Script::Tree::Variable) && node.value.name =~ /template_[\w]+/
            node.value = Sass::Script::Parser.parse(template.colors[node.value.name[/template_([\w]+)/,1]], 0, 0)
          end
        end
      end
  end
end