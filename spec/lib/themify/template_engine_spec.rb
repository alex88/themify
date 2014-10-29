require 'spec_helper'

describe Themify::TemplateEngine do
  context 'without templates' do
    it 'outputs an empty file without templates' do
      template = Themify::TemplateEngine.new { |t| ".label\n  background-color: #ffffff" }
      expect(template.render).to eq('')
    end
  end

  context 'with templates' do
    it 'prepends the content with each template name as class selector' do
      Themify.add_template(Themify::Template.new('default', {}))
      template = Themify::TemplateEngine.new { |t| ".label\n  background-color: #ffffff" }
      expect(template.render).to eq("/* Template 1 */\n\n.template-default\n  .label\n    background-color: #ffffff\n \n")
    end

    it 'replaces the variable with the template value' do
      Themify.add_template(Themify::Template.new('default', { 'main' => '#ffffff' }))
      template = Themify::TemplateEngine.new { |t| ".label\n  background-color: $template_main" }
      expect(template.render).to eq("/* Template 1 */\n\n.template-default\n  .label\n    background-color: #ffffff\n \n")
    end

    it 'works with lists as node values' do
      Themify.add_template(Themify::Template.new('default', { 'main' => '#ffffff' }))
      template = Themify::TemplateEngine.new { |t| ".label\n  background-color: $template_main !important" }
      expect(template.render).to eq("/* Template 1 */\n\n.template-default\n  .label\n    background-color: #ffffff !important\n \n")
    end
  end
end