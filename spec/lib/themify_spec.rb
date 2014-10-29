require 'spec_helper'

describe Themify do
  it 'raises an exception if you try to add a template of the wrong class' do
    expect{ Themify.add_template(Hash.new) }.to raise_exception
  end

  it 'adds a template to the list of templates' do
    template = Themify::Template.new('default', {})
    Themify.add_template(template)
    expect(Themify.templates.first).to eq(template)
  end

  it 'returns an empty list of templates if none has been added' do
    expect(Themify.templates).to eq([])
  end
end